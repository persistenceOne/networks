# v3 to v4

Persistence v4 gov proposal: [8](https://www.mintscan.io/persistence/proposals/8) \
Height: [8589500](https://www.mintscan.io/persistence/blocks/8589500) (Countdown) \
Release: [v4](https://github.com/persistenceOne/persistenceCore/releases/tag/v4.0.0)

## Install and setup Cosmovisor
We highly recommend validators use cosmovisor to run their nodes. This will make low-downtime
upgrades smoother, as validators don't have to manually upgrade binaries during the upgrade,
and instead can pre-install new binaries, and cosmovisor will automatically update them based
on on-chain SoftwareUpgrade proposals.

You should review the docs for cosmovisor located here: https://docs.cosmos.network/master/run-node/cosmovisor.html

If you choose to use cosmovisor, please continue with these instructions:

To install Cosmovisor:
```
go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@v1.0.0
```
After this, you must make the necessary folders for cosmosvisor in your daemon home directory (`~/.persistenceCore`).
```
mkdir -p ~/.persistenceCore
mkdir -p ~/.persistenceCore/cosmovisor
mkdir -p ~/.persistenceCore/cosmovisor/genesis
mkdir -p ~/.persistenceCore/cosmovisor/genesis/bin
mkdir -p ~/.persistenceCore/cosmovisor/upgrades
```

Copy the current persistenceCore binary into the cosmovisor/genesis folder and the v3 folder.
```
cp $GOPATH/bin/persistenceCore ~/.persistenceCore/cosmovisor/genesis/bin
mkdir -p ~/.persistenceCore/cosmovisor/upgrades/v3/bin
cp $GOPATH/bin/persistenceCore ~/.persistenceCore/cosmovisor/upgrades/v3/bin
```

Cosmovisor is now ready to be started. We will now set up Cosmovisor for the upgrade

Set these environment variables:
```
echo "# Setup Cosmovisor" >> ~/.profile
echo "export DAEMON_NAME=persistenceCore" >> ~/.profile
echo "export DAEMON_HOME=$HOME/.persistenceCore" >> ~/.profile
echo "export DAEMON_ALLOW_DOWNLOAD_BINARIES=false" >> ~/.profile
echo "export DAEMON_LOG_BUFFER_SIZE=512" >> ~/.profile
echo "export DAEMON_RESTART_AFTER_UPGRADE=true" >> ~/.profile
echo "export UNSAFE_SKIP_BACKUP=true" >> ~/.profile
source ~/.profile
```

Now you can start the cosmovisor for current v3.
```
cosmovisor start --minimum-gas-prices="0.0005uxprt" --home $HOME/.persistenceCore
```

Now, create the required upgrade folder, make the build, and copy the daemon over to that folder
```
mkdir -p ~/.persistenceCore/cosmovisor/upgrades/v4/bin
cd $HOME/persistenceCore
git pull
git checkout v4.0.0
make build
cp build/persistenceCore ~/.persistenceCore/cosmovisor/upgrades/v4/bin
~/.persistenceCore/cosmovisor/upgrades/v4/bin/persistenceCore version --long
# Check: v4.0.0
# name: persistenceCore
# server_name: persistenceCore
# version: v4.0.0
# commit: 3b20fa8292cb8018ab2d277a67131679e7635901
# build_tags: netgo,ledger
# go: go version go1.18.4 linux/amd64
```
Now, at the upgrade height, Cosmovisor will upgrade swap the binaries.

## Manual Option
1. Wait for PersistenceCore to reach the upgrade height (8589500)
2. Look for a panic message, followed by endless peer logs. Stop the daemon
3. Run the following commands:
```
cd $HOME/persistenceCore
git pull
git checkout v4.0.0
make install
```
4. Start the persistenceCore daemon again, watch the upgrade happen, and then continue to hit blocks

## Communications
Operators are encouraged to join the [#validators-discussion](https://discord.gg/hnvDDzRFrV)
channel of the Persistence Community Discord. This channel is the primary communication tool
for operators to ask questions, report upgrade status, report technical issues, and to build
social consensus should the need arise. If you don't have access, please reach out to someone
from the Persistence team directly.
