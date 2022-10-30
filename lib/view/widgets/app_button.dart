// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../controller/size_config.dart';
import '../../controller/styles.dart';

class AppButton extends StatelessWidget {


   AppButton({
    Key? key,
     this.width,
    required this.title,
    required this.cta,
    this.isOutlined = false,
     this.isComplete = false,
     t
  }) : super(key: key);

  final String title;
  double? width;
  final Function cta;
  bool isOutlined = false;
  bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isComplete? getProportionateScreenHeight(96):getProportionateScreenHeight(56),
      width: width?? double.infinity,
      decoration: BoxDecoration(
          color: isOutlined ? Colors.white :kPrimaryColor,
          borderRadius:isComplete? BorderRadius.circular(24) :BorderRadius.circular(10),
          border: Border.all(
          color: kPrimaryColor,

      )
      ),
      child: TextButton(
        onPressed: cta as Function(),
        child: isComplete? Container(
          height: getProportionateScreenHeight(56),
          width: getProportionateScreenWidth(135),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Center(
            child: Text(
              title,
              style: kTextSizeStyle16.copyWith(
                color: kPrimaryColor,
                    fontWeight: FontWeight.bold
              ),
            ),
          ),
        ):Text( title,
          style: kTextSizeStyle16.copyWith(
              color: isOutlined? kPrimaryColor :Colors.white,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
