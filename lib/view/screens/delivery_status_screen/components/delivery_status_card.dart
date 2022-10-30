import 'package:flutter/material.dart';

import '../../../../controller/size_config.dart';
import '../../../../controller/styles.dart';

class DeliveryStatusCard extends StatelessWidget {
  DeliveryStatusCard({
    Key? key,
    required this.cardTitle,
    required this.image,
    this.isDelivered = false,
    required this.rightIcon,
    required this.color,
  }) : super(key: key);

  final String cardTitle;
  final String image;
  final Widget? rightIcon;
  final Color color;
  bool isDelivered;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: getProportionateScreenHeight(64),
              width: getProportionateScreenWidth(65),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(image),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(16),
            ),
            isDelivered
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardTitle,
                  style: kTextSizeBlackStyle16,
                ),
                Text(
                  "Your delivery agent is coming",
                  style: kTextSizeBlackStyle16.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            )
                : Text(
              cardTitle,
              style: kTextSizeBlackStyle16,
            ),
          ],
        ),
        Container(child: rightIcon,)
      ],
    );
  }
}
