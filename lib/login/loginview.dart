// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flourapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              height: 200,
              width: 400,
              child: Lottie.asset('assets/splash.json'),
            ),
            MyTextField(
              mycontroller: email,
              myhintText: 'Email',
              mylabel: 'Email',
              obscureTextt: false,
              TextInputTypee: TextInputType.emailAddress,
              suffixIconn: Icon(Icons.email),
            ),
            MyTextField(
              mycontroller: password,
              TextInputTypee: TextInputType.multiline,
              obscureTextt: true,
              suffixIconn: Icon(Icons.remove_red_eye),
              myhintText: 'Password',
              mylabel: 'Password',
            ),
            MyButton(
              btnText: 'Log in',
              onPressedee: () async {
                try {
                  final credential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );

                  Navigator.pushReplacementNamed(context, '/HomeScreen');
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration:
                          const Duration(milliseconds: 4000), // default 4s
                      content: const Text('some thing erorr ان كان عاجبك'),
                    ),
                  );
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
                print('helloqqqq');
              },
            ),
            Text('or sign in with'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 60,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.network(
                      'assets/google.svg',
                      // '	https://fonts.gstatic.com/s/i/productlogos/googleg/v6/24px.svg',
                      height: 60.0,
                      width: 60.0,
                      placeholderBuilder: (BuildContext context) =>
                          CircularProgressIndicator(),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?",
                    style: TextStyle(
                      color: AppConstants.textColor,
                      fontSize: AppConstants.largeFontSize,
                    )),
                mytextbtn(
                    myTextt: 'Sign up',
                    onPressedee: () {
                      Navigator.pushReplacementNamed(context, '/RegisterPage');
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
