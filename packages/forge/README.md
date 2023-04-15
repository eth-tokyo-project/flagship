# deployments




## deploy contracts
```
source .env    
```

```
forge script script/Deploy.s.sol --rpc-url=${RPC} --broadcast --private-key=${PRIVATE_KEY} 
```

add `--legacy` flag if get `Error: Failed to get EIP-1559 fees`.


## Run tests
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