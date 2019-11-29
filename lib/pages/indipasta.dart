import 'package:flutter/material.dart';
import 'package:shop_ui/constant.dart';
import 'package:shop_ui/pages/checkout.dart';
import 'package:shop_ui/services/cart.dart';
import 'package:shop_ui/services/cartList.dart' as cartList;


class IndiPasta extends StatefulWidget {
  static String id = 'jfgdfgh';
  IndiPasta(
      {this.tag,
      this.image,
      this.name,
      this.weight,
      this.price,
      this.description});
  final String tag;
  final String image;
  final String name;
  final String weight;
  final double price;
  final String description;
  @override
  _IndiPastaState createState() => _IndiPastaState();
}

class _IndiPastaState extends State<IndiPasta>
    with SingleTickerProviderStateMixin {
  int cartSize = 1;
  double initPrice;
  double price;

  @override
  void initState() {
    setState(() {
      initPrice = widget.price;
      price = initPrice;
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 19,
                      ),
                    )
                  ],
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.35,
                  ),
                  child: Hero(
                      tag: widget.tag,
                      child: Center(child: Image.asset(widget.image))),
                ),
                Text(widget.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  height: 18,
                ),
                Text('${widget.weight}g',
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.black12, width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove),
                            iconSize: 19,
                            onPressed: () {
                              setState(() {
                                if (cartSize > 1) {
                                  cartSize--;
                                  price = price - initPrice;
                                }
                              });
                            },
                          ),
                          Container(
                              height: 30,
                              child: Center(
                                  child: Text(
                                '$cartSize',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ))),
                          IconButton(
                            icon: Icon(Icons.add),
                            iconSize: 19,
                            onPressed: () {
                              setState(() {
                                cartSize++;
                                price = price + initPrice;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  widget.description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
          )
        ]),
        padding: EdgeInsets.only(top: 8, bottom: 8, right: 18, left: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 40.0),
                child:
                    /* CircleAvatar(
                radius: 25,
                child: Icon(
                    Icons.favorite_border, size: 30),
                ), */
                    AnimatedContainer(
                  height: 50,
                  width: 50,
                  duration: kThemeChangeDuration,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black12, width: 1)),
                  child: Center(
                    child: MediaQuery(
                      data:
                          MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                      child: Icon(Icons.favorite_border, size: 23),
                    ),
                  ),
                )),
            GestureDetector(
              onTap: () {
                  cartList.addCard(Cart(
                      image: widget.image,
                      amount: price,
                      name: widget.name,
                      number: cartSize,
                      tag: widget.tag));
                  Navigator.pop(context, cartList.getCard());
                  print('object');
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40), color: Kmaincolor),
                child: Center(
                  child: Text(
                    'Add to cart',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
