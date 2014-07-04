'use strict';
angular.module('slick', []).directive('slick', [
  '$timeout',
  function ($timeout) {
    return {
      restrict: 'AEC',
      scope: {
        initOnload: '@',
        data: '=',
        currentIndex: '=',
        accessibility: '@',
        arrows: '@',
        autoplay: '@',
        autoplaySpeed: '@',
        centerMode: '@',
        centerPadding: '@',
        cssEase: '@',
        dots: '@',
        draggable: '@',
        easing: '@',
        fade: '@',
        infinite: '@',
        lazyLoad: '@',
        onBeforeChange: '@',
        onAfterChange: '@',
        onInit: '@',
        onReInit: '@',
        pauseOnHover: '@',
        responsive: '&',
        slide: '@',
        slidesToShow: '@',
        slidesToScroll: '@',
        speed: '@',
        swipe: '@',
        touchMove: '@',
        touchThreshold: '@',
        vertical: '@'
      },
      link: function (scope, element, attrs) {
        var initializeSlick, isInitialized;
        initializeSlick = function () {
          return $timeout(function () {
            var currentIndex, slider;
            slider = $(element);
            if (scope.currentIndex != null) {
              currentIndex = scope.currentIndex;
            }
            slider.slick({
              accessibility: scope.accessibility !== 'false',
              arrows: scope.arrows !== 'false',
              autoplay: scope.autoplay === 'true',
              autoplaySpeed: scope.autoplaySpeed != null ? parseInt(scope.autoplaySpeed, 10) : 3000,
              centerMode: scope.centerMode === 'true',
              centerPadding: scope.centerPadding || '50px',
              cssEase: scope.cssEase || 'ease',
              dots: scope.dots === 'true',
              draggable: scope.draggable !== 'false',
              easing: scope.easing || 'linear',
              fade: scope.fade === 'true',
              infinite: scope.infinite !== 'false',
              lazyLoad: scope.lazyLoad || 'ondemand',
              onBeforeChange: scope.onBeforeChange || null,
              onAfterChange: function (sl, index) {
                if (scope.onAfterChange) {
                  scope.onAfterChange();
                }
                if (currentIndex != null) {
                  return scope.$apply(function () {
                    currentIndex = index;
                    return scope.currentIndex = index;
                  });
                }
              },
              onInit: function (sl) {
                if (scope.onInit) {
                  scope.onInit();
                }
                if (currentIndex != null) {
                  return sl.slideHandler(currentIndex);
                }
              },
              onReInit: scope.onReInit || null,
              pauseOnHover: scope.pauseOnHover !== 'false',
              responsive: scope.responsive() || null,
              slide: scope.slide || 'div',
              slidesToShow: scope.slidesToShow != null ? parseInt(scope.slidesToShow, 10) : 1,
              slidesToScroll: scope.slidesToScroll != null ? parseInt(scope.slidesToScroll, 10) : 1,
              speed: scope.speed != null ? parseInt(scope.speed, 10) : 300,
              swipe: scope.swipe !== 'false',
              touchMove: scope.touchMove !== 'false',
              touchThreshold: scope.touchThreshold ? parseInt(scope.touchThreshold, 10) : 5,
              vertical: scope.vertical === 'true'
            });
            return scope.$watch('currentIndex', function (newVal, oldVal) {
              if (currentIndex != null && newVal != null && newVal !== currentIndex) {
                return slider.slickGoTo(newVal);
              }
            });
          });
        };
        if (scope.initOnload) {
          isInitialized = false;
          return scope.$watch('data', function (newVal, oldVal) {
            if (newVal != null && !isInitialized) {
              initializeSlick();
              return isInitialized = true;
            }
          });
        } else {
          return initializeSlick();
        }
      }
    };
  }
]);