// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/size_config.dart';
import 'package:fruit_hub/view/screens/basket_screen/basket_screen.dart';


PreferredSize HomeAppbar(BuildContext context,{ String? text, Function? cta}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(10),),
                GestureDetector(
                  child: Image.asset("assets/icons/menu.png",
                    width: getProportionateScreenWidth(22),
                    height: getProportionateScreenHeight(11),
                  ),
                ),
              ],
            ),
            // SizedBox(width: 25,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return BasketScreen();
                }));
              },
              child: Column(
                children: [
                  Image.asset("assets/icons/basket.png",
                    width: getProportionateScreenWidth(24),
                    height: getProportionateScreenHeight(24),
                  ),
                  Text("My basket",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
            // Text(
            //   text,
            //   style: TextStyle(
            //     color: kPrimaryColor,
            //     fontSize: 20,
            //     fontWeight: FontWeight.w400,
            //   ),
            // ),
          ],
        ),
      ),
    ),
  );
}