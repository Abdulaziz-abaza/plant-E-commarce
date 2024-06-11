import 'package:flutter/material.dart';

class addnotefolder extends StatefulWidget {
  const addnotefolder({super.key});

  @override
  State<addnotefolder> createState() => _addnotefolderState();
}

class _addnotefolderState extends State<addnotefolder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "addnote");
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: [
            Card(
              child: Container(
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.folder,
                          size: 150,
                        )),
                    Text('data')
                  ],
                ),
              ),
            ),
            Card(
              child: Container(
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.folder,
                          size: 150,
                        )),
                    Text('data')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
