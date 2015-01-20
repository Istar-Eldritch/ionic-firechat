angular.module 'ionic-firechat'

.controller 'Login', (fireRef, $scope, $state) ->

  fireRef.onAuth (data) ->
    if not data?
      $state.go 'landing'

  $scope.start = ->
    fireRef.authAnonymously (error, data) ->
      if error?
        console.log error
        #TODO Display error
      else
        console.log data
        fireRef.child('users').child(data.uid).set nickname: $scope.nickname
        $state.go 'inner.public'