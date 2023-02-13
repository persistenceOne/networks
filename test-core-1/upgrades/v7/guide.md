# v6 to v7

Persistence v7 gov proposal: [x](https://testnet.ping.pub/test-core-1/gov/x) \
Height: [x](https://testnet.ping.pub/test-core-1/gov/x) (Countdown) \
Release: [v7.0.0-rc0](https://github.com/persistenceOne/persistenceCore/releases/tag/v7.0.0-rc0)

**NOTE: Please use `go 1.19.3+` version**

## What changed

- Upgraded `cosmos-sdk` from `v0.45.11` to [v0.45.12](https://github.com/cosmos/cosmos-sdk/blob/v0.45.12/CHANGELOG.md)
- Using informal system fork of tendermint [v0.34.25](https://github.com/informalsystems/tendermint/blob/v0.34.25/CHANGELOG.md)
- Upgraded `wasmd` from `v0.29.2` to [v0.30.0](https://github.com/CosmWasm/wasmd/blob/v0.30.0/CHANGELOG.md)
- Upgraded `ibc-go` from `v3.4.0` to [v4.3.0](https://github.com/cosmos/ibc-go/releases/tag/v4.3.0)  
    ICS29 - Fee Middleware was introduced in `ibc-go@v4`.  
    But we've not integrated this in our chain for now.

## How to upgrade

- [Upgrade using cosmovisor](https://docs.persistence.one/build/nodes-and-endpoints/join-testnet#cosmovisor)
- [Upgrade manually](https://docs.persistence.one/build/nodes-and-endpoints/join-testnet#manual-option)

## Communications

Operators are encouraged to join the [#validators-discussion](https://discord.gg/hnvDDzRFrV)
channel of the Persistence Community Discord. This channel is the primary communication tool
for operators to ask questions, report upgrade status, report technical issues, and to build
social consensus should the need arise. If you don't have access, please reach out to someone
from the Persistence team directly.
