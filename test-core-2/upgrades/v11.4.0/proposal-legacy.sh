#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v11.4.0" \
    --deposit "600000000uxprt" \
    --upgrade-height 3703999 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v11.4.0/test-core-2/upgrades/v11.4.0/binaries.json?checksum=sha256:a32aa5bee1b9aab3a6879442a96b29bb4468b1e78c8e0a960ba3248e486b6d99" \
    --title "Upgrade v11.4.0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v11.4.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v11.4.0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
