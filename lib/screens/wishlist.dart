import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:pizza_angela_store/consts/colors.dart';
import 'package:pizza_angela_store/consts/my_icons.dart';
import 'package:pizza_angela_store/widgets/cart_empty.dart';
import 'package:pizza_angela_store/widgets/cart_full.dart';
import 'package:pizza_angela_store/widgets/wishlist_empty.dart';
import 'package:pizza_angela_store/widgets/wishlist_full.dart';

class WishlistScreen extends StatelessWidget {

  static const routeName = '/WishlistScreen';

  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isNotEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
      appBar: AppBar(
        title: Text('Wishlist ()'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext ctx, int index) {
          return WishlistFull();
        },
      ),
    );
  }

}