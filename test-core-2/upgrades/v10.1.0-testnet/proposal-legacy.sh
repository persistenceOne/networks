#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v10.1.0-testnet" \
    --deposit "600000000uxprt" \
    --upgrade-height 2225300 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v10.1.0-testnet/test-core-2/upgrades/v10.1.0-testnet/binaries.json?checksum=sha256:d1af6ed93da2e5c89b2f4dd852685c7c4384270da9acc1615f05f7f93b5078d5" \
    --title "Upgrade v10.1.0-testnet PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v10.1.0-testnet](https://github.com/persistenceOne/persistenceCore/releases/tag/v10.1.0-testnet)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
