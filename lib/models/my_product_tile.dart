import 'package:demo_prooject1/models/product_model.dart';
import 'package:demo_prooject1/models/shop_items.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget{

  final ProductModel product;
  const MyProductTile({
    required this.product,
    super.key
  });

  void addItemToCart(BuildContext context){
   showDialog(
       context: context,
       builder: (context)=>AlertDialog(
         content: const Text('Add this item to your cart?'),
         actions: [
           MaterialButton(
             onPressed: ()=>Navigator.pop(context),
             child: const Text('Cancel'),
           ),
           MaterialButton(
             onPressed: (){

               Navigator.pop(context);
               context.read<Items>().addToCart(product);
             },
             child: const Text('Yes'),
           )
         ],
       )
   );

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(14),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  child: Image.asset(product.imagePath),
                ),
              ),
              const SizedBox(height: 25,),
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                product.description,
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),

            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$"+product.price.toStringAsFixed(2)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(

                  icon: const Icon(Icons.add),
                  onPressed: ()=>addItemToCart(context),
                ),
              )
            ],
          ),
        ],
      )
    );
  }
}