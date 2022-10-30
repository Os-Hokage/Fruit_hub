// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/styles.dart';
import 'package:fruit_hub/view/screens/congratulations_screen/congratulations_screen.dart';
import 'package:fruit_hub/view/widgets/app_button.dart';
import 'package:fruit_hub/view/widgets/payment_card.dart';
import 'package:fruit_hub/view/widgets/text_field.dart';

import '../../controller/size_config.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 10),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text.rich(
                //   TextSpan(
                //     text: "Total:\n",
                //     children: [
                //       TextSpan(
                //         text: "\$337.15",
                //         style: TextStyle(fontSize: 16, color: Colors.black),
                //       ),
                //     ],
                //   ),
                // ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total",
                      style: kTextSizeBlackStyle16,
                    ),
                    Text("₦ 60,000",
                      style: kTextSizeStyle24,
                    )
                  ],
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: AppButton(title: "Checkout", cta: (){

                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                        context: context, builder: (context)
                    {
                      // return Scaffold(body: BottomModal(), floatingActionButton: Container(
                      //   transform: Matrix4.translationValues(0.0, -70, 0.0),  // translate up by 30
                      //   child: FloatingActionButton(
                      //     onPressed: () {
                      //       // do stuff
                      //       Navigator.pop(context);
                      //     },
                      //     child: Icon(Icons.close),
                      //   ),
                      // ),
                      //   // dock it to the center top (from which it is translated)
                      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
                      // );
                      // ,);
                     return BottomModal();
                    });

                  })
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class BottomModal extends StatelessWidget {
  const BottomModal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(426),
      child: Padding(
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
              CustomTextField(title: "Delivery address", hintText: "10th avenue, Lekki, Lagos State"),
              Container(height: getProportionateScreenHeight(24),),
              CustomTextField(title: "Number we can call", hintText: "09090605708"),
              Container(height: getProportionateScreenHeight(40),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(title: "Pay on delivery", cta: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_){
                      return CongratulationScreen();
                    }));
                  }, isOutlined: true, width: 125),
                  AppButton(title: "Pay with card", cta: (){
                    Navigator.pop(context);
                    showModalBottomSheet(
                      isDismissible: true,
                      isScrollControlled: true,
                        shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        context: context, builder: (context)
                    {
                      return PaymentBottomModal();
                    });
                  }, isOutlined: true, width: 125)
                ],
              )
        ],
        ),
      ),
    );
  }
}
