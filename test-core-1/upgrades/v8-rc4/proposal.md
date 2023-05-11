# Persistence v8-rc4

This is a proposal to do a software upgrade to the `v8.0.0-rc4` software tag of the Persistence codebase on block height **[11294600](https://testnet.mintscan.io/persistence-testnet/blocks/11294600)**, which is estimated to occur on Monday 15 May 2023 around 10:30AM GMT. Block times have high variance, so please monitor the chain for precise time

## Dependency upgrades

* Upgraded wasmvm to `v1.1.2` (fixes cherry - see [NOTES](https://github.com/CosmWasm/wasmvm/releases/tag/v1.1.2))
* Upgraded `persistence-sdk` from `v2.1.0-rc1` to `v2.1.0-rc3` ([CHANGELOG](https://github.com/persistenceOne/persistence-sdk/releases/tag/v2.1.0-rc3))

## Bugfixes

[Full Change Log](https://github.com/persistenceOne/persistenceCore/compare/v8.0.0-rc2...v8.0.0-rc4)

Please follow [this](https://github.com/persistenceOne/networks/blob/master/test-core-1/upgrades/v8-rc4/guide.md) guide for upgrade

## Details of Upgrade Time

The proposal targets the upgrade proposal block to be **11294600**. Note that block times have high variance, so keep monitoring the time. See countdown [here](https://testnet.mintscan.io/persistence-testnet/blocks/11294600).

The upgrade is anticipated to take approx 30 minutes, during which time, there will not be any on-chain activity on the network.

In the event of an issue at upgrade time, we shall coordinate via the [testnet-validators-discussion](https://discord.com/channels/796174129077813248/1042043039113289778) channel in discord to come to a quick emergency consensus and mitigate any further issues
