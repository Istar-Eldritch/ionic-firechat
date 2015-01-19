angular.module 'ionic-firechat'

.factory 'fireRef', ->
  console.log 'create firebase ref'
  fire = new Firebase('https://ionic-firechatr.firebaseIO.com')

  return fire