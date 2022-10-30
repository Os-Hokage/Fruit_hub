// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/styles.dart';

import 'package:fruit_hub/view/widgets/app_button.dart';
import 'package:fruit_hub/view/widgets/text_field.dart';

import '../../controller/size_config.dart';
import '../screens/congratulations_screen/congratulations_screen.dart';


class PaymentBottomModal extends StatelessWidget {
  const PaymentBottomModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Wrap(
              crossAxisAlignment:WrapCrossAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        transform: Matrix4.translationValues(0.0, -90, 0.0),
                        child: FloatingActionButton(
                          onPressed: () {  },
                          child: Icon(Icons.close,
                            color: kPrimaryTextColor,
                          ),
                        )
                    ),
                  ],
                ),
                CustomTextField(title: "Card Holders Name ", hintText: "Adolphus Chris"),
                Container(height: getProportionateScreenHeight(24),),
                CustomTextField(title: "Card Number", hintText: "1234 5678 9012 1314"),
                Container(height: getProportionateScreenHeight(40),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(title: "Date", hintText: "10/30", width: 134,),
                    CustomTextField(title: "CCV", hintText: "123", width: 134,),
                  ],
                )
              ],
            ),
          ),
          AppButton(title: "Complete Order",isComplete: true, cta: (){
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return CongratulationScreen();
            }));
          }),
        ],
      ),
    );
  }
}

