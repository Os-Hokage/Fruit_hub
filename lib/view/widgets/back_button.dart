// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../controller/size_config.dart';
import '../../controller/styles.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    Key? key,
    required this.cta
  }) : super(key: key);

final Function cta;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cta as Function(),
      child: Container(
        height: getProportionateScreenHeight(32),
        width: getProportionateScreenWidth(80),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: kPrimaryColor,
            )),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 22,),
            Text(
              "Go back",
              style: kTextSizeStyle16.copyWith(
                  color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}