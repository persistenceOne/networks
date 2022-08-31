# v2 to v3

Persistence v3 gov proposal: [7](https://www.mintscan.io/persistence/proposals/7) \
Height: [7791906](https://www.mintscan.io/persistence/blocks/7791906) (Countdown) \
Release: [v3](https://github.com/persistenceOne/persistenceCore/releases/tag/v3.1.1)

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
After this, you must make the necessary folders for cosmosvisor in your daemon home directory (~/.persistenceCore).
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
mkdir -p ~/.persistenceCore/cosmovisor/upgrades/v2/bin
cp $GOPATH/bin/persistenceCore ~/.persistenceCore/cosmovisor/upgrades/v2/bin
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

Now you can start the cosmovisor for current v2.
```
cosmovisor start --minimum-gas-prices="0.0005uxprt" --home $HOME/.persistenceCore
```

Now, create the required folder, make the build, and copy the daemon over to that folder
```
mkdir -p ~/.persistenceCore/cosmovisor/upgrades/v3/bin
cd $HOME/persistenceCore
git pull
git checkout v3.1.1
make build
cp build/persistenceCore ~/.persistenceCore/cosmovisor/upgrades/v3/bin
~/.persistenceCore/cosmovisor/upgrades/v3/bin version
# Check: HEAD-d557c8f98f2440f9fe82dcf5a30b05b714dee25a
```
Now, at the upgrade height, Cosmovisor will upgrade swap the binaries.

## Fixing v2 bug
In v2 for persistenceCore binary, there was a bug that creates the `snapshots` dir and the `upgrade-info.json`
file after a software upgrade proposal is accepted in `~/data` dir instead of `~/.persistenceCore/data`.

Note: If one is running the persistenceCore binary is run with `--home <home-dir>` then this error won't be present.
In that case can omit the resolution steps needed.

Please follow either of the 2 ways mentioned bellow

### 1. Start cosmovisor with params (recommended)
Start the cosmovisor for the current v2 version with `--home ~/.persistenceCore` args. This will basically curcumvent the bug and the `upgrade-info.json` will be created in the correct place.
```
cosmovisor start --minimum-gas-prices="0.0005uxprt" --home $HOME/.persistenceCore
```

Now cosmovisor will automatically upgrade without any manual intervention.

### 2. Check upgrade-info.json is corrected (manual intervention)

When chain reaches the block height, the chain will pause with panic message followed by endless peer logs.
Copy the `upgrade-info.json` to the correct location with
```
cp ~/data/upgrade-info.json ~/.persistenceCore/data/
```
Now cosmovisor will automatically catch the upgrade info and will continue with the v3 upgrade/

## Manual Option
1. Wait for PersistenceCore to reach the upgrade height (xxx)
2. Look for a panic message, followed by endless peer logs. Stop the daemon
3. Run the following commands:
```
cd $HOME/persistenceCore
git pull
git checkout v3.1.1
make install
```
4. Start the persistenceCore daemon again, watch the upgrade happen, and then continue to hit blocks

## Communications
Operators are encouraged to join the [`#validators-lobby`](https://discord.gg/hwbynVYDZ7)
channel of the Persistence Community Discord. This channel is the primary communication tool
for operators to ask questions, report upgrade status, report technical issues, and to build
social consensus should the need arise.
