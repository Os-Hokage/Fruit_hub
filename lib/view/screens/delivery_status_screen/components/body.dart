// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/controller/size_config.dart';
import 'package:fruit_hub/view/widgets/google_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../controller/styles.dart';
import 'delivery_status_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          DeliveryStatusCard(
            color: kCreamColor,
            cardTitle: "Order Taken",
            image: "assets/images/orderTaken.png",
            rightIcon: SvgPicture.asset('assets/icons/confirm.svg'),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: getProportionateScreenWidth(56 - 24)),
            child: Image.asset(
              "assets/images/5lines.png",
              height: getProportionateScreenHeight(48),
            ),
          ),
          DeliveryStatusCard(
            color: kPurpleColor,
            cardTitle: "Order Is Being Prepared",
            image: "assets/images/orderPrepared.png",
            rightIcon: SvgPicture.asset('assets/icons/confirm.svg'),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: getProportionateScreenWidth(56 - 24)),
            child: Image.asset(
              "assets/images/5lines.png",
              height: getProportionateScreenHeight(48),
            ),
          ),
          DeliveryStatusCard(
            color: kLightOrangeColor,
            cardTitle: "Order Is Being Delivered",
            image: "assets/images/orderDelivered.png",
            rightIcon: Image.asset("assets/icons/callIcon.png",
              height: getProportionateScreenHeight(40),
              width: getProportionateScreenWidth(40),
            ),
            isDelivered: true,
          ),
          Padding(
            padding:
            EdgeInsets.only(left: getProportionateScreenWidth(56 - 24)),
            child: Image.asset(
              "assets/images/3Lines.png",
              height: getProportionateScreenHeight(26),
            ),
          ),

          //TODO: Add Map
          DeliveryMap(),
          Padding(
            padding:
            EdgeInsets.only(left: getProportionateScreenWidth(56 - 24)),
            child: Image.asset(
              "assets/images/5lines.png",
              height: getProportionateScreenHeight(48),
            ),
          ),
          DeliveryStatusCard(
            color: kMintColor,
            cardTitle: "Order Received",
            image: "assets/images/confirm2.png",
            rightIcon: SvgPicture.asset('assets/icons/confirm.svg'),
          ),
        ],
      ),
    );
  }
}

