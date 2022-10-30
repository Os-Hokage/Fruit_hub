import 'package:flutter/material.dart';
import 'package:fruit_hub/controller/styles.dart';

class Fruits {
  final String name;
  final String price;
  final String image;
  final String contains;
  int pack;
  Color? color;
  bool isRec;
  bool isFav;
  bool inCart;

  Fruits({
    required this.contains,
    required this.name,
    required this.price,
    required this.image,
    required this.pack,
    this.color,
    this.isRec = false,
    required this.isFav,
    this.inCart = false,
  });
}

List<Fruits> fruits = [
  Fruits(
      name: "Honey Lime Combo",
      price: "2,000",
      image: "assets/images/honeyLimeCombo.png",
      isRec: true,
      pack: 1,
      isFav: false,
      contains:
          "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
    inCart: false,
  ),
  Fruits(
    name: "Berry Mango Combo",
    price: "8,000",
    image: "assets/images/berryMangoCombo.png",
    isRec: true,
    pack: 1,
    isFav: false,
    contains:
        "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
    inCart: false,
  ),
  Fruits(
    name: "Quinoa fruit salad",
    price: "10,000",
    image: "assets/images/quinoFruit.png",
    color: kCreamColor,
    pack: 1,
    isFav: false,
    inCart: false,
    contains:
        "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
  ),
  Fruits(
    name: "Tropical fruit salad",
    price: "10,000",
    image: "assets/images/tropicalFruit.png",
    color: kPinkColor,
    pack: 1,
    isFav: false,
    inCart: false,
    contains:
        "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
  ),
  Fruits(
    name: "Melon fruit salad",
    price: "10,000",
    image: "assets/images/melonFruit.png",
    color: kPurpleColor,
    pack: 1,
    isFav: false,
    inCart: false,
    contains:
        "Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.",
  ),
];
