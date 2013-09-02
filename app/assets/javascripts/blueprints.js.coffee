window.BlueprintEditorPrevCtrl = ($scope) ->
  # some stuff

window.BlueprintDiscussionsCtrl = ($scope, $window, $http, $timeout, Discussion) ->
  $scope.$window = $window
  queryvars =
    discussableType: 'blueprints'
    discussableId: gon.params.id

  $scope.discussionForm = {}

  querySuccessCallback = (data) ->
    $scope.discussions = data

  createSuccessCallback = (data) ->
    # reset the form
    $scope.discussionForm = {}
    $scope.reload()

  $scope.reload = ->
    Discussion.query queryvars, querySuccessCallback

  $scope.reload()

  $scope.createDiscussion = () ->
    console.log $scope.discussionForm
    console.log 'asdasdas'
    Discussion.save queryvars, {discussion: $scope.discussionForm}, createSuccessCallback
