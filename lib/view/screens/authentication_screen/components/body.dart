// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/view/screens/home_screen/home_screen.dart';

import '../../../../controller/size_config.dart';
import '../../../../controller/styles.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/text_field.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Container(
            color: kPrimaryColor,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(87),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset("assets/images/smallFruit.png",
                      height: getProportionateScreenHeight(37.52),
                      width: getProportionateScreenWidth(50),
                    )
                  ],
                ),
                Image.asset("assets/images/aBasket.png",
                  height: getProportionateScreenHeight(260),
                  width: getProportionateScreenWidth(301),
                ),
                SizedBox(height: getProportionateScreenHeight(8),),
                SvgPicture.asset("assets/images/aScreenShadow.svg"),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 4,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: getProportionateScreenHeight(56)),
                  CustomTextField(
                    title: "What is your firstname?",
                    hintText: "Tony",
                  ),
                  SizedBox(height: getProportionateScreenHeight(56),),
                  AppButton(
                    title: "Start Ordering",
                    cta: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                        return HomeScreen();
                      }), (route) => false);
                    },
                  )
                ],
              ),
            )),
      ],
    );
  }
}


