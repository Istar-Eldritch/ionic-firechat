angular.module 'ionic-firechat'

.controller 'Navigation', ($scope, $state, fireRef)->

  if not fireRef.getAuth()?
    $state.go 'landing'

  $scope.title = switch
    when $state.current.name is 'inner.public' then 'Public Chat'

  console.log $scope.title