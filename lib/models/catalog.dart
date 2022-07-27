import 'package:flutter/material.dart';

class Catalogmodel {
  static final Items = [
    Item(
      id: 1,
      name: "iphone 12",
      desc: "Apple Iphone 12 generation",
      price: 120000,
      color: "#33505a",
      image:
          "https://cdn.pocket-lint.com/r/s/970x/assets/images/154302-phones-review-iphone-12-pro-review-product-shots-image3-wd487ybwpf.jpg",
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
