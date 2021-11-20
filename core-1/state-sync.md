# Get current chain parameters

```
curl -s https://rpc.core.persistence.one/status | \ 
 jq '.result .sync_info | {trust_height: .latest_block_height, trust_hash: .latest_block_hash} | values'
```

#### example:
```
{
  "trust_height": "3549879",
  "trust_hash": "461420F85D8A7A9833B5A1C1E7FCC461AC10247B840C7DD3BB53AC687E3AC0BB"
}
```

##### Set options in config.toml

```
seeds = "08ab4552a74dd7e211fc79432918d35818a67189@52.69.58.231:26656,449a0f1b7dafc142cf23a1f6166bbbf035edfb10@13.232.85.66:26656,5b27a6d4cf33909c0e5b217789e7455e261941d1@15.222.29.207:26656"
```

```
[statesync]

enable = true
rpc_servers = "https://rpc.core.persistence.one,https://rpc.core.persistence.one"
trust_height = 3549879
trust_hash = "461420F85D8A7A9833B5A1C1E7FCC461AC10247B840C7DD3BB53AC687E3AC0BB"
trust_period = "168h0m0s"
```
