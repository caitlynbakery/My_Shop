# User Input

![](images/user-overview.png)

## Snack Bar
I learned that we can access another Scaffold within a file using `Scaffold.of(context)` to recieve the closest Scaffold. I then used the `showSnackBar` method and passed in a `SnackBar()` to display a text message on the bottom of the screen. 

```dart
Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
        'Added item to cart!',),
    duration: Duration(seconds: 10),
    action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
        cart.removeSingleItem(product.id);
        },),));
````

![](images/snack-bar.png)

[Home](../README.md)