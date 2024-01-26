#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v11.3.0" \
    --deposit "600000000uxprt" \
    --upgrade-height 3701900 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v11.3.0/test-core-2/upgrades/v11.3.0/binaries.json?checksum=sha256:7322e42b9c45831f21dd7a6c8f27f33d0bcf066afe3558ff341866b2f84775fa" \
    --title "Upgrade v11.3.0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v11.3.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v11.3.0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
