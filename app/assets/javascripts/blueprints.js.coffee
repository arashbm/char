window.BlueprintDiscussionsCtrl = ($scope, $http, $timeout, Discussion) ->
  queryvars =
    discussableType: 'blueprints'
    discussableId: gon.params.id

  $scope.listStatus = 'ready' # ready, loading, error
  setListStatus = (to) ->
    $scope.listStatus = to

  $scope.formStatus = 'ready' # ready, busy, error
  setFormStatus = (to) ->
    $scope.formStatus = to

  $scope.discussionForm = {}
  $scope.discussionFormErrors = {}

  $scope.fieldClass = (el) ->
    if $scope.discussionFormErrors[el] isnt undefined then 'error' else ''

  $scope.btnClass = ->
    switch $scope.listStatus
      when 'loading' then 'disabled'
      when 'ready' then ''
      when 'error' then 'btn-warning'
      else ''

  $scope.btnIconClass = ->
    switch $scope.listStatus
      when 'loading' then 'icon-spin icon-refresh'
      else 'icon-refresh'

  $scope.formIconClass = ->
    switch $scope.formStatus
      when 'busy' then 'icon-spin icon-spinner'
      else ''

  querySuccessCallback = (data) ->
    $scope.discussions = data
    setListStatus 'ready'

  queryErrorCallback = ->
    setListStatus 'error'

  createSuccessCallback = (data) ->
    setFormStatus 'ready'
    $scope.discussionFormErrors = {}
    # reset the form
    $scope.discussionForm = {}
    $scope.reload()

  createErrorCallback = (data) ->
    setFormStatus 'error'
    console.log data
    $scope.discussionFormErrors = data.data.errors
    console.log $scope.discussionFormErrors

  $scope.reload = ->
    setListStatus 'loading'
    Discussion.query queryvars, querySuccessCallback, queryErrorCallback

  $scope.reload()

  $scope.createDiscussion = ->
    console.log $scope.discussionForm
    discussion = new Discussion {discussion: $scope.discussionForm}
    setFormStatus 'busy'
    discussion.$save queryvars, createSuccessCallback, createErrorCallback
