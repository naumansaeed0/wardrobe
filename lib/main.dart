
import 'package:demo_prooject1/models/shop_items.dart';
import 'package:flutter/material.dart';
import 'package:demo_prooject1/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context)=>Items(),
      child: const MyApp(),
    )
  );


}
