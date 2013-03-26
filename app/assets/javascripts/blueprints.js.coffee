window.DiscussionListCtrl = ($scope, $http, $timeout) ->

  $scope.reload = ->
    $http.get("/blueprints/#{$scope.blueprint_id}/discussions.json").success (data, status) ->
      $scope.discussions = data

  $scope.autoReload = ->
    $scope.reload()
    $timeout($scope.autoReload, 10000)

  # bootstrap discussions from DOM
  $scope.discussions = $('#discussions-list').data('discussions')

  # setup auto reload every 30 secs
  $scope.autoReload()
  
  $scope.blueprint_id = parseInt window.location.toString().match(/blueprints\/(\d+)/)[1]


  $scope.addDiscussion = ->
    # create a json
    date = new Date
    newDis =
      authenticity_token: $('input[name="authenticity_token"]')[0].value
      discussion:
        body: $scope.body
        user_id: window.currentUser.id
        user:
          id: window.currentUser.id
          name: window.currentUser.name
        created_at: date.toISOString()
        temp: 1
    $scope.discussions.push newDis['discussion']

    # reset all errors
    $scope.wrapperClass = { body: '' }
    $scope.errors = { base: '', body: '' }

    # reset the form
    $scope.body = ''

    # send the request
    promis = $http.post("/blueprints/#{$scope.blueprint_id}/discussions.json", newDis)
    promis.success (data) ->
      # reload to get the latest
      $scope.refresh()
    promis.error (data, status) ->
      console.log 'ERRRRRRRRRRA', status, data

      # add error to proper fields
      $scope.wrapperClass = { body: 'error' }
      $scope.errors = data['errors'] if status == 422

      # pop it back to form
      d = $scope.discussions.pop()
      $scope.body = d.body
