'use strict'

angular.module('slick')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]

    $scope.breakpoints = [
      breakpoint: 768
      settings:
        slidesToShow: 2
        slidesToScroll: 2
    ,
      breakpoint: 480
      settings:
        slidesToShow: 1
        slidesToScroll: 1
    ]
