#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v10" \
    --deposit "600000000uxprt" \
    --upgrade-height 2225300 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v10/test-core-2/upgrades/v10/binaries.json?checksum=sha256:a5442362f2ef5a7c33818e873380552a24a2d0a27390c5d8be7d3bf0329f8972" \
    --title "Upgrade v10.0.0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v10.0.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v10.0.0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
