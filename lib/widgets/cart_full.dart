import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:pizza_angela_store/consts/colors.dart';
import 'package:pizza_angela_store/inner_screens/product_details.dart';
import 'package:pizza_angela_store/models/cart_attr.dart';
import 'package:pizza_angela_store/provider/cart_provider.dart';
import 'package:pizza_angela_store/provider/dark_theme_provider.dart';
import 'package:pizza_angela_store/services/global_methods.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {

  //to access product details screen with this id
  final String productId;


  const CartFull({required this.productId});
  //ova e so dependency injection (preku konstruktor)
  /*final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  final String imageUrl;


  const CartFull({
      required this.id,
      required this.productId,
      required this.price,
      required this.quantity,
      required this.title,
      required this.imageUrl});*/


  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {

  //metod koj se povikuva pred da se izbrise item od cart kako predupreduvanje



  @override
  Widget build(BuildContext context) {

    GlobalMethods globalMethods = GlobalMethods();
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final cartAttr = Provider.of<CartAttr>(context);
    final cartProvider = Provider.of<CartProvider>(context);


    //subtotal za presmetka na vkupno
    double subTotal = cartAttr.price * cartAttr.quantity;
    


    
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
      arguments: widget.productId),

      child: Container(
        height: 145,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16.0),
              topRight: const Radius.circular(16.0)),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: [
            //ovaj e za slikata IMAGEURL
            Container(
              width: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    cartAttr.imageUrl),
                fit: BoxFit.fill,
              )),
            ),

            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            cartAttr.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            //splashColor: Colors.grey,
                            borderRadius: BorderRadius.circular(32.0),
                            onTap: () {
                              //cartProvider.removeItem(widget.productId);
                              globalMethods.showDialogg(
                                  'Remove product',
                                  'Product will be removed from the cart ',
                                   () => cartProvider.removeItem(widget.productId),context);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Entypo.cross,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //PRICE
                    Row(
                      children: [
                        Text('Price: '),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${cartAttr.price} \$',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    //SUBTOTAL
                    Row(
                      children: [
                        Text('Sub Total: '),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            '${subTotal.toStringAsFixed(2)} \$',
                            style: TextStyle(
                                //fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: themeChange.darkTheme
                                    ? Colors.brown.shade900
                                    : Theme.of(context).accentColor),
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text('Free shipping',
                            style: TextStyle(
                                color: themeChange.darkTheme
                                    ? Colors.brown.shade900
                                    : Theme.of(context).accentColor)
                        ),

                        Spacer(),

                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            //splashColor: Colors.grey,
                            borderRadius: BorderRadius.circular(4.0),
                            onTap: cartAttr.quantity<2 ? null : (){
                              cartProvider.reduceItemByOne(
                                  widget.productId,
                                  );
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.minus,
                                  color: cartAttr.quantity<2 ? Colors.grey : Colors.red,
                                  size: 20,),
                              ),
                            ),
                          ),
                        ),

                        //QUANTITY
                        Card(
                          elevation: 15,
                          child: Container(

                            width: MediaQuery.of(context).size.width*0.12,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(gradient: LinearGradient(colors: [
                              ColorsConsts.gradientLStart,
                              ColorsConsts.gradientLEnd,
                            ],
                            stops: [0.0,0.7]),
                            ),
                            child: Text(cartAttr.quantity.toString(),
                              textAlign: TextAlign.center,),
                          ),

                        ),

                        Material(
                          color: Colors.transparent,

                          child: InkWell(
                            //splashColor: Colors.grey,
                            borderRadius: BorderRadius.circular(4.0),
                            onTap: (){
                              cartProvider.addProductToCart(
                                  widget.productId,
                                  cartAttr.price,
                                  cartAttr.title,
                                  cartAttr.imageUrl);
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.plus,
                                  color: Colors.green,
                                  size: 20,),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
