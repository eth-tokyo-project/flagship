import {SoulBound1155} from "src/ERC1155-Soulbound.sol";
import {LibString} from "solmate/utils/LibString.sol";

contract MockSouldbound1155 is SoulBound1155 {
    constructor() SoulBound1155() {}

    function mint(address to, uint256 id, uint256 amount) public {
        _mint(to, id, amount, "");
    }

    function uri(uint256 id) public view override returns (string memory ret) {
        return string.concat("https://example.com", LibString.toString(id));
    }
}
