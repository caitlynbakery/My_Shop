import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/http_exception.dart';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Resin Keychain',
    //   description: 'A kpop keychain - pretty lavender color!',
    //   price: 4.00,
    //   imageUrl:
    //       'https://i.etsystatic.com/22983059/r/il/ea8361/2434648058/il_794xN.2434648058_4tm0.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Cropped Cardigan',
    //   description: 'A comfy cardigan in a pastel color.',
    //   price: 12.98,
    //   imageUrl:
    //       'https://d1flfk77wl2xk4.cloudfront.net/Assets/GalleryImage/23/068/L_g0092406823.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'White Jeans',
    //   description: 'A pair of high-waisted, wide-leg jeans.',
    //   price: 20.78,
    //   imageUrl:
    //       'https://d1flfk77wl2xk4.cloudfront.net/Assets/GalleryImage/89/454/L_g0100045489.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'Heart Earrings',
    //   description: 'Gold plated earrings handmade in Hawaii.',
    //   price: 26.00,
    //   imageUrl:
    //       'https://static.wixstatic.com/media/5cdcd9_19f81566d1d240e6ae02a27443409aa6~mv2.jpg/v1/fill/w_500,h_750,al_c,q_85,usm_0.66_1.00_0.01/5cdcd9_19f81566d1d240e6ae02a27443409aa6~mv2.webp',
    // ),
  ];

  // var _showFavoritesOnly = false;

  final String authToken;
  final String userId;

  Products(this.authToken, this.userId, this._items);

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

  Future<void> fetchAndSetProducts() async {
    var url = 'https://flutter-update-6cafa.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      url = 'https://flutter-update-6cafa.firebaseio.com/userFavorites/$userId.json?auth=$authToken';
      final favoriteResponse = await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite: favoriteData == null ? false : favoriteData[prodId] ?? false,
          imageUrl: prodData['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    // final url = 'https://flutter-update-4f3cd.firebaseio.com/products.json?auth=$authToken';
    final url = 'https://flutter-update-6cafa.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
        }),
      );
      print(json.decode(response.body));
      final newProduct = Product(
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          id: json.decode(response.body)['name']);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      // final url =
          // 'https://flutter-update-4f3cd.firebaseio.com/products/$id.json?auth=$authToken';
      final url =
          'https://flutter-update-6cafa.firebaseio.com/products/$id.json?auth=$authToken';
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> deleteProduct(String id) async {
    // final url = 'https://flutter-update-4f3cd.firebaseio.com/products/$id.json?auth=$authToken';
    final url = 'https://flutter-update-6cafa.firebaseio.com/products/$id.json?auth=$authToken';
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];
    _items.removeAt(existingProductIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product.');
    }
    existingProduct = null;
  }
}
