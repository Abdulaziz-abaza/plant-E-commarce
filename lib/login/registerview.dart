import 'package:firebase_auth/firebase_auth.dart';
import 'package:flourapp/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController firstname = TextEditingController();
  TextEditingController secondname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    AppBar(
      backgroundColor: Colors.transparent,
    );
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              height: 300,
              child: Lottie.asset('assets/Register.json'),
            ),
            MyTextField(
              mycontroller: firstname,
              myhintText: 'Enter Your First Name',
              mylabel: 'Enter  Name',
              obscureTextt: false,
              suffixIconn: Icon(Icons.person),
            ),
            MyTextField(
              mycontroller: secondname,
              myhintText: 'Enter Your Second Name',
              mylabel: 'Enter Name',
              obscureTextt: false,
              suffixIconn: Icon(Icons.person),
            ),
            MyTextField(
              mycontroller: email,
              myhintText: 'Enter Your Email',
              mylabel: 'Enter Email',
              obscureTextt: false,
              TextInputTypee: TextInputType.emailAddress,
              suffixIconn: Icon(Icons.email),
            ),
            MyTextField(
              mycontroller: password,
              myhintText: 'Enter Your Password',
              mylabel: 'Enter Password',
              obscureTextt: true,
              suffixIconn: Icon(Icons.remove_red_eye),
            ),
            MyTextField(
              mycontroller: confpassword,
              myhintText: 'Confirm Password',
              mylabel: 'Confirm Password',
              obscureTextt: true,
              suffixIconn: Icon(Icons.remove_red_eye),
            ),
            MyButton(
              btnText: 'Sign up',
              onPressedee: () async {
                try {
                  // ignore: unused_local_variable
                  final credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: email.text,
                    password: password.text,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
                Navigator.pushNamed(context, '/HomeScreen');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do you have an account?",
                    style: TextStyle(
                      color: AppConstants.textColor,
                      fontSize: AppConstants.largeFontSize,
                    )),
                mytextbtn(
                    myTextt: 'Sign in',
                    onPressedee: () {
                      Navigator.pushNamed(context, '/LoginView');
                    })
              ],
            )
          ],
        ),
      ),
    ));
  }
}
