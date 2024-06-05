import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
              image: AssetImage('assets/1.png'), fit: BoxFit.fill),
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(title: const Text('about me  '), onTap: () {}),
      IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/LoginView', (Route<dynamic> route) => false);
          },
          icon: Icon(Icons.exit_to_app)),
    ]));
  }
}
