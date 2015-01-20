angular.module 'ionic-firechat'

.controller 'Chat', ($scope, fireRef, $firebase, $ionicScrollDelegate) ->

  publicChat = fireRef.child 'public-room'
  $scope.messages = $firebase(publicChat).$asArray()

  console.log $scope.messages

  $scope.isUser = (uid) -> uid is fireRef.getAuth().uid

  $scope.send = (content) ->
    $scope.message = undefined
    if content?
      $scope.messages.$add
        content: content
        sender: fireRef.getAuth().uid

  $scope.$watch 'messages', ->
      console.log 'changed'
      $ionicScrollDelegate.scrollBottom()
    ,true