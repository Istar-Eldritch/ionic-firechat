
describe 'Controller: StatusBarController', ->

  beforeEach module 'starter'

  ctrl = null
  scope = null

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    ctrl = $controller('StatusBarController', $scope:scope)

  it 'should exist', ->
    should.exist ctrl
    should.exist scope