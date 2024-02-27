#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v11.7.0" \
    --deposit "600000000uxprt" \
    --upgrade-height 4200000 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v11.7.0/test-core-2/upgrades/v11.7.0/binaries.json?checksum=sha256:48c76ec698a1f056aefdcb44c58a5d20420983013bb7350fca48c07a06fbd4d1" \
    --title "Upgrade v11.7.0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v11.7.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v11.7.0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
