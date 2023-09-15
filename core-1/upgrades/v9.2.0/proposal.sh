#!/bin/bash

persistenceCore tx gov submit-proposal ./draft_proposal.json \
    --node "https://rpc.core.persistence.one:443" \
    --gas-adjustment 1.5 --gas auto --keyring-backend os --from persistence15xgu3ueqlpakse8ma2u4dvq3y7n6zte8fpzlyn
