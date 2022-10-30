// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../../model/fruits_model.dart';
import '../../../widgets/cart_card.dart';


class Body extends StatefulWidget {
 const  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ...List.generate(fruits.length, (index) {
                    if (fruits[index].inCart) {
                      return CartCard(fruit: fruits[index]);
                    } else {
                      return SizedBox.shrink();
                    }
                  })
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
