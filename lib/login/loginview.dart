// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flourapp/auth/googleauth.dart';
import 'package:flourapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void resetFields() {
    setState(() {
      email.clear();
      password.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 70),
          child: Form(
            key: formkey,
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
                  myvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Email';
                    }
                    return null;
                  },
                  mycontroller: email,
                  myhintText: 'Email',
                  mylabel: 'Email',
                  obscureTextt: false,
                  TextInputTypee: TextInputType.emailAddress,
                  suffixIconn: const Icon(Icons.email),
                ),
                MyTextField(
                  myvalidator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Password';
                    }
                    return null;
                  },
                  mycontroller: password,
                  TextInputTypee: TextInputType.text,
                  obscureTextt: _obscureText,
                  suffixIconn: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                  myhintText: 'Password',
                  mylabel: 'Password',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        child: mytextbtn(
                            myTextt: 'Forget Password?',
                            textColor: AppConstants.accentColor,
                            fontSize: AppConstants.mediumFontSize,
                            onPressedee: () async {
                              if (email.text == "") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(milliseconds: 4000),
                                    content: Text('Please Enter Your Email'),
                                  ),
                                );
                                return;
                              }
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(email: email.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(milliseconds: 4000),
                                  content: Text('Password Reset Email Sent'),
                                ),
                              );
                            })),
                  ],
                ),
                MyButton(
                  btnText: 'Log in',
                  onPressedee: () async {
                    if (formkey.currentState!.validate()) {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        if (credential.user!.emailVerified) {
                          Navigator.pushReplacementNamed(
                              context, '/HomeScreen');
                        } else {
                          FirebaseAuth.instance.currentUser!
                              .sendEmailVerification();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 4000),
                              content: Text('Email Verification Sent'),
                            ),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 4000),
                              content:
                                  Text('No user found for that email.........'),
                            ),
                          );
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 4000),
                              content: Text(
                                  'Wrong password provided for that user.'),
                            ),
                          );
                        }
                      }
                    } else {}
                    // resetFields();
                  },
                ),
                myspace(),
                const Divider(),
                const Text('or sign in with',
                    style: TextStyle(
                      color: AppConstants.textColor,
                      fontSize: AppConstants.largeFontSize,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 55,
                        )),
                    IconButton(
                        onPressed: () {
                          signInWithGoogle(context);
                        },
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(110),
                          child: Container(
                            child: Image.asset(
                              'assets/google.png',
                              width: 55,
                              height: 55,
                            ),
                          ),
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
                          Navigator.pushReplacementNamed(
                              context, '/RegisterPage');
                        }),
                    mytextbtn(
                        myTextt: 'note up',
                        onPressedee: () {
                          Navigator.pushNamed(context, '/addnotefolder');
                        })
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
