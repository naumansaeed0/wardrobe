import 'package:demo_prooject1/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class Items extends ChangeNotifier{

  final List<ProductModel> _items=[
    ProductModel(imagePath: 'assets/images/Jacket.png',name: 'Classic Denim Jacket', price: 79.99, description: 'A timeless denim jacket made from durable cotton, featuring button-front closure, chest flap pockets, and side welt pockets. Its relaxed fit and faded wash add vintage charm, perfect for casual wear. '),
    ProductModel(imagePath: 'assets/images/sweater.png',name: 'Cashmere Sweater', price: 149.99, description: 'An ultra-soft, 100% pure cashmere sweater with a crew neck, ribbed cuffs, and hem. Available in sophisticated colors, it\'s lightweight, warm, and perfect for both professional and casual settings.'),
    ProductModel(imagePath: 'assets/images/Jeans.png',name: 'High-Waisted Skinny Jeans', price: 85.00, description: 'High-waisted skinny jeans made from a stretchy cotton blend, featuring a classic five-pocket design and zip fly. Available in various washes, they flatter and elongate the legs for versatile day-to-night wear.'),
    ProductModel(imagePath: 'assets/images/Maxi.png',name: 'Floral Maxi Dress', price: 239.99, description: 'A lightweight floral maxi dress with a V-neckline, adjustable straps, and a cinched waist. Perfect for summer events, it combines comfort and elegance with its vibrant print and flowing A-line skirt.'),
  ];

  final List<ProductModel> _cart=[];

  List<ProductModel> get shop=> _items;
  List<ProductModel> get cart=> _cart;

  void addToCart(ProductModel item)
  {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(ProductModel item)
  {
    _cart.remove(item);
    notifyListeners();
  }

}