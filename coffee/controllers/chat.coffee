angular.module 'ionic-firechat'

.controller 'Chat', ($scope, fireRef, $firebase) ->

  publicChat = fireRef.child 'public-room'
  $scope.messages = $firebase(publicChat).$asArray()

  console.log $scope.messages

  $scope.isUser = (uid) -> uid is fireRef.getAuth().uid

  $scope.send = (content) ->
    console.log 'send: ' + content
    $scope.messages.$add
      content: content
      sender: fireRef.getAuth().uid