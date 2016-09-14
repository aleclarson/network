
NetInfo = require "NetInfo"
Event = require "Event"
Type = require "Type"

type = Type "Network"

type.defineFrozenValues

  didConnect: -> Event()

  didDisconnect: -> Event()

type.defineReactiveValues

  isConnected: no

type.initInstance ->

  NetInfo.isConnected.fetch().done (isConnected) =>
    @_setConnected isConnected

  NetInfo.isConnected.addEventListener "change", (isConnected) =>
    @_setConnected isConnected

type.defineMethods

  _setConnected: (isConnected) ->
    return if isConnected is @isConnected
    @isConnected = isConnected
    if isConnected then @didDisconnect.emit()
    else @didConnect.emit()

module.exports = type.construct()
