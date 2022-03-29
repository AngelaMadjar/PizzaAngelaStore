import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pizza_angela_store/consts/colors.dart';
import 'package:pizza_angela_store/consts/my_icons.dart';
import 'package:pizza_angela_store/models/product.dart';
import 'package:pizza_angela_store/provider/cart_provider.dart';
import 'package:pizza_angela_store/provider/favs_provider.dart';
import 'package:pizza_angela_store/provider/products.dart';
import 'package:pizza_angela_store/screens/wishlist.dart';
import 'package:pizza_angela_store/widgets/feeds_products.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class FeedScreen extends StatelessWidget {

  static const routeName = '/FeedScreen';
  


  @override
  Widget build(BuildContext context) {
    final popular = ModalRoute.of(context)!.settings.arguments as String;

    final productsProvider = Provider.of<Products>(context);
    List<Product> productsList = productsProvider.products;

    if(popular == 'popular'){
      productsList = productsProvider.popularProducts;
    }

    return Scaffold( // we use Scaffold because we want to return a screen
      appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: Text('Feeds', style: TextStyle(color: Colors.black),),
          actions: [
            Consumer<FavsProvider>(
              builder: (_, favs, ch) => Badge(
                badgeColor: ColorsConsts.cartBadgeColor,
                animationType: BadgeAnimationType.slide,
                toAnimate: true,
                position: BadgePosition.topEnd(top:5, end:7),
                badgeContent: Text(favs.getFavsItems.length.toString(),
                  style: TextStyle(color: Colors.white),),
                child: IconButton(
                  icon: Icon(
                    MyAppIcons.wishlist,
                    color: ColorsConsts.favColor,
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(WishlistScreen.routeName);
                  },
                ),
              ),
            ),
            Consumer<CartProvider>(
              builder: (_, cart, ch) => Badge(
                badgeColor: ColorsConsts.cartBadgeColor,
                animationType: BadgeAnimationType.slide,
                toAnimate: true,
                position: BadgePosition.topEnd(top:5, end:7),
                badgeContent: Text(cart.getCartItems.length.toString(),
                  style: TextStyle(color: Colors.white),),
                child: IconButton(
                  icon: Icon(
                    MyAppIcons.cart,
                    color: ColorsConsts.cartColor,
                  ),
                  onPressed: (){
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
              ),
            ),
          ],),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 240/420 ,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate (productsList.length, (index){
        return ChangeNotifierProvider.value(
          value: productsList[index],
            child: FeedProducts(),
        );
          }
      ),
      )
    );
  }
}