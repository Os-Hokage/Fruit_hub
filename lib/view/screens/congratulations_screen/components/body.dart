// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/controller/size_config.dart';
import 'package:fruit_hub/controller/styles.dart';
import 'package:fruit_hub/view/screens/delivery_status_screen/delivery_status_screen.dart';
import 'package:fruit_hub/view/screens/home_screen/home_screen.dart';
import 'package:fruit_hub/view/widgets/app_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: SvgPicture.asset("assets/images/congratulations.svg")),
        SizedBox(height: getProportionateScreenHeight(56),),
        Text("Congratulations!!!",
          style: kTextSizeStyle32,
        ),
        SizedBox(height: getProportionateScreenHeight(16),),
        Text("Your order have been taken and \nis being attended to",
          style: kTextSizeStyle20,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: getProportionateScreenHeight(56),),
        AppButton(title: "Track order", cta: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
            return DeliveryStatusScreen();
          }), (route) => false);
        },
          width: getProportionateScreenWidth(133),
        ),
        SizedBox(height: getProportionateScreenHeight(64),),
        AppButton(title: "Continue shopping", cta: (){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
            return HomeScreen();
          }), (route) => false);
        }, width: getProportionateScreenWidth(181), isOutlined: true,),
      ],
    );
  }
}
