# v6 to v7

Persistence v7 gov proposal: [x](https://testnet.ping.pub/test-core-1/gov/x) \
Height: [x](https://testnet.ping.pub/test-core-1/gov/x) (Countdown) \
Release: [v7.0.0-rc0](https://github.com/persistenceOne/persistenceCore/releases/tag/v7.0.0-rc0)

**NOTE: Please use `go 1.19.3+` version**

## What changed

- Upgraded `cosmos-sdk` from `v0.45.11` to `v0.45.12` ([CHANGELOG](https://github.com/cosmos/cosmos-sdk/blob/v0.45.12/CHANGELOG.md))
- Using informal system fork of tendermint, from [v0.34.23](https://github.com/tendermint/tendermint/tree/v0.34.23) to [v0.34.25](https://github.com/informalsystems/tendermint/tree/v0.34.25) ([CHANGELOG](https://github.com/informalsystems/tendermint/blob/v0.34.25/CHANGELOG.md))
- Upgraded `wasmd` from `v0.29.2` to `v0.30.0` ([CHANGELOG](https://github.com/CosmWasm/wasmd/blob/v0.30.0/CHANGELOG.md))
- Upgraded `ibc-go` from `v3.4.0` to `v4.3.0` ([CHANGELOG](https://github.com/cosmos/ibc-go/blob/v4.3.0/CHANGELOG.md))  
    ICS29 - Fee Middleware was introduced in `ibc-go@v4`, but disabled for this upgrade.
- Upgraded `persistence-sdk` from `v1.0.0` to `v2.0.0-rc0` ([CHANGELOG](https://github.com/persistenceOne/persistence-sdk/releases/tag/v2.0.0-rc0))
- Upgraded `pstake-native` from `v1.4.0` to `v2.0.0-rc0` ([CHANGELOG](https://github.com/persistenceOne/pstake-native/releases/tag/v2.0.0-rc0))

## How to upgrade

- [Upgrade using cosmovisor](https://docs.persistence.one/build/nodes-and-endpoints/join-testnet#cosmovisor)
- [Upgrade manually](https://docs.persistence.one/build/nodes-and-endpoints/join-testnet#manual-option)

## Communications

Operators are encouraged to join the [#validators-discussion](https://discord.gg/hnvDDzRFrV)
channel of the Persistence Community Discord. This channel is the primary communication tool
for operators to ask questions, report upgrade status, report technical issues, and to build
social consensus should the need arise. If you don't have access, please reach out to someone
from the Persistence team directly.
