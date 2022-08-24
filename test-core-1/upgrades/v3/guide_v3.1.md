# v3.0.1 to v3.1.0

Persistence v3.1 gov proposal: xxx
Countdown: xxx
Height: xxx

## Install and sestup Cosmovisor
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

Now, create the required folder, make the build, and copy the daemon over to that folder
```
mkdir -p ~/.persistenceCore/cosmovisor/upgrades/v3.1/bin
cd $HOME/persistenceCore
git pull
git checkout v3.1.0
make build
cp build/persistenceCore ~/.persistenceCore/cosmovisor/upgrades/v3.1/bin
```
Now, at the upgrade height, Cosmovisor will upgrade to the v3.1 binary

## Manual Option
1. Wait for Osmosis to reach the upgrade height
2. Look for a panic message, followed by endless peer logs. Stop the daemon
3. Run the following commands:
```
cd $HOME/persistenceCore
git pull
git checkout v3.1.0
make install
```
4. Start the osmosis daemon again, watch the upgrade happen, and then continue to hit blocks

## Communications
Operators are encouraged to join the [`#validators-lobby`](https://discord.gg/hwbynVYDZ7)
channel of the Persistence Community Discord. This channel is the primary communication tool
for operators to ask questions, report upgrade status, report technical issues, and to build
social consensus should the need arise.
