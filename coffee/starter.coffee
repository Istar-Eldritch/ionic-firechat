angular.module 'ionic-firechat', ['ionic','firebase']

.run ($ionicPlatform) ->
  $ionicPlatform.ready ->
    if window.cordova? and window.cordova.plugins.Keyboard?
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)
    if window.StatusBar?
      StatusBar.styleDefault()

.config ($stateProvider, $urlRouterProvider) ->

  $stateProvider

  .state 'landing',
    url: ''
    templateUrl: 'templates/landing.html'

  .state 'inner',
    controller: 'Navigation'
    templateUrl: 'templates/inner.html'

  .state 'inner.public',
    controller: 'Chat'
    url: '/public'
    templateUrl: 'templates/chat.html'

  $urlRouterProvider.otherwise('')