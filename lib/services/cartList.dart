import 'package:shop_ui/services/cart.dart';

  List<Cart> _cardList = [
    /* Cart(
        image: 'images/B.jpg',
        amount: 23.57,
        name: 'Newman\'s own pasta sauce sockarooni',
        number: 1,
        tag: 'hinder') */
    /* CartItem(
      image: 'images/B.jpg',
      amount: 23.57,
      name: 'Newman\'s own pasta sauce sockarooni',
      number: 1,
      tag: 'hinder',
    ), */
  ];

  getCard() {
    return _cardList;
  }

  addCard(value) {
    _cardList.add(value);
    print(_cardList.length);
  }