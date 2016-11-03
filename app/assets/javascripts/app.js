'use strict';

var angular = require('angular');
     require('angular-material');
     //require("../stylesheets/application.scss");
     require('angular-material/angular-material.scss');
    //$ = require('jquery'),
    //_ = require('lodash');

// Declare app level module which depends on views, and components
angular.module('andAweighWeGo', [ 'ngRoute', 'ngMaterial' ]).
config(['$locationProvider', '$routeProvider', function($locationProvider, $routeProvider) {
  $locationProvider.hashPrefix('!');
  $routeProvider.otherwise({redirectTo: '/view1'});
}]).
factory('loadingInterceptor', ['$q', '$rootScope',
    function ($q, $rootScope) {
        var loadingCount = 0;

        return {
            request: function (config) {
                if(config.ignoreLoading !== true) ++loadingCount;
                if(loadingCount > 0 ) $rootScope.$broadcast('loading:progress');
                return config || $q.when(config);
            },

            response: function (response) {
                if(response.config.ignoreLoading !== true) --loadingCount;
                if(loadingCount === 0) $rootScope.$broadcast('loading:finish');
                return response || $q.when(response);
            },

            responseError: function (response) {
                if(response.config === undefined) {
                    return $q.reject(response);
                }
                if(response.config.ignoreLoading !== true) --loadingCount;
                if(loadingCount === 0) $rootScope.$broadcast('loading:finish');
                return $q.reject(response);
            }
        };
    }
]).config(['$httpProvider', function ($httpProvider) {
    $httpProvider.interceptors.push('loadingInterceptor');
}])

