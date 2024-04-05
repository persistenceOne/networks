#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-legacy-proposal software-upgrade "v11.9.0-rc0" \
    --deposit "600000000uxprt" \
    --upgrade-height 4795000 \
    --upgrade-info "https://raw.githubusercontent.com/persistenceOne/networks/test-core-2/upgrades/v11.9.0-rc0/test-core-2/upgrades/v11.9.0-rc0/binaries.json?checksum=sha256:85e1eda80321fae2fecc8fb005276b4019370181f6b6cc800dfedc432fc9f000" \
    --title "Upgrade v11.9.0-rc0 PersistenceCore" \
    --description "This is a proposal to do a software upgrade to [v11.9.0-rc0](https://github.com/persistenceOne/persistenceCore/releases/tag/v11.9.0-rc0)" \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
