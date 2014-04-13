'use strict'

angular.module('slick-carousel', ['hljs'])
  .directive "slick", () ->
    restrict: "AEC"
    scope:
      accessibility: "@"
      arrows: "@"
      autoplay: "@"
      autoplaySpeed: "@"
      centerMode: "@"
      centerPadding: "@"
      cssEase: "@"
      dots: "@"
      draggable: "@"
      easing: "@"
      fade: "@"
      infinite: "@"
      lazyLoad: "@"
      onBeforeChange: "@"
      onAfterChange: "@"
      onInit: "@"
      onReInit: "@"
      pauseOnHover: "@"
      responsive: "@"
      slide: "@"
      slidesToShow: "@"
      slidesToScroll: "@"
      speed: "@"
      swipe: "@"
      touchMove: "@"
      touchThreshold: "@"
      vertical: "@"
    link: (scope, element, attrs) ->
      $(element).slick
        accessibility: if scope.accessibility? then Boolean(scope.accessibility) else true
        arrows: if scope.arrows? then Boolean(scope.arrows) else true
        autoplay: Boolean(scope.autoplay)
        autoplaySpeed: if scope.autoplaySpeed? then parseInt(scope.autoplaySpeed, 10) else 3000
        centerMode: Boolean(scope.centerMode)
        centerPadding: scope.centerPadding or "50px"
        cssEase: scope.cssEase or "ease"
        dots: Boolean(scope.dots)
        draggable: if scope.draggable? then Boolean(scope.draggable) else true
        easing: scope.easing or "linear"
        fade: Boolean(scope.fade)
        infinite: if scope.infinite? then Boolean(scope.infinite) else true
        lazyLoad: scope.lazyLoad or "ondemand"
        onBeforeChange: scope.onBeforeChange or null
        onAfterChange: scope.onAfterChange or null
        onInit: scope.onInit or null
        onReInit: scope.onReInit or null
        pauseOnHover: if scope.pauseOnHover? then scope.pauseOnHover else true
        responsive: scope.responsive or null
        slide: scope.slide or "div"
        slidesToShow: if scope.slidesToShow? then parseInt(scope.slidesToShow, 10) else 1
        slidesToScroll: if scope.slidesToScroll? then parseInt(scope.slidesToScroll, 10) else 1
        speed: if scope.speed? then parseInt(scope.speed, 10) else 300
        swipe: if scope.swipe? then scope.swipe else true
        touchMove: if scope.touchMove? then scope.touchMove else true
        touchThreshold: if scope.touchThreshold then parseInt(scope.touchThreshold, 10) else 5
        vertical: if scope.vertical? then scope.vertical else false
