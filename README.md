angular-slick
=============

Angular directive for [slick](https://github.com/kenwheeler/slick/) jquery carousel. Demo is [here](http://vasyabigi.github.io/angular-slick/).

### Usage:

- Install: `bower install angular-slick`
- Add `jquery`, `angular`, `slick-carousel` and `angular-slick` to your code:

```html
<link rel="stylesheet" href="bower_components/slick-carousel/slick/slick.css">
<script src="bower_components/jquery/jquery.js"></script>
<script src="bower_components/angular/angular.js"></script>
<script src="bower_components/slick-carousel/slick/slick.js"></script>
<script src="bower_components/angular-slick/dist/slick.js"></script>
```

- Add a dependency to the `slick` module in your application.

```js
angular.module('MyApp', ['slick']);
```

- Add a `slick` element to your html:

```html
<slick>
  ...
</slick>

<slick infinite=true slides-to-show=3 slides-to-scroll=3>
  ...
</slick>

<slick dots=true infinite=false speed=300 slides-to-show=5 touch-move=false slides-to-scroll=1>
  ...
</slick>
```

- For initialization carousel after data is loaded use `init-onload` property. Example:

```html
<slick init-onload=true data="awesomeThings">
  ...
</slick>
```

- If you wanna read about possible settings, go [here](http://kenwheeler.github.io/slick/#settings).

That's it!
