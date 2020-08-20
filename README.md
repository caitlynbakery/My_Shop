# My_Shop
## State Management

Passing data between multiple levels of an app can be confusing because you have to pass it through various constructors.

```dart
class Level1 extends StatelessWidget {
  final String data;
  Level1(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(child: Level2(data));
  }
}
```

As the number of levels increase, the data is passed through more and more constructors so the problem becomes bigger. 

```dart
class Level2 extends StatelessWidget {
  final String data;
  Level2(this.data);
  @override
  Widget build(BuildContext context) {
    return 
        Level3(data), }}
```

Because of this problem, it is recommended to use a provider widget. The core concept is that the widgets have a listener that listens for changes in the state. 

<image src="docs/provider.png" width=50%>