
NetInfo = require "NetInfo"
Factory = require "factory"
Event = require "event"

module.exports = Factory "Network",

  singleton: yes

  initFrozenValues: ->

    didConnect: Event()

    didDisconnect: Event()

  initReactiveValues: ->

    isConnected: no

  init: ->
    NetInfo.isConnected.fetch().done (isConnected) =>
      @_setConnected isConnected
    NetInfo.isConnected.addEventListener "change", (isConnected) =>
      @_setConnected isConnected

  _setConnected: (isConnected) ->
    return if isConnected is @isConnected
    @isConnected = isConnected
    if isConnected then @didDisconnect.emit()
    else @didConnect.emit()
