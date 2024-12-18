# Avalanche-contract-template


Foundry Verification (Separated Recipe)

With Foundry you can verify at deployment time or verify with a separate command, be sure to add `--verifier-url` to your deploy or verify script.

To verify at deployment time:
```
forge script scripts/Deploy.s.sol
--broadcast --rpc-url [NETWORK_RPC_URL]
--verifier-url 'https://api.routescan.io/v2/network/mainnet/evm/43114/etherscan'
--etherscan-api-key "verifyContract"
```
