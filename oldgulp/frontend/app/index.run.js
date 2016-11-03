(function() {
  'use strict';

  angular
    .module('andAweighWeGo')
    .run(runBlock);

  /** @ngInject */
  function runBlock($log) {

    $log.debug('runBlock end');
  }

})();
