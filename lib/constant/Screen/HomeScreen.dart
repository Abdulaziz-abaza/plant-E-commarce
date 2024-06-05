import 'package:flourapp/constant/Screen/detaielsScreen.dart';
import 'package:flourapp/constant/Screen/drawer.dart';
import 'package:flourapp/constant/Screen/function/listofprodct.dart';
import 'package:flourapp/constant/Screen/function/serch.dart';
import 'package:flourapp/constant/constant.dart';
import 'package:flourapp/provider/cart.dart';
import 'package:flourapp/shared/appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
          actions: [
            PriceAndProduct(),
            //HERRRRRR
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: myserch());
                },
                icon: Icon(
                  Icons.search,
                  size: 40,
                )),
          ],
          backgroundColor: AppConstants.darkgreen,
          title: const Row(children: [
            Text('Flour'),
            SizedBox(
              width: 10,
            ),
            Text(
              'App',
              style: TextStyle(color: AppConstants.secondaryColor),
            ),
          ])),
      body: Scaffold(
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
                onTap: () {
                  print(products[i]);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        item: products[i],
                      ),
                    ),
                  );
                },
                child: GridTile(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        products[i].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  footer: GridTileBar(
                    trailing: IconButton(
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .addproduct(products[i]);
                        // cartinstase.addproduct(products[i]);
                      },
                      icon: Icon(Icons.add),
                      color: AppConstants.textColor,
                      iconSize: 30,
                    ),
                    title: Text(
                      products[i].name,
                      style: TextStyle(color: AppConstants.textColor),
                    ),
                    leading: Text(products[i].price.toString()),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
