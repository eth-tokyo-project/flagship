import {SoulBound1155} from "./ERC1155-Soulbound.sol";

import {Owned} from "solmate/auth/Owned.sol";
import {LibString} from "solmate/utils/LibString.sol";
import {Base64} from "openzeppelin-contracts/contracts/utils/Base64.sol";
import {SvgRender} from "./SvgRender.sol";
import {ECDSA} from "openzeppelin-contracts/contracts/utils/cryptography/ECDSA.sol";

contract Badges1155 is SoulBound1155, Owned(msg.sender) {
    struct Challenge {
        bytes32 title;
        bytes32 challengeName;
        bytes32 description;
        address challenge;
        uint96 winners;
    }

    error errWrongSignature();
    error errCantMintMoreThanOnce();

    uint256 public totalChallenges = 0;

    string private baseurl;

    mapping(address challenge => uint256 challengeId) public challengesAddrToId;
    mapping(uint256 challengeId => Challenge metadata) public challenges;

    mapping(address minter => bool) public isMinter;

    constructor() {}

    function addMinter(address minter) public onlyOwner {
        isMinter[minter] = true;
    }

    function removeMinter(address minter) public onlyOwner {
        delete isMinter[minter];
    }

    function setBaseUrl(string calldata url) public onlyOwner {
        baseurl = url;
    }

    function mint(
        address player,
        address challenge,
        bytes32 title,
        bytes32 challengeName,
        bytes32 desc,
        bytes calldata signature
    ) external {
        // lets create the expected hash message
        bytes32 hash = keccak256(abi.encodePacked(address(this), challenge, player, title, challengeName, desc));
        bytes32 message = ECDSA.toEthSignedMessageHash(hash);

        // if signer is not a minter, or the signature is wrong, revert
        (address recovered, ECDSA.RecoverError error) = ECDSA.tryRecover(message, signature);
        if (error != ECDSA.RecoverError.NoError || isMinter[recovered] == false) {
            revert errWrongSignature();
        }

        // lets check if the challenge already exists
        uint256 tokenId = challengesAddrToId[challenge];

        // if it does not exist, lets create it
        if (tokenId == 0) {
            tokenId = ++totalChallenges;
            challengesAddrToId[challenge] = tokenId;
            challenges[tokenId] = Challenge(title, challengeName, desc, challenge, 1);
        } else {
            // if it does exist, lets update the metadata
            challenges[tokenId].title = title;
            challenges[tokenId].challengeName = challengeName;
            challenges[tokenId].description = challengeName;
            challenges[tokenId].winners += 1;
        }

        // if the player already has the badge, revert
        if (balanceOf[player][tokenId] > 0) {
            revert errCantMintMoreThanOnce();
        }

        // lets mint the badge
        _mint(player, tokenId, 1, "");
    }

    function uri(uint256 id) public view override returns (string memory ret) {
        require(challenges[id].challenge != address(0), "challenge does not exist");
        // example render SvgRender.render("titel main", 3,"subti","description");
        Challenge memory c = challenges[id];

        string memory imageURI = Base64.encode(
            bytes(
                SvgRender.render(
                    bytes32ToStr(c.title),
                    uint256(c.winners),
                    bytes32ToStr(c.challengeName),
                    bytes32ToStr(c.description)
                )
            )
        );

        return string.concat(
            "data:application/json;base64,",
            Base64.encode(
                bytes(
                    string.concat(
                        '{"name":"',
                        bytes32ToStr(c.title),
                        " - ",
                        bytes32ToStr(c.challengeName),
                        '","description":"',
                        bytes32ToStr(c.description),
                        '","image":"data:image/svg+xml;base64,',
                        imageURI,
                        '","external_url":"',
                        baseurl,
                        "/tracks?contract=",
                        LibString.toString(uint256(uint160(c.challenge))),
                        '"}'
                    )
                )
            )
        );
    }

    function bytes32ToStr(bytes32 _bytes32) public pure returns (string memory ret) {
        // string memory str = string(_bytes32);
        // TypeError: Explicit type conversion not allowed from "bytes32" to "string storage pointer"
        // thus we should fist convert bytes32 to bytes (to dynamically-sized byte array)

        bytes memory bytesArray = new bytes(32);
        for (uint256 i; i < 32; i++) {
            bytesArray[i] = _bytes32[i];
            if (_bytes32[i] == bytes1(0)) {
                return ret;
            }
            ret = string.concat(ret, string(abi.encodePacked(_bytes32[i])));
        }
        return string(bytesArray);
    }
}
