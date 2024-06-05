import 'package:flourapp/constant/Screen/function/listofprodct.dart';
import 'package:flutter/material.dart';

class myserch extends SearchDelegate {
  List username = [
    "Abdulaziz",
    "Ahmed",
    "ali",
    "Ahmad",
    "Ahmed",
    "Abdulaziz",
    "Ahmed",
    "Ali",
    "Ahmad",
    "Ahmed",
    "Abdulaziz",
    "Ahmed",
    "Ali",
    "Ahmad",
  ];
  List? filtelist;

  // @overriPPe
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("search $query   ");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showResults(context);
              },
              child: Card(
                color: Colors.green,
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(products[index].name),
                ),
              ),
            );
          });
    } else
      filtelist = products
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();

    {
      return ListView.builder(
          itemCount: filtelist!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showResults(context);
              },
              child: Card(
                color: Colors.green,
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(filtelist![index]),
                ),
              ),
            );
          });
    }
  }
}
