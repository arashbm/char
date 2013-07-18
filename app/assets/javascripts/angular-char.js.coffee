window.Backend = angular.module('backend', ['ngResource'])
Backend.config ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = gon.authenticityToken

Backend.factory 'Discussion', ($resource)  ->
  Discussion = $resource('/:discussableType/:discussableId/discussions/:id',
    {}, {update: { method: 'PATCH' }})

window.Char = angular.module('char', ['ngSanitize', 'backend'])

Char.factory('nowTime', ['$timeout', ($timeout) ->
  nowTime = Date.now()
  updateTime = ->
    nowTime = Date.now()
    $timeout(updateTime, 1000)
  updateTime()
  -> nowTime
])

Char.filter 'timeAgo', ['nowTime', (now) ->
  (input) -> moment(input).from now()
]

Char.filter 'persianNum', ->
  (input) ->
    input.replace /\d/g, (n) -> {0:'۰',1:'۱',2:'۲',3:'۳',4:'۴',5:'۵',6:'۶',7:'۷',8:'۸',9:'۹'}[n]

Char.filter 'markdown', ->
  (input) -> $sanitize marked(input or " ")

Char.filter 'gravatarUrl', ->
  (input) -> Gravtastic(input)

Char.filter 'wordCount', ->
  (input) -> (input or '').trim().replace(/\s+/gi, ' ').split(' ').length

Char.directive 'markdown', ->
  {
    restrict: 'A',
    link: (scope, element, attrs) ->
      htmlText = $sanitize marked element.text()
      element.html htmlText
  }
