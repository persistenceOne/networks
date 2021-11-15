# test-mantle-1
> This chain is a test-net

1st test-net for assetMantle application.

## Hardware Requirements
* **Minimal**
  * 4 GB RAM
  * 200 GB SSD
  * x2 CPU
* **Recommended**
  * 8 GB RAM
  * 500 GB SSD
  * x4 CPU

> NOTE: low endurance(tbw) ssd are not recommended for long term node operation

## Operating System
* Linux/Windows/MacOS(x86)
* **Recommended**
  * Linux(x86_64)

## Installation Steps
>Prerequisite: go1.16+ required. [ref](https://golang.org/doc/install)

>Prerequisite: git. [ref](https://github.com/git/git)

>Optional requirement: GNU make. [ref](https://www.gnu.org/software/make/manual/html_node/index.html)

* Clone git repository
```shell
git clone https://github.com/persistenceOne/assetMantle.git
```
* Checkout release tag
```shell
cd assetMantle
git fetch --tags
git checkout v0.1.1
```
* Install
```shell
make install
```
* Verify version
```
assetNode version
```
> The current version is HEAD-bc9c3cbb5b2c55dad8ee2c7dd125bb8500c95bb0

### Generate keys

`assetClient keys add {{KEY_NAME}}`

or

`assetClient keys add {{KEY_NAME}} --recover` to regenerate keys with your [BIP39](https://github.com/bitcoin/bips/tree/master/bip-0039) mnemonic


## Validator setup
###

* [Install](#installation-steps) assetMantle application
* Initialize node
```shell
assetNode init {{NODE_NAME}} --chain-id test-mantle-1
```
* Replace the contents of your `${HOME}/.assetNode/config/genesis.json` with that of test-mantle-1/final_genesis.json from the `master` branch of [repository](https://github.com/persistenceOne/genesisTransactions).
* Verify checksum `sha265sum genesis.json` matches ########`673d30abd133a13210bf271d8a52aabc3f1b12c0864f543f4313f7f9589bdb53`
* Inside file `${HOME}/.assetNode/config/config.toml`,
  * set `seeds` to ######`"08ab4552a74dd7e211fc79432918d35818a67189@52.69.58.231:26656,449a0f1b7dafc142cf23a1f6166bbbf035edfb10@13.232.85.66:26656,5b27a6d4cf33909c0e5b217789e7455e261941d1@15.222.29.207:26656"`.
  * If your node has a public ip, set it in `external_address = "tcp://<public-ip>:26656"`, else leave the filed empty.
* Set `minimum-gas-prices` in `${HOME}/.assetNode/config/app.toml` with the minimum price you want (example `0.005umantle`) for the security of the network.
* Start node
```shell
assetNode start
```
* Acquire $MANTLE tokens to self delegate to your validator node by asking in [Discord](https://discord.gg/9dWdqxYm3Y)
* Send a create-validator transaction
```
assetCllient tx staking create-validator \
--from {{KEY_NAME}} \
--amount 1000000umantle \
--pubkey "$(assetNode tendermint show-validator)" \
--chain-id test-mantle-1 \
--moniker="{{VALIDATOR_NAME}}" \
--commission-max-change-rate=0.01 \
--commission-max-rate=1.0 \
--commission-rate=0.07 \
--min-self-delegation="1" \
--details="XXXXXXXX" \
--security-contact="XXXXXXXX" \
--website="XXXXXXXX" \
--fees 1000umantle \
--website="XXXXXXXX"
```
## Version
This chain is currently running on assetMantle [v0.1.1](https://github.com/persistenceOne/assetMantle/releases/tag/v0.1.1)
Commit Hash: #######a555ac81cd3ab856d2d5305414e8a00d24d2043c
>Note: If your node is running on an older version of the application, please update it to this version at the earliest to avoid being exposed to security vulnerabilities /defects.

## Binary
The binary can be downloaded from [here](https://github.com/persistenceOne/assetMantle/releases/tag/v0.1.1).

## Explorer
The explorer for this chain is hosted [here](https://explorer.persistence.one)

## Wallet
The wallet application for this chain will be hosted [here](https://staging.app.persistence.one).
