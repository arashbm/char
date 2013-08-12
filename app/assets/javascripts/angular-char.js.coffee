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

all_matches = (str, regexp) ->
  results = []
  results.push arr while (arr = regexp.exec(str))
  results

Char.filter 'grammer', ->
  (input = '') ->

    errors = [
      # english quotation mark
      /(.?)(["'])(.?)/g,
      # space before punctuation
      /(\s)([.,،;!?])(.?)/g,
      # no space after punctuation
      /(.?)([\.,،;!?])([^\s])/g,
      # two or more punctuations in a row
      /(.?)([\.,،;!?]{2,})(.?)/g,
      # space before closing pran
      /(\s)([\)\]\}»])(.?)/g,
      # no space after closing pran
      /(.?)([\)\]\}»])([\u0600-\u06FF\w])/g,
      # space after opening pran
      /(.?)([«\[\(\{])(\s)/g,
      # no space before opening pran
      /(.?)([\u0600-\u06FF\w])([«\[\(\{])/g,
      #english numbers
      /(.?)([0-9]+)(.?)/g,
    ]

    warnings = [
      # Big paragraphs
      ///
      (\n{2}|^\n|^)
      ((?:[^\n] | [^\n]\n[^\n]).{500,})
      ((?= \n{2}|\n$|$))
      ///mg,
    ]


    output = input

    for warning in warnings
      for match in all_matches(input, warning)
        output = output.replace(match[0], "#{match[1]}<span class='war'>#{match[2]}</span>#{match[3]}")

    for error in errors
      for match in all_matches(input, error)
        output = output.replace(match[0], "#{match[1]}<span class='err'>#{match[2]}</span>#{match[3]}")

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

Char.directive 'ngInitial', ->
  restrict: 'A'
  controller: ['$scope', '$element', '$attrs', '$parse', ($scope, $element, $attrs, $parse) ->
    val = $attrs.value || $element.html()
    getter = $parse($attrs.ngModel)
    setter = getter.assign
    setter($scope, val)
  ]
