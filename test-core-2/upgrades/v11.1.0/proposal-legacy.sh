#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v11.1.0" \
    --deposit "600000000uxprt" \
    --upgrade-height 3137000 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/upgrade-v11.1.0/test-core-2/upgrades/v11.1.0/binaries.json?checksum=sha256:<TODO>" \
    --title "Upgrade v11.1.0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v11.1.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v11.1.0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
