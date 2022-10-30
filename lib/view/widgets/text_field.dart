// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../controller/size_config.dart';
import '../../controller/styles.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  Icon? icon;
  final String title;
  double? width;

  CustomTextField({
    Key? key,
    required this.title,
    required this.hintText,
    this.width,
    Icon? icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( title,
          style: kTextSizeStyle20,
        ),
        SizedBox(height: getProportionateScreenHeight(16)),
        Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kGreyColor,
          ),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: icon,
                hintText: hintText,
                hintStyle: kPlaceHolderTextStyle,
                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24), vertical: getProportionateScreenHeight(13))
            ),

          ),
        ),
      ],
    );
  }
}

