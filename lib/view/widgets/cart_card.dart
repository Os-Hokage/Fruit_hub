// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:fruit_hub/view/screens/fruit_detail_screen/fruit_detail_screen.dart';

import '../../controller/size_config.dart';
import '../../controller/styles.dart';
import '../../model/fruits_model.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key, required this.fruit}) : super(key: key);

  final Fruits fruit;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_){
          return FruitDetailsScreen(fruit: fruit);
        }));
      },
      child: Container(
        margin: EdgeInsets.only(top: getProportionateScreenHeight(32)),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(64),
                        width: getProportionateScreenWidth(65),
                        decoration: BoxDecoration(
                          color: fruit.color,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                          child: Image.asset(
                            fruit.image,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(16),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fruit.name,
                            style: kTextSizeBlackStyle16,
                          ),
                          Text(
                            "${fruit.pack}packs",
                            style: kTextSizeBlackStyle16.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "₦ ${fruit.price}",
                    style: kTextSizeBlackStyle16
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(16),),
            Divider()
          ],
        ),
      ),
    );
  }
}
