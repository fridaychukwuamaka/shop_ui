import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  Item({@required this.tag, this.image, this.name, this.weight, this.price});
  final String tag;
  final String image;
  final String name;
  final String weight;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Hero(tag: tag, child: Image.asset(image)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '\$$price',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '$name',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '${weight}g',
            style: TextStyle(
                fontSize: 15,
                color: Colors.black45,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
