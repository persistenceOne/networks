# Persistence v7

This is a proposal to do a software upgrade to the v7.0.0-rc0 software tag of the Persistence codebase on block height 10209300, which is estimated to occur on **[10209300](https://testnet.mintscan.io/persistence-testnet/blocks/10209300)**. Block times have high variance, so please monitor
the chain for more precise time estimates.

## Dependency upgrades

* Upgraded `cosmos-sdk` from `v0.45.11` to `v0.45.12` ([CHANGELOG](https://github.com/cosmos/cosmos-sdk/blob/v0.45.12/CHANGELOG.md))
* Using informal system fork of tendermint, from [v0.34.23](https://github.com/tendermint/tendermint/tree/v0.34.23) to [v0.34.25](https://github.com/informalsystems/tendermint/tree/v0.34.25) ([CHANGELOG](https://github.com/informalsystems/tendermint/blob/v0.34.25/CHANGELOG.md))
* Upgraded `wasmd` from `v0.29.2` to `v0.30.0` ([CHANGELOG](https://github.com/CosmWasm/wasmd/blob/v0.30.0/CHANGELOG.md))
* Upgraded `ibc-go` from `v3.4.0` to `v4.3.0` ([CHANGELOG](https://github.com/cosmos/ibc-go/blob/v4.3.0/CHANGELOG.md))  
    ICS29 - Fee Middleware was introduced in `ibc-go@v4`, but disabled for this upgrade.
* Upgraded `persistence-sdk` from `v1.0.0` to `v2.0.0-rc0` ([CHANGELOG](https://github.com/persistenceOne/persistence-sdk/releases/tag/v2.0.0-rc0))
* Upgraded `pstake-native` from `v1.4.0` to `v2.0.0-rc0` ([CHANGELOG](https://github.com/persistenceOne/pstake-native/releases/tag/v2.0.0-rc0))

[Full Change Log](https://github.com/persistenceOne/persistenceCore/compare/v6.1.0...v7.0.0-rc0)

Please follow [this](https://github.com/persistenceOne/networks/blob/master/test-core-1/upgrades/v7/guide.md) guide for upgrade

## Details of Upgrade Time

The proposal targets the upgrade proposal block to be **10209300**. Note that block times have high variance, so keep monitoring the time. See countdown [here](https://testnet.mintscan.io/persistence-testnet/blocks/10209300).

The upgrade is anticipated to take approx 30 minutes, during which time, there will not be any on-chain activity on the network.

In the event of an issue at upgrade time, we should coordinate via the validators channel in discord to come to a quick emergency consensus and mitigate any further issues.
