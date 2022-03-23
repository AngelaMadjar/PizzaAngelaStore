import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:pizza_angela_store/consts/colors.dart';
import 'package:pizza_angela_store/consts/my_icons.dart';
import 'package:pizza_angela_store/provider/cart_provider.dart';
import 'package:pizza_angela_store/provider/favs_provider.dart';
import 'package:pizza_angela_store/services/global_methods.dart';
import 'package:pizza_angela_store/widgets/cart_empty.dart';
import 'package:pizza_angela_store/widgets/cart_full.dart';
import 'package:pizza_angela_store/widgets/wishlist_empty.dart';
import 'package:pizza_angela_store/widgets/wishlist_full.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {

  static const routeName = '/WishlistScreen';

  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods = GlobalMethods();
    final favsProvider = Provider.of<FavsProvider>(context);

    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
      appBar: AppBar(
        title: Text('Wishlist (${favsProvider.getFavsItems.length})'),
        actions: [
          IconButton(
            onPressed: (){

              globalMethods.showDialogg(
                  'Clear wishlist',
                  'Your wishlist will be cleared',
                      () => favsProvider.clearFavs(),context);
            },
            icon: Icon(MyAppIcons.trash,color: Colors.black,),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: favsProvider.getFavsItems.length,
        itemBuilder: (BuildContext ctx, int index) {
          return ChangeNotifierProvider.value(
              value: favsProvider.getFavsItems.values.toList()[index],
              child: WishlistFull(
                productId: favsProvider.getFavsItems.keys.toList()[index],
              ));
        },
      ),
    );
  }

}