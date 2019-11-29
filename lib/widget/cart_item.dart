import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  CartItem({this.image, this.name, this.amount, this.number, @required this.tag});
  final String image;
  final String name;
  final double amount;
  final int number;
  final String tag;
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    
                    tag: widget.tag,
                    child: AnimatedContainer(
                      height: 40,
                      width: 40,
                      duration: kThemeAnimationDuration,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(widget.image))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '${widget.number}',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'x',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Text(
                  '\$${widget.amount}',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 28,
          ),
        ],
      ),
    );
  }
}
