# Persistence v8

This is a proposal to do a software upgrade to the v8.0.0-rc0 software tag of the Persistence codebase on block height **[{height}](https://testnet.mintscan.io/persistence-testnet/blocks/{height})**, which is estimated to occur on {timestamp}. Block times have high variance, so please monitor the chain for precise time

## Dependency upgrades

* Upgraded `cosmos-sdk` from `v0.45.12` to `v0.46.11` ([CHANGELOG](https://github.com/cosmos/cosmos-sdk/blob/v0.46.11/CHANGELOG.md))
* Migrated to [CometBFT v0.34.27](https://github.com/cometbft/cometbft/blob/v0.34.27/CHANGELOG.md#v03427)
* Migrated to notionals wasmd [v0.30.0-sdk469.4](https://github.com/notional-labs/wasmd/blob/v0.30.0-sdk469.4/CHANGELOG.md#v0300-2022-12-02)
* Upgraded `ibc-go` from `v4.3.0` to `v6.1.0` ([CHANGELOG](https://github.com/cosmos/ibc-go/blob/v6.1.0/CHANGELOG.md))  
    ICS29 - Fee middleware is enabled in this upgrade.
* Upgraded `persistence-sdk` from `v2.0.0` to `v3.0.0-rc0` ([CHANGELOG](https://github.com/persistenceOne/persistence-sdk/releases/tag/v3.0.0-rc0))
* Upgraded `pstake-native` from `v2.0.0` to `v3.0.0-rc0` ([CHANGELOG](https://github.com/persistenceOne/pstake-native/releases/tag/v3.0.0-rc0))

## Min Commission Rate

* Minimums commission rate is set to 5%, which was proposed [here](https://www.mintscan.io/persistence/proposals/18)

    > **Note**  
    > During upgrade, If the validator's commission rate is lower than the Min Rate (i.e. 5%), it will be set to 5%.

## Features

* x/lsnative:  
    Adds an implementation to tokenise staked native coins (`XPRT`), forked from [liquidity-staking-module](https://github.com/iqlusioninc/liquidity-staking-module), which forks the original `staking`, `slashing`, `distribution`, `genutil` Cosmos SDK v46 modules.

* x/oracle:  
    This module implements the chain side of our new decentralized price oracle native to the Cosmos ecosystem. It collects prices for the price feeds and allows to query them from other modules and CW contracts.

    > **Note**  
    > The validators are required to run oracle price feeder along with the validator node. Check this doc for [How to setup Oracle Feeder](https://github.com/persistenceOne/persistence-docs/blob/main/build/validators/setup-oracle-feeder.md)

[Full Change Log](https://github.com/persistenceOne/persistenceCore/compare/v7.0.0...v8.0.0-rc0)

Please follow [this](https://github.com/persistenceOne/networks/blob/master/test-core-1/upgrades/v8/guide.md) guide for upgrade

## Details of Upgrade Time

The proposal targets the upgrade proposal block to be **{height}**. Note that block times have high variance, so keep monitoring the time. See countdown [here](https://testnet.mintscan.io/persistence-testnet/blocks/{height}).

The upgrade is anticipated to take approx 30 minutes, during which time, there will not be any on-chain activity on the network.

In the event of an issue at upgrade time, we shall coordinate via the [testnet-validators-discussion](https://discord.com/channels/796174129077813248/1042043039113289778) channel in discord to come to a quick emergency consensus and mitigate any further issues
