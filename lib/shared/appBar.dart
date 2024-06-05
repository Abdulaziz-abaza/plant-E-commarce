import 'package:flourapp/provider/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceAndProduct extends StatelessWidget {
  const PriceAndProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cartinstase, child) {
      return Row(
        children: [
          Container(
              width: 100,
              child: Stack(children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/checkOutScrren');
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 40,
                    )),
                Positioned(
                  top: 2,
                  right: 35,
                  child: Container(
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: Text(
                        textAlign: TextAlign.center,
                        "${cartinstase.selectedProduct.length}",
                      )),
                ),
              ])),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              cartinstase.total.toString() + " \ LE",
            ),
          ),
        ],
      );
    });
  }
}
