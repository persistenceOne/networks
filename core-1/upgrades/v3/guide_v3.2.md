# v3.1.2 to v3.2.0

This is going to be a binary swap on the main running the dragonberry-persistenceCore v3.1.2

## Build persistenceCore binaries
Now, create the required folder, make the build, and copy the daemon over to that folder
```
cd $HOME/persistenceCore
git pull
git checkout v3.2.0
make build
cp build/persistenceCore <location for current persistenceCore binaries>
```

## Run
After building the binaries for v3.2.0, replace the current binaries and restart the validator node.

Run commands
```
persistenceCore start --iavl-disable-fastnode false
```

## Communications
Operators are encouraged to join the [`#validators-lobby`](https://discord.gg/hnvDDzRFrV)
channel of the Persistence Community Discord. This channel is the primary communication tool
for operators to ask questions, report upgrade status, report technical issues, and to build
social consensus should the need arise.
