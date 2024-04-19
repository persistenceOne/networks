#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v11.9.0-rc0" \
    --deposit "600000000uxprt" \
    --upgrade-height 4795333 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v11.9.0-rc0/test-core-2/upgrades/v11.9.0-rc0/binaries.json?checksum=sha256:9551b5eae6f4de466b3506045347b7473c25933307dfb00804d3e28259d08d14" \
    --title "Upgrade v11.9.0-rc0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v11.9.0-rc0](https://github.com/persistenceOne/persistenceCore/releases/tag/v11.9.0-rc0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
