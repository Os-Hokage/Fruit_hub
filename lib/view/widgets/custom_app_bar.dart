// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/size_config.dart';

import '../../controller/styles.dart';
import 'back_button.dart';


PreferredSize CustomAppbar(BuildContext context,{required String text, required Function cta}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: Container(
      color:kPrimaryColor,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
        child: Container(
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10,
          ),
          padding: EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomBackButton(cta: cta,),
              SizedBox(width: getProportionateScreenWidth(34),),
              Text(text,
                style: kTextSizeStyle24.copyWith(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}