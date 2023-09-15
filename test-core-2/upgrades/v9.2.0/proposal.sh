#!/bin/bash

persistenceCore tx --chain-id "test-core-2" gov submit-proposal ./draft_proposal.json \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
