'use strict'

angular.module('slick')
  .controller 'MainCtrl', ($scope, $timeout) ->
    $timeout(() ->
      $scope.awesomeThings = [
        'HTML5'
        'AngularJS'
        'Karma'
        'Slick'
        'Bower'
        'Coffee'
      ]
    , 1000)


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
