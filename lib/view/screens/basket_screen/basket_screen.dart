// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruit_hub/view/widgets/checkout_card.dart';
import 'package:fruit_hub/view/widgets/custom_app_bar.dart';

import '../home_screen/home_screen.dart';
import 'components/body.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({Key? key}) : super(key: key);


  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(context, text: "My Basket", cta: (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
          return HomeScreen();
        }), (route) => false);
      }),
      body: Body(),
      bottomNavigationBar: CheckOutCard(),
    );
  }
}
