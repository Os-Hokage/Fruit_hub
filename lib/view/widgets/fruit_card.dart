// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/provider/heart_provider.dart';
import 'package:fruit_hub/model/fruits_model.dart';
import 'package:fruit_hub/view/screens/fruit_detail_screen/fruit_detail_screen.dart';
import 'package:provider/provider.dart';

import '../../controller/size_config.dart';
import '../../controller/styles.dart';




class FruitCard extends StatelessWidget {
  final Fruits fruit;
  const FruitCard({Key? key, required this.fruit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HeartProvider(),
      child: Consumer<HeartProvider>(
        builder: (_, provider, child){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: fruit.isRec? getProportionateScreenWidth(23) : getProportionateScreenWidth(16)),
                height: fruit.isRec? getProportionateScreenHeight(183) : getProportionateScreenHeight(150),
                width: fruit.isRec? getProportionateScreenWidth(152) :getProportionateScreenWidth(140),
                decoration: BoxDecoration(
                  color: fruit.color ?? Colors.white,
                  borderRadius: fruit.isRec? BorderRadius.circular(16) :BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(16),
                      ),
                      Stack(
                        children: [
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              onTap: (){
                                if(provider.isFav == true){
                                  provider.isFav = false;
                                  fruit.isFav = provider.isFav;
                                  // provider.isFav = fruit.isFav;

                                } else{
                                  provider.isFav = true;
                                  // fruit.isFav = provider.isFav;
                                }
                              },
                              child:
                              fruit.isFav?
                              Icon(
                                CupertinoIcons.heart_fill,
                                color: kPrimaryColor,
                                size: 20,
                              )
                                  :Icon(
                                CupertinoIcons.heart,
                                color: kPrimaryColor,
                                size: 20,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_){
                                    return FruitDetailsScreen(fruit: fruit,);
                                  }));
                                },
                                child: Image.asset(
                                  fruit.image,
                                  height:fruit.isRec? getProportionateScreenHeight(80) :getProportionateScreenHeight(64),
                                  width: fruit.isRec? getProportionateScreenWidth(80) :getProportionateScreenWidth(64),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
                      Text(
                        fruit.name,
                        style: kTextSizeStyle16.copyWith(
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₦ ${fruit.price}",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: (){
                              fruit.inCart = true;
                            },
                            child: Container(
                              height: getProportionateScreenHeight(24),
                              width: getProportionateScreenWidth(24),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: kLightOrange),
                              child: Icon(
                                Icons.add,
                                color: kPrimaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },

      ),
    );
  }
}
