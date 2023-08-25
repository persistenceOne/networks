# Persistence v8.1.0

This is a proposal to do a software upgrade to the `v8.1.0` software tag of the Persistence codebase on block height **[1390650](https://testnet.mintscan.io/persistence-testnet/blocks/1390650)**, which is estimated to occur on Monday 28th August 2023 around 11:00 AM UTC. Block times have high variance, so please monitor the chain for precise time.

## Changelog

- Upgrades our Cosmos SDK LSM [fork](https://github.com/persistenceOne/cosmos-sdk) to `v0.47.3-lsm4`` with few fixes to validator bond computations.
- Upgrades pstake-native from `v2.2.0` to [v2.2.3](https://github.com/persistenceOne/pstake-native/releases/tag/v2.3.3) which resolved some issues discovered during audit 

This is a minor upgrade with no state migrations required.


### Other dependencies and upgrades

Checkout the [release log](https://github.com/persistenceOne/persistenceCore/releases/tag/v8.1.0) for what's changed.

## How to upgrade

- [Upgrade using cosmovisor](https://docs.persistence.one/build/nodes-and-endpoints/node-operations/cosmovisor-upgrades)
- [Upgrade manually](https://docs.persistence.one/build/nodes-and-endpoints/node-operations/manual-upgrades)

### Communications

Operators are encouraged to join the [#testnet-validators-discussion](https://discord.gg/aGyvqujJ)
channel of the Persistence Community Discord. This channel is the primary communication tool
for operators to ask questions, report upgrade status, report technical issues, and to build
social consensus should the need arise. If you don't have access, please reach out to someone
from the Persistence team directly.
