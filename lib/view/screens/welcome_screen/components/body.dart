// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/controller/size_config.dart';
import 'package:fruit_hub/controller/styles.dart';

import '../../../widgets/app_button.dart';
import '../../authentication_screen/authentication_screen.dart';

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
                Image.asset("assets/images/wbasket.png",
                  height: getProportionateScreenHeight(260),
                  width: getProportionateScreenWidth(301),
                ),
                SizedBox(height: getProportionateScreenHeight(8),),
                SvgPicture.asset("assets/images/wScreenShadow.svg"),
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
                  Text("Get The Freshest Fruit Salad Combo",
                    style: kTextSizeStyle20,
                  ),
                  SizedBox(height: getProportionateScreenHeight(8)),
                  Padding(
                    padding: EdgeInsets.only(right: getProportionateScreenWidth(45)),
                    child: Text("We deliver the best and freshest fruit salad in town. Order for a combo today!!!",
                      style: kTextSizeStyle16,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(58),),
                  AppButton(
                    title: "Let's Continue",
                    cta: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                        return AuthenticationScreen();
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

