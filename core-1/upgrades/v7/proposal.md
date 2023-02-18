# Persistence v7

This is a proposal to do a software upgrade to the v7.0.0 software tag of the Persistence codebase on block height **[10305821](https://www.mintscan.io/persistence/blocks/10305821)**, which is estimated to occur on Tuesday 27 February 2023 around 2:00PM GMT. Block times have high variance, so please monitor the chain for precise time

## Dependency upgrades

* Upgraded `cosmos-sdk` from `v0.45.11` to `v0.45.14` ([CHANGELOG](https://github.com/cosmos/cosmos-sdk/releases/tag/v0.45.14))
* Using informal system fork of tendermint, from [tendermint/v0.34.23](https://github.com/tendermint/tendermint/releases/tag/v0.34.23) to [informalsystems/v0.34.26](https://github.com/informalsystems/tendermint/releases/tag/v0.34.26) ([CHANGELOG](https://github.com/informalsystems/tendermint/blob/v0.34.26/CHANGELOG.md#v03426))
* Upgraded `wasmd` from `v0.29.2` to `v0.30.0` ([CHANGELOG](https://github.com/CosmWasm/wasmd/blob/v0.30.0/CHANGELOG.md))
* Upgraded `ibc-go` from `v3.4.0` to `v4.3.0` ([CHANGELOG](https://github.com/cosmos/ibc-go/blob/v4.3.0/CHANGELOG.md))  
    ICS29 - Fee Middleware was introduced in `ibc-go@v4`, but disabled for this upgrade.
* Upgraded `persistence-sdk` from `v1.0.0` to `v2.0.0` ([CHANGELOG](https://github.com/persistenceOne/persistence-sdk/releases/tag/v2.0.0))
* Upgraded `pstake-native` from `v1.4.0` to `v2.0.0` ([CHANGELOG](https://github.com/persistenceOne/pstake-native/releases/tag/v2.0.0))

[Full Change Log](https://github.com/persistenceOne/persistenceCore/compare/v6.1.0...v7.0.0)

## Upgrade Guide

Please follow [this](https://github.com/persistenceOne/networks/blob/master/core-1/upgrades/v7/guide.md) guide for upgrade

## Details of Upgrade Time

The proposal targets the upgrade proposal block to be **10305821**. Note that block times have high variance, so keep monitoring the time. See countdown [here](https://www.mintscan.io/persistence/blocks/10305821).

The upgrade is anticipated to take approx 15 minutes, during which time, there will not be any on-chain activity on the network.

In the event of an issue at upgrade time, we shall coordinate via the [#validators-discussion](https://discord.gg/hnvDDzRFrV) channel in discord to come to a quick emergency consensus and mitigate any further issues
