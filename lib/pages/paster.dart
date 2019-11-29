import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_ui/pages/indipasta.dart';
import 'package:shop_ui/services/cartList.dart' as cartList;
import 'package:shop_ui/services/pasta.dart';
import 'package:shop_ui/services/pastaList.dart';
import 'package:shop_ui/widget/item.dart';

import '../constant.dart';

class Paster extends StatefulWidget {
  static String id = 'hhhhh';
  @override
  _PasterState createState() => _PasterState();
}

class _PasterState extends State<Paster> {
  List<Pasta> pastaList = PastaList().pastaList;
  List<Widget> pastaCart = [];
  List<dynamic> popedImage = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('cart');
    print(cartList.getCard());

    setState(() {
      pastaCart.clear();
    });
    popedImage.forEach((f) {
      pastaCart.add(
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(f.image),
          ),
        ),
      );
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(236, 234, 222, 1),
        leading: Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
        title: Text(
          'Pasta & Noodles',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.menu, color: Colors.black, size: 18),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.black),
          child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(236, 234, 222, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35))),
              child:
                  /* GridView.builder(
                        padding: EdgeInsets.all(35),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.55,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Item();
                        },
                      ) */
                  StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: pastaList.length,
                padding: EdgeInsets.all(35),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () async {
                      var output = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return IndiPasta(
                          tag: pastaList[index].tag,
                          image: pastaList[index].image,
                          price: pastaList[index].price,
                          name: pastaList[index].name,
                          weight: pastaList[index].weight,
                          description: pastaList[index].description,
                        );
                      }));
                      setState(() {
                        if (output != null) {
                          popedImage = output;
                        }
                      });
                    },
                    child: Item(
                      tag: pastaList[index].tag,
                      image: pastaList[index].image,
                      price: pastaList[index].price.toStringAsFixed(2),
                      name: pastaList[index].name,
                      weight: pastaList[index].weight,
                    ),
                  );
                },
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
              )),
        ),
      ),
      bottomNavigationBar: Container(
        height: 107,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                Row(
                  children: pastaCart,
                )
              ],
            ),
            CircleAvatar(
              backgroundColor: Kmaincolor,
              child: Text(
                cartList.getCard().length.toString(),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* Container(
                  height: MediaQuery.of(context).size.height * 0.177,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage('images/A.jpg'),
                              ),
                            ],
                          )
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Kmaincolor,
                        child: Text(
                          '1',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  ),
                ), */
