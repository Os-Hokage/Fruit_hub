// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/size_config.dart';
import 'package:fruit_hub/view/screens/home_screen/components/app_bar.dart';
import 'package:fruit_hub/view/screens/home_screen/components/body.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: HomeAppbar(context),
      body: Body()
    );
  }
}
