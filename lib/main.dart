import 'package:firebase_core/firebase_core.dart';
import 'package:firestore/auth/core/dashboard_screen.dart';
import 'package:firestore/firebase_options.dart';
import 'package:firestore/product/provider/product_provider.dart';
import 'package:firestore/product/service/product_service.dart';
import 'package:firestore/user/provider/user_provider.dart';
import 'package:firestore/user/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          UserProvider(UserService());
        }),
        ChangeNotifierProvider(create: (context){
          ProductProvider(ProductService());
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DashboardScreen(),
      ),
    );
  }
}

