# deployments


## TAIKO

<table>

<tr>
<th>Contract</th>
<th>Address</th>
</tr>

<tr>
<td>badge</td>
<td>https://explorer.a2.taiko.xyz/address/0xa1324f953e8e75a09593Ed7473722690cC624D54</td>
</tr>

<tr>
<td>challengeManager</td>
  
<td>https://explorer.a2.taiko.xyz/address/0xB40144707F71e3e132327F528263aFB0bA458821</td>
</tr>

<tr>
<td>challenge1</td>
<td>https://explorer.a2.taiko.xyz/address/0x4eE2ad8a12E6D5b272994bF2393aF5D0332Acc86</td>
</tr>

<tr>
<td>challenge2</td>
<td>https://explorer.a2.taiko.xyz/address/0x84AD75721aE069C3056d4577F687E51Da1F61a20</td>
</tr>

<tr>
<td>challenge3</td>
<td>https://explorer.a2.taiko.xyz/address/0x7DFeDC5D8376f2fC882d58dD4F64e8008024bAba</td>
</tr>

</table>

## Scroll

<table>

<tr>
<th>Contract</th>
<th>Address</th>
</tr>

<tr>
<td>badge</td>
<td>https://blockscout.scroll.io/address/0xa1324f953e8e75a09593Ed7473722690cC624D54</td>
</tr>

<tr>
<td>challengeManager</td>
<td>https://blockscout.scroll.io/address/0xB40144707F71e3e132327F528263aFB0bA458821</td>
</tr>

<tr>
<td>challenge1</td>
<td>https://blockscout.scroll.io/address/0x4eE2ad8a12E6D5b272994bF2393aF5D0332Acc86</td>
</tr>

</table>

## Mantle

<table>

<tr>
<th>Contract</th>
<th>Address</th>
</tr>

<tr>
<td>badge</td>
<td>https://explorer.testnet.mantle.xyz/address/0xa1324f953e8e75a09593Ed7473722690cC624D54</td>
</tr>

<tr>
<td>challengeManager</td>
<td>https://explorer.testnet.mantle.xyz/address/0x0792081C227E0F31CB11f5f3fE74eB9032d6afA1</td>
</tr>

<tr>
<td>challenge1</td>
<td>https://explorer.testnet.mantle.xyz/address/0xB40144707F71e3e132327F528263aFB0bA458821</td>
</tr>

</table>

## Celo

"challenge1": {
    "https://explorer.celo.org/alfajores/address/0x4eE2ad8a12E6D5b272994bF2393aF5D0332Acc86"
},
"badge": {
    "https://explorer.celo.org/alfajores/address/0xa1324f953e8e75a09593Ed7473722690cC624D54"
},
"challengeManager": {
    "https://explorer.celo.org/alfajores/address/0xB40144707F71e3e132327F528263aFB0bA458821"
},
"challenge2": {
    "https://explorer.celo.org/alfajores/address/0x84AD75721aE069C3056d4577F687E51Da1F61a20"
},
"challenge3": {
    "https://explorer.celo.org/alfajores/address/0x7DFeDC5D8376f2fC882d58dD4F64e8008024bAba"
}

## Polygon ZK EVM

"badge": {
    "https://testnet-zkevm.polygonscan.com/address/0xa1324f953e8e75a09593Ed7473722690cC624D54"
},
"challengeManager": {
    "https://testnet-zkevm.polygonscan.com/address/0xB40144707F71e3e132327F528263aFB0bA458821"
},
"challenge1": {
    "https://testnet-zkevm.polygonscan.com/address/0x4eE2ad8a12E6D5b272994bF2393aF5D0332Acc86"
},
"challenge2": {
    "https://testnet-zkevm.polygonscan.com/address/0x84AD75721aE069C3056d4577F687E51Da1F61a20"
},
"challenge3": {
    "https://testnet-zkevm.polygonscan.com/address/0x7DFeDC5D8376f2fC882d58dD4F64e8008024bAba"
}



# deploy contracts
```
source .env    
```

```
forge script script/Deploy.s.sol --rpc-url=${RPC} --broadcast --private-key=${PRIVATE_KEY} 
```

add `--legacy` flag if get `Error: Failed to get EIP-1559 fees`.


# Run tests
.env
```
MAINNET_RPC_URL="https://rpc.ankr.com/eth"
```

```
source .env    
```

```
forge test --fork-url ${MAINNET_RPC_URL}
```
