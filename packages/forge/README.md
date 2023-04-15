# deployments


## TAIKO

<table>

<tr>
<th>Contract</th>
<th>Address</th>
</tr>

<tr>
<td>badge</td>
<td>[0xa1324f953e8e75a09593Ed7473722690cC624D54](https://explorer.a2.taiko.xyz/address/0xa1324f953e8e75a09593Ed7473722690cC624D54)</td>
</tr>

<tr>
<td>challengeManager</td>
<td>[0xB40144707F71e3e132327F528263aFB0bA458821](https://explorer.a2.taiko.xyz/address/0xB40144707F71e3e132327F528263aFB0bA458821)</td>
</tr>

<tr>
<td>challenge1</td>
<td>[0x4eE2ad8a12E6D5b272994bF2393aF5D0332Acc86](https://explorer.a2.taiko.xyz/address/0x4eE2ad8a12E6D5b272994bF2393aF5D0332Acc86)</td>
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
<td>[0xa1324f953e8e75a09593Ed7473722690cC624D54](https://explorer.testnet.mantle.xyz/address/0xa1324f953e8e75a09593Ed7473722690cC624D54)</td>
</tr>

<tr>
<td>challengeManager</td>
<td>[0x0792081C227E0F31CB11f5f3fE74eB9032d6afA1](https://explorer.testnet.mantle.xyz/address/0x0792081C227E0F31CB11f5f3fE74eB9032d6afA1)</td>
</tr>

<tr>
<td>challenge1</td>
<td>[0xB40144707F71e3e132327F528263aFB0bA458821](https://explorer.testnet.mantle.xyz/address/0xB40144707F71e3e132327F528263aFB0bA458821)</td>
</tr>

</table>

## Scroll



## Celo


## Polygon ZK EVM





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
