'use strict';
var util = require('util');
var ScriptBase = require('../script-base.js');

var Generator = module.exports = function Generator() {
  ScriptBase.apply(this, arguments);
};

util.inherits(Generator, ScriptBase);

Generator.prototype.files = function files() {
  this.generateSourceAndTest('router', 'spec/router.spec', 'routers');
};
