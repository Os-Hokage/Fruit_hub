// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../controller/size_config.dart';
import '../../../../controller/styles.dart';




class CustomSearchField extends StatelessWidget {

  CustomSearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: getProportionateScreenWidth(288),
          height: getProportionateScreenHeight(56),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kGreyColor,
          ),
          child: TextField(
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,
                ),
                hintText: "Search for fruit salad combos",
                hintStyle: kPlaceHolderTextStyle.copyWith(
                    fontSize: 14,
                    color: kGreyTextColor2,
                    fontWeight: FontWeight.w500
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24), vertical: getProportionateScreenHeight(17))
            ),

          ),
        ),
        SizedBox(width: getProportionateScreenWidth(16),),
        Image.asset("assets/icons/filter.png",
        height: getProportionateScreenHeight(17),
          width: getProportionateScreenWidth(26),
        ),
      ],
    );
  }
}