import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (context, index) => ProductItem(loadedProducts[index].id,
            loadedProducts[index].title, loadedProducts[index].imageUrl),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
      ),
    );
  }
}
