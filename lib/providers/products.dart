import 'package:flutter/material.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Resin Keychain',
      description: 'A kpop keychain - pretty lavender color!',
      price: 4.00,
      imageUrl:
          'https://i.etsystatic.com/22983059/r/il/ea8361/2434648058/il_794xN.2434648058_4tm0.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Cropped Cardigan',
      description: 'A comfy cardigan in a pastel color.',
      price: 12.98,
      imageUrl:
          'https://d1flfk77wl2xk4.cloudfront.net/Assets/GalleryImage/23/068/L_g0092406823.jpg',
    ),
    Product(
      id: 'p3',
      title: 'White Jeans',
      description: 'A pair of high-waisted, wide-leg jeans.',
      price: 20.78,
      imageUrl:
          'https://d1flfk77wl2xk4.cloudfront.net/Assets/GalleryImage/89/454/L_g0100045489.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Heart Earrings',
      description: 'Gold plated earrings handmade in Hawaii.',
      price: 26.00,
      imageUrl:
          'https://static.wixstatic.com/media/5cdcd9_19f81566d1d240e6ae02a27443409aa6~mv2.jpg/v1/fill/w_500,h_750,al_c,q_85,usm_0.66_1.00_0.01/5cdcd9_19f81566d1d240e6ae02a27443409aa6~mv2.webp',
    ),
  ];

  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((product) => product.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: DateTime.now().toString());
    _items.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {}
  }
}
