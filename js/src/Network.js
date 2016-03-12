var Event, Factory, NetInfo;

NetInfo = require("NetInfo");

Factory = require("factory");

Event = require("event");

module.exports = Factory("Network", {
  singleton: true,
  initFrozenValues: function() {
    return {
      didConnect: Event(),
      didDisconnect: Event()
    };
  },
  initReactiveValues: function() {
    return {
      isConnected: false
    };
  },
  init: function() {
    NetInfo.isConnected.fetch().done((function(_this) {
      return function(isConnected) {
        return _this._setConnected(isConnected);
      };
    })(this));
    return NetInfo.isConnected.addEventListener("change", (function(_this) {
      return function(isConnected) {
        return _this._setConnected(isConnected);
      };
    })(this));
  },
  _setConnected: function(isConnected) {
    if (isConnected === this.isConnected) {
      return;
    }
    this.isConnected = isConnected;
    if (isConnected) {
      return this.didDisconnect.emit();
    } else {
      return this.didConnect.emit();
    }
  }
});

//# sourceMappingURL=../../map/src/Network.map
