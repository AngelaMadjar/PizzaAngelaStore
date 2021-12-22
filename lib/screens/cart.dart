import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:pizza_angela_store/consts/colors.dart';
import 'package:pizza_angela_store/consts/my_icons.dart';
import 'package:pizza_angela_store/widgets/cart_empty.dart';
import 'package:pizza_angela_store/widgets/cart_full.dart';

class CartScreen extends StatelessWidget {

  static const routeName = '/CartScreen';

  @override
  Widget build(BuildContext context) {
    //lista na produkti od korisnikot
    List products = [];
    //ako ovaa lista na produkti od korisnikot e prazna, togas
    //prikazi ja CartEmpty(), ako e polna togas CartFull()

    return !products.isEmpty? Scaffold(
      body:  CartEmpty() ,
    ): Scaffold(
      bottomSheet: checkoutSection(context),
        appBar: AppBar(
          title: Text('Cart Items Count'),
          actions: [
          IconButton(
          onPressed: (){},
          icon: Icon(MyAppIcons.trash),

          )


          ],
        ),

        body: Container(
          margin: EdgeInsets.only(bottom: 60),
          child: ListView.builder(itemBuilder: (BuildContext ctx, int index){
            return CartFull();
          }),
        )


    );
  }


  Widget checkoutSection(BuildContext ctx){
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey,width: 0.5),),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(

          children: [
          Expanded(
            flex:2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [
                ColorsConsts.gradientLStart,
                ColorsConsts.gradientLEnd,
              ],
                  stops: [0.0,0.7]),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){},
                  borderRadius: BorderRadius.circular(30),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Checkout',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(ctx).textSelectionColor,
                          fontWeight:FontWeight.w600,
                          fontSize: 18),
                    ),

                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Text(
            'Total',
            //textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(ctx).textSelectionColor,
                fontWeight:FontWeight.w600,
                fontSize: 18),
          ),
          Text(
            'USD \$179.0',
            //textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                fontWeight:FontWeight.w500,
                fontSize: 18),
          ),
        ],),
      )
    );
  }
}