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

Char.filter 'grammer', ->
  (input) ->
    w = "[\u0600-\u06FF\u0750-\u077F\uFB50-\uFDFF\uFE70-\uFEFF]"
    output = input
    # space before punc
    output = output.replace /(["'])/g, '<span class="err e-q">$1</span>'
    bigParagraphPattern = ///
    (\n{2}|^\n|^)
    ((?:[^\n] | [^\n]\n[^\n]).{500,})
    ((?= \n{2}|\n$|$))
    ///mg
    output = output.replace bigParagraphPattern,  '$1<span class="war b-p">$2</span>$3'
    output = output.replace /(\s)([.,،;])/g, "$1<span class='err s-b-p'>$2</span>"
    output = output.replace /(\s)([\)\]\}»])/g, "$1<span class='err s-b-c-p'>$2</span>"
    output = output.replace /([«\[\(\{])(\s)/g, '<span class="err s-a-o-p">$1</span>$2'
    output = output.replace /([0-9]+)/g, '<span class="err e-n">$1</span>'
    output

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
