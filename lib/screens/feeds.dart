import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pizza_angela_store/models/product.dart';
import 'package:pizza_angela_store/provider/products.dart';
import 'package:pizza_angela_store/widgets/feeds_products.dart';
import 'package:provider/provider.dart';

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
      body:
      GridView.count(
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