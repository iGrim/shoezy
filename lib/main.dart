import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_shop/controllers/mainscreen_provider.dart';
import 'package:online_shop/controllers/product_provider.dart';
import 'package:online_shop/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

// entrypoint of the app
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.deleteBoxFromDisk('cart_box');
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  //method that initializes the app and run top level wigets
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
    ChangeNotifierProvider(create: (context) => ProductNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // overall theme and app layout
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dbestech',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // sets the homescreen of the app
      home: MainScreen(),
    );
  }
}