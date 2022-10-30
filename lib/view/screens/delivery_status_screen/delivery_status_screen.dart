// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruit_hub/view/screens/basket_screen/basket_screen.dart';
import 'package:fruit_hub/view/widgets/custom_app_bar.dart';

import '../delivery_status_screen/components/body.dart';


class DeliveryStatusScreen extends StatefulWidget {
  const DeliveryStatusScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryStatusScreen> createState() => _DeliveryStatusScreenState();
}

class _DeliveryStatusScreenState extends State<DeliveryStatusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, text: "Delivery Status", cta: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
          return BasketScreen();
        }), (route) => false);
      }),
      body: Body(),
    );
  }
}
