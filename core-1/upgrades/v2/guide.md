PersistenceCore, core-1 v2 upgrade.
===
This on-chain upgrade proposal is for upgrading up Cosmos SDK version from v0.42.4 to v0.44.6. It includes few new modules like authz and feegrant.
* By voting YES to this proposal, you approve of adding these updates to PersistenceCore.
* By voting NO to this proposal, you do not approve of this upgrade.

#### Background
Since the last version of Cosmos SDK there have been a number of updates, fixes and new modules added to the Cosmos SDK, IBC and Tendermint. The following updates are included in persistenceCore v0.2.3:
* Bump [PersistenceCore](https://github.com/persistenceOne/persistenceCore) to [0.2.3](https://github.com/persistenceOne/persistenceCore/releases/tag/v0.2.3) which notably includes fixes for the vesting accounts and two new modules outlined below. For a detailed difference between PersistenceCore [v0.1.3](https://github.com/persistenceOne/persistenceCore/releases/tag/v0.1.3) and [v0.2.3](https://github.com/persistenceOne/persistenceCore/releases/tag/v0.2.3) check [diff between 0.1.3 and 0.2.3](https://github.com/persistenceOne/persistenceCore/compare/v0.1.3...v0.2.3).
* Add the [authz](https://github.com/cosmos/cosmos-sdk/tree/v0.44.6/x/authz/spec) module to the Persistence mainnet. \`x/authz\` is an implementation of a Cosmos SDK module, per [ADR 30](https://github.com/cosmos/cosmos-sdk/blob/v0.44.6/docs/architecture/adr-030-authz-module.md), that allows granting arbitrary privileges from one account (the granter) to another account (the grantee). Authorizations must be granted for a particular Msg service method one by one using an implementation of the \`Authorization\` interface.
* Add the [feegrant](https://github.com/cosmos/cosmos-sdk/tree/v0.44.6/x/feegrant/spec) module to the PersistenceCore mainnet. This module allows accounts to grant fee allowances and to use fees from their accounts. Grantees can execute any transaction without the need to maintain sufficient fees.
* Add [IBC](https://github.com/cosmos/ibc-go) as a standalone module from the Cosmos SDK using version [v2.0.2](https://github.com/cosmos/ibc-go/releases/tag/v2.0.2). See the [CHANGELOG.md](https://github.com/cosmos/ibc-go/blob/v2.0.2/CHANGELOG.md) for details.
* Bumped [Tendermint](https://github.com/tendermint/tendermint) version to [v0.34.14](https://github.com/tendermint/tendermint/releases/tag/v0.34.14). For more details check [CHANGELOG.md](https://github.com/tendermint/tendermint/blob/v0.34.14/CHANGELOG.md#v0.34.14)

#### Ready for Production
The release candidate for this update was run as a local testnet and a public testnet with a successful upgrade.

#### On Chain Upgrade Process
When the network reaches the halt height, the state machine program of the PersistenceCore mainnet will be halted. The classic method for upgrading requires all validators and node operators to manually substitute the existing state machine binary with the new binary. Because it is an onchain upgrade process, the blockchain will be continued with all the accumulated history with continuous block height.

## Steps for upgrade

* Verify you are currently running the correct version (v0.1.3) of the persistenceCore:
```
./persistenceCore version --long
name: persistenceCore
server_name: persistenceCore
version: 0.1.3
commit: a555ac8
build_tags: netgo,ledger
go: go version go1.17.6 linux/amd64
build_deps:
...
``` 

* Wait till the chain comes to a halt at the upgrade height.
* Validators/ nodes are requested to wait till chain halts. There will be a message that will pop up saying needs upgrade v2 after height xx.(Let the other nodes sync for a couple minutes)
  **IMPORTANT: PLEASE WAIT FOR THE BINARY TO HALT ON ITS OWN. UPGRADE HEIGHT IS 5053330. Proceed when the chain halts at this height.**
* Once the chain was halted, please stop the chain if its stopped.
* Download new binaries from https://github.com/persistenceOne/persistenceCore/releases/
* Replace the old binary with new binary.
* Verify if you are running new version of persistenceCore
```
name: persistenceCore
server_name: persistenceCore
version: 0.2.3
commit: ac991cc
build_tags: netgo,ledger
go: go version go1.17.7 linux/amd64
build_deps:
...
```
* Start your node with correct version
* Wait until 2/3+ of voting power has upgraded for the network to start producing blocks
* You can use the following commands to check peering status and state:
  ***you need jq installed***
```
curl -s http://127.0.0.1:26657/net_info | grep n_peers

curl -s localhost:26657/consensus_state | jq -r .result.round_state.height_vote_set[].prevotes_bit_array 
```

## Rollback plan
In the event of unexpected challenges, the core teams, after conferring with operators and attaining social consensus, may choose to declare that the upgrade will be skipped.

Steps to skip this upgrade proposal are simply to resume the core-1 network with the (downgraded) v0.1.3 binary using the following command:
```
persistenceCore start --unsafe-skip-upgrade 5053330
```
Note: There is no particular need to restore a state snapshot prior to the upgrade height, unless specifically directed by core teams.

Important: A social consensus decision to skip the upgrade will be based solely on technical merits, thereby respecting and maintaining the decentralized governance process of the upgrade proposal's successful YES vote.

## Communications
Operators are encouraged to join the `#validators-lobby` channel of the Persistence Community Discord. This channel is the primary communication tool for operators to ask questions, report upgrade status, report technical issues, and to build social consensus should the need arise.

## Validators can put updates on Discord -validators channel.

https://discord.gg/hwbynVYDZ7

## Motivation
https://github.com/cosmos/gaia/blob/main/docs/migration/cosmoshub-4-vega-upgrade.md
https://github.com/cosmos/gaia/releases/tag/v6.0.0
