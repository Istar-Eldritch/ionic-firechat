angular.module 'ionic-firechat'

.controller 'Login', (fireRef, $scope, $state, $ionicLoading) ->

  fireRef.onAuth (data) ->
    if not data?
      $state.go 'landing'

  $scope.start = ->
    $ionicLoading.show template: 'Loading...'
    fireRef.authAnonymously (error, data) ->
      $ionicLoading.hide()
      if error?
        console.log error
        #TODO Display error
      else
        console.log data
        fireRef.child('users').child(data.uid).set nickname: $scope.nickname
        $state.go 'inner.public'