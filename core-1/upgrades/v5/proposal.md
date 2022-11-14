## Persistence v5

This is a proposal to do a software upgrade to the v5.0.0 software
tag of the Persistence codebase on block height xxx, which is estimated
to occur on **xxx**. Block times have high variance, so please monitor
the chain for more precise time estimates.

## Upgrade Features
This upgrade adds the following features:

### pstake-native v1.2.0
* Ablity to reopen ibc channels for ICA/ICQ on channel close
* Since ICA channels are ordered, they close on error, txn added so anyone can open the channel if closed

### Fail previous claims: Upgrade Handler
* Upgrade handler code to fix the state of mainnet due to ICA channel close

### Others
* Upgrade cosmos-sdk to v0.45.10
* Upgrade IBC-go to v3.4.0
* Upgrade pstake-native v1.2.0
* Upgrade tindermint to v0.34.22

[Full Change Log](https://github.com/persistenceOne/persistenceCore/compare/v4.0.0...v5.0.0)

## Getting Prepared for the Upgrade

As always, we recommend validators utilize 64GB of RAM. Since state migration is relatively negligible in this upgrade, it is likely possible to get away with less, but still not recommended. If you are unable to have 64GB of RAM, at a minimum have a total of 64GB of swap set to prevent out of memory errors.

If using cosmovisor, manually build & copy the persistenceCore binary to /cosmovisor/upgrades/v5/bin/.

If not using cosmovisor, wait for your node to halt at the upgrade height, then install and run the v5.0.0 binary.


## Details of Upgrade Time

The proposal targets the upgrade proposal block to be **xxx**, anticipated to be on **xxx**. Note that block times have high variance, so keep monitoring the time. See countdown [here](https://www.mintscan.io/persistence/blocks/xxx).

The upgrade is anticipated to take approx 30 minutes, during which time, there will not be any on-chain activity on the network.

In the event of an issue at upgrade time, we should coordinate via the validators channel in discord to come to a quick emergency consensus and mitigate any further issues.
