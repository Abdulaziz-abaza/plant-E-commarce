import 'package:flourapp/constant/Screen/function/listofprodct.dart';
import 'package:flourapp/constant/Screen/function/serch.dart';
import 'package:flourapp/constant/Screen/function/starRating.dart';
import 'package:flourapp/constant/constant.dart';
import 'package:flourapp/shared/appBar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Products item;
  DetailsScreen({
    super.key,
    required this.item,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: const [
              PriceAndProduct(),
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(widget.item.image, fit: BoxFit.fill)),
                Text(widget.item.price.toString() + ' LE',
                    style: TextStyle(
                        fontSize: AppConstants.largeFontSize,
                        fontWeight: AppConstants.boldFontWeight)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        color: Color.fromARGB(255, 238, 45, 45),
                        width: 50,
                        height: 30,
                        child: Text(widget.item.name),
                      ),
                    ),
                    SizedBox(
                        width:
                            0), // يمكنك تعديل العرض للتحكم بالمسافة بين العناصر
                    StarRating(),
                    SizedBox(
                        width:
                            0), // يمكنك تعديل العرض للتحكم بالمسافة بين العناصر
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_location,
                              color: Color.fromARGB(255, 58, 56, 59),
                              size: 30,
                            )),
                        SizedBox(
                            width:
                                0), // يمكنك تعديل العرض للتحكم بالمسافة بين العناصر
                        Text(
                          widget.item.location,
                          style: TextStyle(
                              fontSize: AppConstants.mediumFontSize,
                              fontWeight: AppConstants.boldFontWeight),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Description : ',
                    style: TextStyle(
                        fontSize: AppConstants.largeFontSize,
                        fontWeight: AppConstants.boldFontWeight),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  widget.item.description,
                  style: TextStyle(overflow: TextOverflow.fade),
                  maxLines: isShowMore ? 3 : null,
                ),
                mytextbtn(
                    myTextt: isShowMore ? "Show More" : "Show Less",
                    onPressedee: () {
                      setState(() {
                        isShowMore = !isShowMore;
                      });
                    }),
              ],
            ),
          ),
        ));
  }
}
