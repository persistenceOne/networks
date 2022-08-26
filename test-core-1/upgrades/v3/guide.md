# Upgrade v2 to v3

This upgrade is a large feature upgrade to Persistence chain. It brings in [cosmwasm](https://docs.cosmwasm.com/docs/1.0/) module, [Inter Chain Account](https://blog.cosmos.network/interchain-accounts-take-cosmos-interoperability-to-the-next-level-39c9a8aad4ad) host capabilities.

The feature of this upgrade are:
* Fixing snapshot and `upgrade-info.json` directories. (More details below)
* Windows and ARM support for persistence chain being deprecated due to wasm integration
* Upgrade go (`v1.18`) and cosmos-sdk (`v0.45.6`) versions

See more in [release](https://github.com/persistenceOne/persistenceCore/releases/tag/v3.0.1) details

## Getting prepared for the upgrade

### Requirements for running WASM
We currently only support Intel/AMD64 CPUs and OSX or Linux. For Linux, the standard build commands work for glibc systems (Ubuntu, Debian, CentOS, etc). If you wish to compile for a muslc based system (like alpine), you need to compile a static library wasmvm locally and compile go with the muslc build tag.

This limit comes from the Rust dll we use to run the wasm code, which comes from wasmvm. There are open issues for adding ARM support, and adding Windows support. However, these issues are not high on the roadmap and unless you are championing them, please count on the current limits for the near future.

### Generate v3 binary
To prepare for the upgrade, you need to create some folders, and build and install the new binary.

```bash
mkdir -p $HOME/.persistenceCore/bin  # temporarily store v3 binary here

git clone https://github.com/persistenceOne/persistenceCore.git
git checkout v3.0.1
VERSION=3.0.1 make build

cp build/persistenceCore ~/.persistenceCore/bin/persistenceCore
```

### Check upgrade info directory
Need a check that the data directory for snapshots and the upgrade handler is the correct one. This can be checked by running commands.

```bash
.$HOME/
├── current -> genesis or upgrades/<name>
├── data/
|   ├── snapshots/
|   └── upgrade-info.json # run without --home, default
└── .persistenceCore/
└── data/
├── snapshots/
├── upgrade-info.json  # if exists no need to copy
└── ...
```

If `snapshots/` directory exists in the above list, then need to copy the `upgrade-info.json` after the chain halt to the proper location, `$HOME/.persistenceCore/data` directory.
If the `snapshots/` directory exists in the location `$HOME/.persistenceCore/data` than no need to do anything special after the chain halt.

### Details on chain upgrade
When the network reaches the halt height, the state machine program of the PersistenceCore mainnet will be halted. The classic method for upgrading requires all validators and node operators to manually substitute the existing state machine binary with the new binary. Because it is an onchain upgrade process, the blockchain will be continued with all the accumulated history with continuous block height.

Due to the bug in `v0.2.*` the validators need to run an additional command after the chain halt and before starting the chain with new binaries.

```bash
# when chain stops at upgrade height

cp $HOME/data/upgrade-info.json $HOME/.persistenceCore/data

# change the binaries to the latest and then start the chain
```

## Steps for upgrade
* Verify you are currently running version `v0.2.3` of persistenceCore.
* Wait till the chain comes to halt at the upgrade height. Logs will show need for v3 after height.
* Stop the chain once halted
* Use the binary created in the [step](https://github.com/persistenceOne/networks/wiki/V3-Upgrade-Guide#generate-v3-binary)
* Replace old binary with new binary `$HOME/.persistenceCore/bin/persistenceCore`
* Verify version of persistenceCore is `v3.0.1`
* Important step: Copy the upgrade info to correct directories. (if `--home` was not used for running persistenceCore v0.2.*)
```
cp $HOME/data/upgrade-info.json $HOME/.persistenceCore/data
```
* If `--home=<home-dir>` was used then `upgrade-info.json` will be created at `<home-dir>/data`, nothing needs to be done then.
* Start your node with correct version
* Wait until 2/3+ of voting power has upgraded for the network to start producing blocks
* You can use the following commands to check peering status and state: you need jq installed
```bash
curl -s http://127.0.0.1:26657/net_info | grep n_peers

curl -s localhost:26657/consensus_state | jq -r .result.round_state.height_vote_set[].prevotes_bit_array
```

## Rollback plan
In the event of unexpected challenges, the core teams, after conferring with operators and attaining social consensus, may choose to declare that the upgrade will be skipped.

Steps to skip this upgrade proposal are simply to resume the core-1 network with the (downgraded) v0.2.3 binary using the following command:

```bash
persistenceCore start --unsafe-skip-upgrade xxx
```
Note: There is no particular need to restore a state snapshot prior to the upgrade height, unless specifically directed by core teams.

Important: A social consensus decision to skip the upgrade will be based solely on technical merits, thereby respecting and maintaining the decentralized governance process of the upgrade proposal's successful YES vote.

## Communications
Operators are encouraged to join the [`#validators-lobby`](https://discord.gg/hwbynVYDZ7) channel of the Persistence Community Discord. This channel is the primary communication tool for operators to ask questions, report upgrade status, report technical issues, and to build social consensus should the need arise.

## Troubleshooting
### make not found
If make is not installed in the system run
```
sudo apt update
sudo apt install make
```

### GCC error while building
For ledger support, if error encountered, then we suggest to install gcc via build essentials
```
  Makefile:42: *** gcc not installed for ledger support, please install or set LEDGER_ENABLED=false.  Stop.
```
Run
```
sudo apt update
sudo apt install build-essential
```

### go not found
When encountering go error, if go was not previously installed on the node
```
/bin/sh: 1: go: not found
```
then follow the [steps to install go](https://go.dev/doc/install) `v1.18`
