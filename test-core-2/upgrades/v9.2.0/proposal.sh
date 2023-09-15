#!/bin/bash

persistenceCore tx gov submit-proposal ./draft_proposal.json \
    --node "https://rpc.testnet2.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from testnet-super
