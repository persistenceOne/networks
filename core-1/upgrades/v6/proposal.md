## Persistence v6

This is a proposal to do a software upgrade to the v6.0.0 software
tag of the Persistence codebase on block height 9599999, which is estimated
to occur on **11th Jan 2023**. Block times have high variance, so please monitor
the chain for more precise time estimates.

## Upgrade Features
This upgrade adds the following features:

### Untombstoning
v6 upgrade will untombstone validators which were tombstoned on the v5 upgrade process. Please check [proposal 10](https://www.mintscan.io/persistence/proposals/10) for more details.

### Fix pStake c-value
Directly submitted tokens to the cosmos address did not get minted, and skwed the c-value of the pStake product. We will mint corresponding stkAtom to fix the skew of the c-value

### Others
* Upgrade cosmos-sdk to v0.45.11
* Upgrade cosmos IAVL to v0.19.4
* Upgrade wasmd to v0.29.2
* Upgrade pstake-native v1.3.1
* Upgrade tendermint to v0.34.23

[Full Change Log](https://github.com/persistenceOne/persistenceCore/compare/v5.0.0...v6.0.0)

## Getting Prepared for the Upgrade

If using cosmovisor, manually build & copy the persistenceCore binary to /cosmovisor/upgrades/v6/bin/. Please follow the [upgrade guide](https://github.com/persistenceOne/networks/blob/master/core-1/upgrades/v6/guide.md)

If not using cosmovisor, wait for your node to halt at the upgrade height, then install and run the v6.0.0 binary.

Note: Please use go version `v1.19.3+` as part of v6 upgrade


## Details of Upgrade Time

The proposal targets the upgrade proposal block to be **9599999**, anticipated to be on 11th Jan 2023. Note that block times have high variance, so keep monitoring the time. See countdown [here](https://www.mintscan.io/persistence/blocks/xxx).

The upgrade is anticipated to take approx 30 minutes, during which time, there will not be any on-chain activity on the network.

In the event of an issue at upgrade time, we should coordinate via the validators channel in discord to come to a quick emergency consensus and mitigate any further issues.

