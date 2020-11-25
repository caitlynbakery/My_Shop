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
