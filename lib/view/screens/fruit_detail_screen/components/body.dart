// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/provider/counter_provider.dart';
import 'package:fruit_hub/controller/styles.dart';
import 'package:fruit_hub/view/screens/home_screen/home_screen.dart';
import 'package:fruit_hub/view/widgets/app_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../controller/provider/heart_provider.dart';
import '../../../../controller/size_config.dart';
import '../../../../model/fruits_model.dart';
import '../../../widgets/back_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.fruit}) : super(key: key);

  final Fruits fruit;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  currency(context) {
    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: getProportionateScreenWidth(24)),
            child: CustomBackButton(cta: (){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                return HomeScreen();
              }), (route) => false);
    })),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Center(
          child: Image.asset(
            widget.fruit.image,
            height: getProportionateScreenHeight(176),
            width: getProportionateScreenWidth(176),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(32),
        ),
        Expanded(
          // flex: 2,
          child: Container(
            height: 498,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(24),
                    right: getProportionateScreenWidth(24),
                    bottom: getProportionateScreenWidth(24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(40),
                    ),
                    Text(
                      widget.fruit.name,
                      style: kTextSizeStyle32,
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(33),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       ChangeNotifierProvider(create: (_) => CounterProvider(),
                         child: Consumer<CounterProvider>(
                           builder: (_, provider, child){
                             return  Row(
                               children: [
                                 Counter(isAdd: false, cta: (){
                                   if(provider.getCounter() > 0){
                                     provider.decreaseCount();
                                     widget.fruit.pack = provider.getCounter();
                                   }
                                 }),
                                 Padding(
                                   padding: EdgeInsets.symmetric(
                                       horizontal: getProportionateScreenWidth(24)),
                                   child: Text(
                                     widget.fruit.pack.toString(),
                                     style: kTextSizeStyle24,
                                   ),
                                 ),
                                 Counter(isAdd: true, cta: (){
                                   provider.increaseCount();
                                   widget.fruit.pack = provider.getCounter();
                                 }),
                               ],
                             );
                           },
                         ),
                       ),
                        Text(
                          "${currency(context).currencySymbol} ${widget.fruit.price}",
                          style: kTextSizeStyle24,
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(32),
                    ),
                    Divider(),
                    SizedBox(
                      height: getProportionateScreenHeight(32),
                    ),
                    Text(
                      "One Pack Contains:",
                      style: kTextSizeStyle20,
                    ),
                    Divider(
                      color: kPrimaryColor,
                      thickness: 2,
                      endIndent: 185,
                    ),
                    Text(
                      widget.fruit.contains,
                      style: kTextSizeStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Divider(),
                    SizedBox(
                      height: getProportionateScreenHeight(24),
                    ),
                    Text(
                      "If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you make.",
                      style: kTextSizeBlackStyle16.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(43),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Heart(),
                        AppButton(
                            title: "Add to basket",
                            width: 219,
                            cta: () {
                              widget.fruit.inCart = true;
                            })
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Container(height: getProportionateScreenHeight(10), color: Colors.white,),
      ],
    );
  }

  GestureDetector Counter({required bool isAdd, required Function cta}) {
    return GestureDetector(
      onTap: cta as Function(),
      child: Container(
        height: getProportionateScreenHeight(32),
        width: getProportionateScreenWidth(32),
        decoration: isAdd
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: kLightOrangeColor,
              )
            : BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black),
              ),
        child: isAdd
            ? Icon(
                Icons.add,
                color: kPrimaryColor,
              )
            : Icon(
                Icons.remove,
              ),
      ),
    );
  }

  Widget Heart() {
    return ChangeNotifierProvider(
      create: (_) => HeartProvider(),
      child: Consumer<HeartProvider>(builder: (_, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.isFav = widget.fruit.isFav;
            if (provider.isFav == true) {
              provider.isFav = false;
              widget.fruit.isFav = provider.isFav;
            } else {
              provider.isFav = true;
              widget.fruit.isFav = provider.isFav;
            }
          },
          child: Container(
            height: getProportionateScreenHeight(48),
            width: getProportionateScreenWidth(48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: kLightOrangeColor,
            ),
            child: widget.fruit.isFav
                ? Icon(
                    CupertinoIcons.heart_fill,
                    color: kPrimaryColor,
                  )
                : Icon(
                    CupertinoIcons.heart,
                    color: kPrimaryColor,
                  ),
          ),
        );
      }),
    );
  }
}
