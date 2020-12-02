# Animation

## Learning Topics
* Different ways of animating widgets
* Custom animations & Built-in Animations/Helpers

* tween
* animation curve
* duration
* animation controller

## Tween
A tween is an inbetween widget that generates multiple frames between two widgets to
give the appearance that they are animating. 

## Animation Curve
An animation curve represents the speed at which an animation occurs per every frame. 
The speed changes and can accelerate/decelerate. 

## Duration
Duration is the time that an animation appears.

## AnimatedBuilder
AnimatedBuilder builds animations for a certain portion of the screen. By using `setState()` for animations, it reloads the entire screen. This widget
is useful to replace `setState()` and make it more efficient to animate the screen.

```dart
 child: AnimatedBuilder(animation: _heightAnimation, builder: (ctx, ch) => Container(
        //height: _authMode == AuthMode.Signup ? 320 : 260,
        height: _heightAnimation.value.height,
 ))
```

## Implicit Animation
Doesn't require the use of an animation controller and instead relies on the current setting of animated widget  for the starting point. 


```dart
return AnimatedContainer(
    color: Colors.red,
    height: size / 2,
    width: size,
    duration: Duration(seconds: 1)
)
```

Tween animation is a custom implicit animation. 

## Explicit Animation
These animations require an animation controller. They start
animating when explicity asked to. You have to manage the lifecycle of the 
explicit animation inside of a stateful widget. For example, we initilize the 
controller in `initState()` and dispose of the controller in `dispose()`. 

If the widget repeats forever or if the widget is 'discontinious' or if
multiple widgets animate together, then you should use an explicit animation.


```dart
var _controller = AnimationController(
    duration: Duration(seconds: 1),
    vsync: this,
)

...
_controller.forward()
```

## Hero Animation
Hero animations animate an image to increase in size and float to a position on 
the screen. To implement the Hero animation, you wrap an image with the Hero widget. The Hero animation works across 2 different screens.

``dart
child: Hero(
    tag: product.id,
    child: FadeInImage(
        placeholder: AssetImage('images/placeholder.png'),
        image: NetworkImage(product.imageUrl)
)
)
```