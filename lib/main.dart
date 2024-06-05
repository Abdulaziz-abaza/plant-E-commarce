import 'package:firebase_core/firebase_core.dart';
import 'package:flourapp/constant/Screen/HomeScreen.dart';
import 'package:flourapp/constant/Screen/SplashScreen.dart';
import 'package:flourapp/constant/Screen/checkout.dart';
import 'package:flourapp/constant/Screen/detaielsScreen.dart';
import 'package:flourapp/login/loginview.dart';
import 'package:flourapp/login/registerview.dart';
import 'package:flourapp/provider/cart.dart';
import 'package:flutter/material.dart';
import 'constant/Screen/function/listofprodct.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('++++++++++++++++User is currently signed out!');
      } else {
        print('+++++++++++++++User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(debugShowCheckedModeBanner: false, routes: {
        '/': (context) => Splashscreen(),
        '/LoginView': (context) => const LoginView(),
        '/RegisterPage': (context) => RegisterPage(),
        '/HomeScreen': (context) => HomeScreen(),
        '/detaielsScreen': (context) => DetailsScreen(item: products[1]),
        '/checkOutScrren': (context) => checkOutScrren(),
      }),
    );
  }
}
