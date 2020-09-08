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
```

![](images/snack-bar.png)

## Form
We are going to improve the way that we collect the user input using the Form widget. Previously, we used TextEditingControlls to manage the user data. 

[Home](../README.md)