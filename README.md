
# network 2.0.0 [![stable](http://badges.github.io/stability-badges/dist/stable.svg)](http://github.com/badges/stability-badges)

Simple internet connection detection for [React Native](http://github.com/facebook/react-native).

```coffee
Network = require "network"

Network.isConnected # => false (this value is reactive)

Network.didConnect ->
  console.log "Connected!"

Network.didDisconnect ->
  console.log "Disconnected!"
```
