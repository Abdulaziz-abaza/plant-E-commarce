import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flourapp/constant/constant.dart';
import 'package:flourapp/notes/addnotefolder.dart';
import 'package:flutter/material.dart';

class addnote extends StatefulWidget {
  const addnote({super.key});

  @override
  State<addnote> createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  TextEditingController mycontroller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  CollectionReference catigeray =
      FirebaseFirestore.instance.collection('catigeray');

  addnote() async {
    if (formkey.currentState!.validate()) {
      try {
        DocumentReference response = await catigeray.add({
          'title': mycontroller.text,
        });
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => addnotefolder()));
      } catch (e) {
        print("errorwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww : $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Form(
                key: formkey,
                child: TextField(
                    controller: mycontroller,
                    decoration: InputDecoration(
                        fillColor: AppConstants.backgroundColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: AppConstants.activeColor)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: AppConstants.secondaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: AppConstants.activeColor)),
                        labelText: 'title',
                        labelStyle: TextStyle())),
              ),
              myspace(),
              MyButton(
                  btnText: 'Add Note',
                  onPressedee: () {
                    if (formkey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  }),
            ],
          )),
    );
  }
}
