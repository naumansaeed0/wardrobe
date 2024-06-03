import 'package:demo_prooject1/models/my_list_tile.dart';
import 'package:demo_prooject1/models/my_product_tile.dart';
import 'package:demo_prooject1/models/shop_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {

    final products = context.watch<Items>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[300],
        centerTitle: true,
          title: const Text("Home",style: TextStyle(fontSize: 25),),
        actions: [IconButton(onPressed: ()=>Navigator.pushNamed(context, '/cart_page'), icon: const Icon(Icons.shopping_cart))],
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
                  onTap: ()=> Navigator.pop(context),
                ),
                MyListTile(
                    text: "Cart",
                    icon: Icons.shopping_cart,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/cart_page');
                    },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child:
                  MyListTile(text: "Logout", icon: Icons.logout, onTap: () {
                    FirebaseAuth.instance.signOut();

                  }),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [

          const SizedBox(height: 20,),

          Center(
            child: Text(
              'Pick from a selected list of premium products',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          SizedBox(
            height: 550,
            child: ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){

                  final product = products[index];
                  return MyProductTile(product: product);
                }
            ),
          ),
          const Image(
            width: 100,
            height: 200,
            image: AssetImage('assets/images/logo.png'),
          ),

        ],
      )
      );
  }
}
