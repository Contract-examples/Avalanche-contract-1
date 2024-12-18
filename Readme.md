# Avalanche-contract-template



With Foundry you can verify at deployment time or verify with a separate command, be sure to add `--verifier-url` to your deploy or verify script.

To verify at deployment time:
```
forge script scripts/Deploy.s.sol
--broadcast --rpc-url [NETWORK_RPC_URL]
--verifier-url 'https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan'
--etherscan-api-key "verifyContract"
```

To verify a contract if you already deployed :
```
forge verify-contract [contract-address] [src/path/ContractPath.sol:ContractName]
--verifier-url 'https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan'
--etherscan-api-key "verifyContract"
--num-of-optimizations 200
--compiler-version [solc compiler version]
--constructor-args $(cast abi-encode "constructor(address param1, uint256 param2,...)" param1 param2 ...)
```
