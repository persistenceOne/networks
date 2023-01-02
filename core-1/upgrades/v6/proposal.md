## Persistence v6

This is a proposal to do a software upgrade to the v6.0.0 software
tag of the Persistence codebase on block height 9601000, which is estimated
to occur on **12:11 PM GMT, 11th Jan 2023**. Block times have high variance, so please monitor
the chain for more precise time estimates. Please check the exact time on the [countdown](https://www.mintscan.io/persistence/blocks/9601000)

## Upgrade Features
This upgrade adds the following features:

### Untombstoning
v6 upgrade will untombstone and unslash validators which were tombstoned on the v5 upgrade process.
Please check [proposal 10](https://www.mintscan.io/persistence/proposals/10) for more details.

### Fix pSTAKE c-value
Upon testing of stkATOM on Persistence mainnet prior to launch, an edge-case that skews the c-value or the exchange rate between stkATOM/ATOM drastically was found. This upgrade fixes that by minting new stkATOM against the ATOM deposited to the Reward rate ICA account (which is what caused the exchange rate to jump from 1 to 1.67). This would reset the exchange rate to 1 and result in a greater user experience at launch for pSTAKE.

### Others
* Upgrade cosmos-sdk to v0.45.11
* Upgrade cosmos IAVL to v0.19.4
* Upgrade wasmd to v0.29.2
* Upgrade pstake-native v1.3.1
* Upgrade tendermint to v0.34.23

[Full Change Log](https://github.com/persistenceOne/persistenceCore/compare/v5.0.0...v6.0.0)

## Getting Prepared for the Upgrade

If using cosmovisor, manually build & copy the persistenceCore binary to `/cosmovisor/upgrades/v6/bin/`.
Please follow the [upgrade guide](https://github.com/persistenceOne/networks/blob/master/core-1/upgrades/v6/guide.md)

If not using cosmovisor, wait for your node to halt at the upgrade height, then install and run the v6.0.0 binary.

Note: Please use go version `v1.19.3+` as part of v6 upgrade


## Details of Upgrade Time

The proposal targets the upgrade proposal block to be **9601000**, anticipated to be on 11th Jan 2023.
Note that block times have high variance, so keep monitoring the time. See countdown [here](https://www.mintscan.io/persistence/blocks/9601000).

The upgrade is anticipated to take approx 30 minutes, during which time, there will not be any on-chain activity on the network.

In the event of an issue at upgrade time, we should coordinate via the validators channel in discord to come to a quick emergency consensus and mitigate any further issues.

