# Avalanche-contract-template


## Deploy without verification
```
forge script script/Deploy.s.sol:DeployScript --rpc-url fuji-c --broadcast  -vvvv
```

## Txhash
- https://testnet.snowtrace.io/tx/0x03a5247833f75ab3f0c22e7faa18b135f15a386fad391d7218a5127cf833662f

## Contract address
- ``0x6DF51Cf47180f082367b8156B539de9B574C28fd``

## Verification
With Foundry you can verify at deployment time or verify with a separate command, be sure to add `--verifier-url` to your deploy or verify script.

To verify at deployment time:
```
forge script scripts/Deploy.s.sol
--broadcast --rpc-url fuji-c
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
