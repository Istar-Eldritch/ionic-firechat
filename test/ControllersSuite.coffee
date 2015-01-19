
describe 'Controller: StatusBarController', ->

  beforeEach module 'ionic-firechat'

  ctrl = null
  scope = null

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ctrl = $controller('Navigation', $scope:scope)

  it 'should exist', ->
    should.exist ctrl
    should.exist scope