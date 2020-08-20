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

## Provider Implementation
1) import provider package from dart packages
2) Wrap MaterialApp with Provider widget
3) Add `create` property that returns the information you want to pass down. 

```dart
import 'package:provider/provider.dart';
...

class MyApp extends StatelessWidget {
  final String data = 'Top Secret Data';

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (context) => data,
      child: MaterialApp())}}
```

4) Access data in other widget using `Text(Provider.of<String>(context));`

```dart 
class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(Provider.of<String>(context));
  }
}
```