import 'package:firebase_auth/firebase_auth.dart';
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
      ListTile(title: const Text('about me  '), onTap: () {}),
      IconButton(
        onPressed: () async {
          try {
            GoogleSignIn googleSignIn = GoogleSignIn();

            // التحقق مما إذا كان هناك مستخدم مسجل دخول في Google
            if (await googleSignIn.isSignedIn()) {
              await googleSignIn.disconnect();
            }

            // التحقق مما إذا كان هناك مستخدم مسجل دخول في Firebase
            User? currentUser = FirebaseAuth.instance.currentUser;
            if (currentUser != null) {
              await FirebaseAuth.instance.signOut();
            }

            // التحقق مما إذا كان السياق (context) غير فارغ قبل استخدامه
            if (context != null) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/LoginView', (Route<dynamic> route) => false);
            }
          } catch (e) {
            // التعامل مع الأخطاء التي قد تحدث أثناء عملية تسجيل الخروج
            print("Error during sign out: $e");
          }
        },
        icon: Icon(Icons.exit_to_app),
      ),

      // IconButton(
      //     onPressed: () async {
      //       GoogleSignIn googlesingin = GoogleSignIn();
      //        googlesingin.disconnect();
      //       await FirebaseAuth.instance.signOut();
      //       Navigator.of(context).pushNamedAndRemoveUntil(
      //           '/LoginView', (Route<dynamic> route) => false);
      //     },
      //     icon: Icon(Icons.exit_to_app)),
    ]));
  }
}
