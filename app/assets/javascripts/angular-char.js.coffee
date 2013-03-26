window.Char = angular.module('char', [])

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
