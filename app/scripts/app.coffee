'use strict'

angular.module('slick', [])
  .directive "slick", ($timeout) ->
    restrict: "AEC"
    scope:
      currentIndex: "="
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
      responsive: "&"
      slide: "@"
      slidesToShow: "@"
      slidesToScroll: "@"
      speed: "@"
      swipe: "@"
      touchMove: "@"
      touchThreshold: "@"
      vertical: "@"
    link: (scope, element, attrs) ->

      console.log scope.responsive()

      $timeout(() ->
        slider = $(element)
        currentIndex = scope.currentIndex if scope.currentIndex?

        slider.slick
          accessibility: scope.accessibility isnt "false"
          arrows: scope.arrows isnt "false"
          autoplay: scope.autoplay is "true"
          autoplaySpeed: if scope.autoplaySpeed? then parseInt(scope.autoplaySpeed, 10) else 3000
          centerMode: scope.centerMode is "true"
          centerPadding: scope.centerPadding or "50px"
          cssEase: scope.cssEase or "ease"
          dots: scope.dots is "true"
          draggable: scope.draggable isnt "false"
          easing: scope.easing or "linear"
          fade: scope.fade is "true"
          infinite: scope.infinite isnt "false"
          lazyLoad: scope.lazyLoad or "ondemand"
          onBeforeChange: scope.onBeforeChange or null
          onAfterChange: (sl, index) ->
            scope.onAfterChange() if scope.onAfterChange
            if currentIndex?
              scope.$apply(->
                currentIndex = index
                scope.currentIndex = index
              )
          onInit: (sl) ->
            scope.onInit() if scope.onInit
            if currentIndex?
              sl.slideHandler(currentIndex)
          onReInit: scope.onReInit or null
          pauseOnHover: scope.pauseOnHover isnt "false"
          responsive: scope.responsive() or null
          slide: scope.slide or "div"
          slidesToShow: if scope.slidesToShow? then parseInt(scope.slidesToShow, 10) else 1
          slidesToScroll: if scope.slidesToScroll? then parseInt(scope.slidesToScroll, 10) else 1
          speed: if scope.speed? then parseInt(scope.speed, 10) else 300
          swipe: scope.swipe isnt "false"
          touchMove: scope.touchMove isnt "false"
          touchThreshold: if scope.touchThreshold then parseInt(scope.touchThreshold, 10) else 5
          vertical: scope.vertical is "true"

        scope.$watch("currentIndex", (newVal, oldVal) ->
          if currentIndex? and newVal? and newVal != currentIndex
            slider.slickGoTo(newVal)
        )
      )
