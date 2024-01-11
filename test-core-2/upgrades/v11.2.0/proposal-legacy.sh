#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v11.2.0" \
    --deposit "600000000uxprt" \
    --upgrade-height 3466500 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v11.2.0/test-core-2/upgrades/v11.2.0/binaries.json?checksum=sha256:0ca8a79faee4bfe0b0b8e0a5739ca80949f50424b02d54c47df134a78d4e2792" \
    --title "Upgrade v11.2.0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v11.2.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v11.2.0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
