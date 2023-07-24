# Persistence v8

This is a proposal to do a software upgrade to the `v8.0.0` software tag of the Persistence codebase on block height **[861000](https://testnet.mintscan.io/persistence-testnet/blocks/861000)**, which is estimated to occur on Tuesday 25th July 2023 around 13:15PM GMT. Block times have high variance, so please monitor the chain for precise time.

## Changelog

- Upgrades cosmos-sdk from `v0.45.14` to [v0.47.3](https://github.com/cosmos/cosmos-sdk/releases/tag/v0.47.3) with an LSM [fork](https://github.com/persistenceOne/cosmos-sdk) created by Persistence, including [barberry](https://forum.cosmos.network/t/cosmos-sdk-security-advisory-barberry/10825) security fix
- Migrates from tendermint `v0.34.26` to cometbft `v0.37.2`
- Upgrades ibc-go from `v4.3.1` to [v7.2.0](https://github.com/cosmos/ibc-go/releases/tag/v7.2.0) LSM fork including [huckleberry](https://forum.cosmos.network/t/ibc-security-advisory-huckleberry/10731) security fix
- Upgrades wasmd from `v0.30.0` to [v0.40.2](https://github.com/CosmWasm/wasmd/tree/v0.40.2) LSM fork & wasmvm to `1.2.4` including [cherry](https://github.com/CosmWasm/advisories/blob/main/CWAs/CWA-2023-002.md) bugfix
- **Some SDK 47 things to keep in mind:**
  - The SDK version includes some key store migration for the CLI. Make sure you backup your private keys before testing this! You can not switch back to v45 keys
  - CLI: `add-genesis-account`, `gentx`, `add-genesis-account`, `collect-gentxs` and others are now under `genesis` command as parent
  - CLI: `--broadcast-mode block` was removed. You need to query the result for a TX with `persistenceCore q tx <hash>` instead
- Upgrades persistence-sdk from `v2.0.1` to [v2.1.0](https://github.com/persistenceOne/persistence-sdk/releases/tag/v2.1.0)
- Upgrades pstake-native from `v2.0.0` to [v2.2.0](https://github.com/persistenceOne/pstake-native/releases/tag/v2.2.0)
- Adds wasm-bindings for querying state

### New Modules

- [IBC hooks](https://github.com/cosmos/ibc-apps/tree/main/modules/ibc-hooks)
- [PFM](https://github.com/cosmos/ibc-apps/tree/main/middleware/packet-forward-middleware) (Packet Forwarding Middleware)
- Persistence `x/oracle` - disabled for now, WIP
- Persistence `x/liquidstakeibc` - this deprecates `lscosmos` module
- Skip's [POB](https://github.com/skip-mev/pob) `v1.0.3` for MEV auctions

### MinCommissionRate

- `MinCommissionRate` is set to 5%, which was proposed [here](https://www.mintscan.io/persistence/proposals/18)

    > **Note**  
    > During upgrade,  
    > Validator's `CommissionRate` will be set to `5%`, if it is lower than the `MinCommissionRate` (i.e. 5%),  
    > and Validator's `MaxCommissionRate` will be set to `10%` (if lower than 10%) to give validator some margin to work with.

### MinInitialDepositRatio

- `MinInitialDepositRatio` is set to `25%`, which means a proposal cannot be submitted with deposit lower than `25%` of `MinInitialDeposit`

### MinSelfDelegation

Due to LSM implementation, the `min-self-delegation` flag has no effect anymore and this param is no longer being enforced. Min self delegation is removed from the staking system with the expectation that it will be replaced by the validator bond system. It has been superceded by `ValidatorBondFactor`. To study its definition and side effects, see [Validator Bond in ADR-61](https://github.com/iqlusioninc/cosmos-sdk/blob/v0.45.16-ics-lsm/docs/architecture/adr-061-liquid-staking.md#validator-bond).

### LSM Params

- `ValidatorBondFactor` is set to `250`
- `GlobalLiquidStakingCap` is set to `10%`
- `ValidatorLiquidStakingCap` is set to `50%`

### About pStake v2.2.0

This is a major release for the pStake app, focused on enhancing the liquid staking capabilities of the platform and increase its future functionality and adaptability.

It introduces a new module `liquidstakeibc` which includes major updates and opens up the path for future features, such as chain expansion, while also keeping the core tech up to date in preparation for future groundbreaking updates in the interchain, such as the Liquid Staking Module (LSM).

### Other dependencies and upgrades

Checkout the [release log](https://github.com/persistenceOne/persistenceCore/releases/tag/v8.0.0) for what's changed.

## How to upgrade

- [Upgrade using cosmovisor](https://docs.persistence.one/build/nodes-and-endpoints/node-operations/cosmovisor-upgrades)
- [Upgrade manually](https://docs.persistence.one/build/nodes-and-endpoints/node-operations/manual-upgrades)

### Communications

Operators are encouraged to join the [#testnet-validators-discussion](https://discord.gg/aGyvqujJ)
channel of the Persistence Community Discord. This channel is the primary communication tool
for operators to ask questions, report upgrade status, report technical issues, and to build
social consensus should the need arise. If you don't have access, please reach out to someone
from the Persistence team directly.
