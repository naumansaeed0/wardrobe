import 'package:demo_prooject1/models/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:demo_prooject1/models/my_list_tile.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../models/shop_items.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeItemFromCart(BuildContext context,ProductModel product) {
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              content: const Text('Remove this item from your cart?'),
              actions: [
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Items>().removeFromCart(product);
                  },
                  child: const Text('Yes'),
                )
              ],
            )
    );
  }

  void payButton(BuildContext context){
    showDialog(context: context, builder: (context)=>
      const AlertDialog(
        content: Text("User wants to pay.."),
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    final cart = context
        .watch<Items>()
        .cart;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.grey[300],
          centerTitle: true,
          title: const Text("Cart",style: TextStyle(fontSize: 25),)
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[700],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Center(
                      child: Icon(
                        Icons.shopping_bag,
                        size: 70,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  MyListTile(
                      text: "Shop",
                      icon: Icons.home,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/home_page');
                      }),
                  MyListTile(
                    text: "Cart",
                    icon: Icons.shopping_cart,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: MyListTile(
                    text: "Logout",
                    icon: Icons.logout,
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                    }),
              ),
            ],
          ),
        ),
        body:  cart.isEmpty? const Center(child: Text("Your cart is empty..")):Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.price.toStringAsFixed(2)),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => removeItemFromCart(context, item),
                      ),
                    );
                  },
                )
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: MyButton(onTap: ()=>payButton(context), text: "PAY NOW"),
            )

          ],
    ));
  }

}
