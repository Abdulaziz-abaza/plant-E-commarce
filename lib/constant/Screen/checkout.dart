import 'package:flourapp/constant/Screen/function/listofprodct.dart';
import 'package:flourapp/constant/constant.dart';
import 'package:flourapp/provider/cart.dart';
import 'package:flourapp/shared/appBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class checkOutScrren extends StatefulWidget {
  const checkOutScrren({super.key});

  @override
  State<checkOutScrren> createState() => _checkOutScrrenState();
}

class _checkOutScrrenState extends State<checkOutScrren> {
  @override
  Widget build(BuildContext context) {
    final carttt = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
          actions: const [
            PriceAndProduct(),
          ],
          backgroundColor: AppConstants.darkgreen,
          title: const Row(children: [
            Text('Check'),
            SizedBox(
              width: 10,
            ),
            Text(
              'Out',
              style: TextStyle(color: AppConstants.secondaryColor),
            ),
          ])),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // height: MediaQuery.of(context).size.height,
              height: 550,
              child: ListView.builder(
                itemCount: carttt.selectedProduct.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            carttt.selectedProduct[index].image,
                            fit: BoxFit.cover,
                          )),
                      title: Text(carttt.selectedProduct[index].name),
                      subtitle: Text(
                          carttt.selectedProduct[index].price.toString() +
                              " LE" +
                              "   located " +
                              carttt.selectedProduct[index].location),
                      trailing: IconButton(
                          onPressed: () {
                            Provider.of<Cart>(context, listen: false)
                                .removeprodect(products[index]);
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  );
                },
              ),
            ),
            // mytextbtn(
            //   myTextt: 'Check Out ' + carttt.total.toString() + ' LE',
            //   onPressedee: () {},
            // ),
            MyButton(
                btnText: 'Check Out : ' + carttt.total.toString() + ' LE',
                onPressedee: () {})
          ],
        ),
      ),
    );
  }
}
