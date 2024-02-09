#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v11.5.0" \
    --deposit "600000000uxprt" \
    --upgrade-height 3920000 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v11.5.0/test-core-2/upgrades/v11.5.0/binaries.json?checksum=sha256:5680b664b9193b4249301658ed5c24213ca5f17bcf696ff298a0e0fc7286f84d" \
    --title "Upgrade v11.5.0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v11.5.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v11.5.0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
