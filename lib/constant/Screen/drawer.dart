import 'package:firebase_auth/firebase_auth.dart';
import 'package:flourapp/notes/addnotefolder.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          // color: Colors.blue,
          image: DecorationImage(
              image: AssetImage('assets/logo.png'), fit: BoxFit.fill),
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
          title: const Text('about me  '),
          leading: Icon(Icons.info),
          onTap: () {}),
      ListTile(
          title: const Text('Notes  '),
          leading: Icon(Icons.note),
          onTap: () {
            Navigator.popAndPushNamed(context, "addnotefolder");
          }),
      ListTile(
        title: const Text('Exit  '),
        leading: Icon(Icons.exit_to_app_outlined),
        onTap: () async {
          try {
            // بدء عملية تسجيل الخروج من Google
            GoogleSignIn googleSignIn = GoogleSignIn();
            await googleSignIn.signOut();

            // تسجيل الخروج من Firebase
            // await FirebaseAuth.instance.signOut();

            // الانتقال إلى شاشة تسجيل الدخول
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/LoginView',
              (Route<dynamic> route) => false,
            );
          } catch (e) {
            print("خطأ أثناء تسجيل الخروج: $e");
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("خطأ أثناء تسجيل الخروج: $e"),
              ),
            );
          }
        },
      )
    ]));
  }
}
