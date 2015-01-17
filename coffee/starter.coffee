angular.module 'starter', ['ionic']

.run ($ionicPlatform) ->
  $ionicPlatform.ready ->
    if window.cordova? and window.cordova.plugins.Keyboard?
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)
    if window.StatusBar?
      StatusBar.styleDefault()

.controller 'StatusBarController', ($scope) ->
  $scope.title = 'BareBones App'