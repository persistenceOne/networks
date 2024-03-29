#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v11" \
    --deposit "600000000uxprt" \
    --upgrade-height 2824100 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v11/test-core-2/upgrades/v11/binaries.json?checksum=sha256:3ddf3ccb619ff1a35630fe32266fafaf51acfda3e7f99429498f4621787407c0" \
    --title "Upgrade v11.0.0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v11.0.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v11.0.0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
