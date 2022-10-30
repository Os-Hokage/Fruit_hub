// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/styles.dart';

import '../../../model/fruits_model.dart';
import 'components/body.dart';


class FruitDetailsScreen extends StatefulWidget {
  const FruitDetailsScreen({Key? key,  required this.fruit}) : super(key: key);

  final Fruits fruit;

  @override
  State<FruitDetailsScreen> createState() => _FruitDetailsScreenState();
}

class _FruitDetailsScreenState extends State<FruitDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Body(fruit: widget.fruit,),
    );
  }
}
