# v3.0.1 to v3.1.1

This is going to be a binary swap on the testnet running the persistenceCore v3.0.1

## Build persistenceCore binaries
Now, create the required folder, make the build, and copy the daemon over to that folder
```
cd $HOME/persistenceCore
git pull
git checkout v3.1.1
make build
cp build/persistenceCore <location for current persistenceCore binaries>
```

## Run
After building the binaries for v3.1.1, replace the current binaries and restart the validator node.

## Communications
Operators are encouraged to join the [`#validators-lobby`](https://discord.gg/hwbynVYDZ7)
channel of the Persistence Community Discord. This channel is the primary communication tool
for operators to ask questions, report upgrade status, report technical issues, and to build
social consensus should the need arise.
