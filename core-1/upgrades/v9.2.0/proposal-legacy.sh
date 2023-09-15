#!/bin/bash

persistenceCore --chain-id core-1 tx gov submit-legacy-proposal software-upgrade "v9.2.0" \
    --deposit "512000000uxprt" \
    --upgrade-height 13275500 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/core-1/upgrades/v9.2.0/core-1/upgrades/v9.2.0/binaries.json?checksum=sha256:d2c50e9bea0aab82ca8bd4d97a7b654a46fad061978def4c20df31624cb6352b" \
    --title "Upgrade v9.2.0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v9.2.0](https://github.com/persistenceOne/persistenceCore/releases/tag/v9.2.0)" \
    --node "https://rpc.core.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from persistence15xgu3ueqlpakse8ma2u4dvq3y7n6zte8fpzlyn
