#!/bin/bash

persistenceCore tx gov submit-legacy-proposal software-upgrade "Upgrade v9.2.0 PersistenceCore" \
    --deposit "600000000uxprt" \
    --upgrade-height 1668000 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/f/test-core-2/upgrades/v9.2.0/test-core-2/upgrades/v9.2.0/binaries.json?checksum=sha256:bbdffb120172c312532f835f8a9b862677554b9e577bf2f1edc40df05fedeb4d" \
    --description "This is a proposal to do a software upgrade to [v9.2.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v9.2.0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
