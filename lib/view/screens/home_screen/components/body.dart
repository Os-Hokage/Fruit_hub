// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/size_config.dart';
import 'package:fruit_hub/controller/styles.dart';
import 'package:fruit_hub/model/fruits_model.dart';


import '../../../widgets/fruit_card.dart';
import 'search_field.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: "Hottest",
    ),
    Tab(
      text: "Popular",
      // child: Text(
      //   "Popular",
      //   style: kTextSizeStyle16,
      // ),
    ),
    Tab(
      text: "New Combo",

    ),
    Tab(
      text: "Top",
    ),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          kGreyColor3,
          kGreyColor3,
          kGreyColor3,
          kGreyColor3,
          kGreyColor3,
          kGreyColor3,
        ],
      )),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                            text: "Hello Tony, ",
                            style: kTextSizeStyle20.copyWith(
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: "What fruit salad \ncombo do you want today?",
                            style: kTextSizeStyle20),
                      ])),
                  SizedBox(
                    height: getProportionateScreenHeight(24),
                  ),
                  CustomSearchField(),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Text(
                    "Recommended Combo",
                    style: kTextSizeStyle24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(24),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(fruits.length, (index) {
                    if (fruits[index].isRec) {
                      return FruitCard(fruit: fruits[index]);
                    } else {
                      return SizedBox.shrink();
                    }
                  })
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(50),),
            TabBar(
              isScrollable: true,
              labelStyle: kTextSizeStyle24,
              unselectedLabelStyle: kTextSizeStyle16,
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: kPrimaryColor,
                  width: 2,
                ),
                insets: EdgeInsets.only(right: 60, left: 15)
              ),
              tabs: myTabs,
              controller: _tabController,
            ),
            SizedBox(height: getProportionateScreenHeight(20),),
            SizedBox(
              height: 200,
              child: TabBarView(controller: _tabController, children: [
                Section(),
                Section(),
                Section(),
                Section(),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView Section() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(fruits.length, (index) {
            if (fruits[index].isRec) {
              return SizedBox.shrink();
            } else {
              return FruitCard(fruit: fruits[index]);
            }
          })
        ],
      ),
    );
  }
}
