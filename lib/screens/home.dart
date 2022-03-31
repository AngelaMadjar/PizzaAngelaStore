import 'package:backdrop/app_bar.dart';
import 'package:backdrop/button.dart';
import 'package:backdrop/scaffold.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pizza_angela_store/consts/colors.dart';
import 'package:pizza_angela_store/provider/products.dart';
import 'package:pizza_angela_store/screens/feeds.dart';
import 'package:pizza_angela_store/widgets/backlayer.dart';
import 'package:pizza_angela_store/widgets/category.dart';
import 'package:pizza_angela_store/widgets/popular_products.dart';
import 'package:provider/provider.dart';

//we use Scaffold because we want to return a screen
//petar go premesti komentarov gore

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _carouselImages = [
'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fcarousel1.jpg?alt=media&token=415ca065-081a-4c47-b773-7926bffb8a2f',
    'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fcarousel3.jpg?alt=media&token=8fa2ac3d-1ce8-458c-97ff-e5cb979a6b60',
    'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fcarousel2.jpg?alt=media&token=cd3250a4-9c41-488d-9a91-29f3d9b602fa',
  ];

  List _swiperImages = [
    'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fcezar.jpg?alt=media&token=5776bca5-575e-4a8c-8622-9c1803ae31f5',
    'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fbolognese.jpg?alt=media&token=98adc8b1-6e71-4ce1-b86a-7222f0a67249',
    'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Ffurnagiska.jpg?alt=media&token=cbb3f67a-4e2d-4e74-8e77-e5cbf5a35087',

  ];

/*  void fetchImages(String image) async{
    final ref = FirebaseStorage.instance.ref().child(image);
    // no need of the file extension, the name will do fine.
    var url = await ref.getDownloadURL();
    print(url);
    _swiperImages.add(url);
  }*/

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<Products>(context);
    productsData.FetchProducts();
    final popularItems = productsData.popularProducts;


    return Scaffold(
      body: Center(

        //BACKDROP SCAFFOLD
          child: BackdropScaffold(
           frontLayerBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            headerHeight: MediaQuery.of(context).size.height*0.25,
        appBar: BackdropAppBar(
          title: const Text("Home"),
          leading:  BackdropToggleButton(
            icon: AnimatedIcons.home_menu,
          ),

          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [ColorsConsts.starterColor,ColorsConsts.endColor])
            ),
          ),

          actions: <Widget>[

          IconButton(
          iconSize: 15,
          padding: const EdgeInsets.all(10),

          icon: CircleAvatar(radius: 15, backgroundColor: Colors.white,
              child: CircleAvatar(radius: 13, backgroundImage: NetworkImage('https://cdn1.vectorstock.com/i/thumb-large/62/60/default-avatar-photo-placeholder-profile-image-vector-21666260.jpg') ,),
          ),
            onPressed: () {  },
          )

          ],
        ),

        backLayer: BackLayerMenu(),




        frontLayer: SingleChildScrollView(
          child: Column(
            //ova go stavat naslovov levo (na start)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(

                  height: 190.0,
                  width: double.infinity,
                  child: Carousel(
                    boxFit: BoxFit.fill,
                    autoplay: true,
                    animationCurve: Curves.fastOutSlowIn,
                    animationDuration: Duration(milliseconds: 1000),
                    dotSize: 5.0,
                    dotIncreasedColor: Colors.purple,
                    dotBgColor: Colors.black.withOpacity(0.2),
                    dotPosition: DotPosition.bottomCenter,

                    showIndicator: true,
                    indicatorBgPadding: 5.0,
                    images: [

                     Image.network(_carouselImages[0],fit: BoxFit.fill,),
                      Image.network(_carouselImages[1],fit: BoxFit.fill),
                      Image.network(_carouselImages[2],fit: BoxFit.fill),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),


                   child: Text(
                      'Categories',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,fontSize: 20),
                    ),

              ),

              //CATEGORY WIDGET
              Container(
                width: double.infinity,
                height: 180,
                child: ListView.builder(itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index){
              return CategoryWidget(index: index);
              }),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  children: [
                    Text(
                      'Popular dishes',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,fontSize: 20),
                    ),
                    Spacer(),


                  ],
                ),
              ),
              Container(
                height:210,
                    width:MediaQuery.of(context).size.width*0.95,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Swiper(
                    itemCount: _swiperImages.length,
                    autoplay: true,
                    onTap: (index){ },
                    itemBuilder: (BuildContext ctx, int index ){
                      return ClipRRect(borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.blueGrey,
                          child: Image.network(_swiperImages[index],fit: BoxFit.fill)));
                    },
                  ),
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  children: [
                    Text(
                      'Popular products',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,fontSize: 20),
                    ),
                    Spacer(),
                    FlatButton(
                      onPressed: (){
                        Navigator.of(context).pushNamed(FeedScreen.routeName, arguments: 'popular' );
                      },
                      child: Text(
                        'View all...',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,fontSize: 15,color:Colors.red),
                      ),),

                  ],
                ),
              ),

              Container(
                width: double.infinity,
                height: 285,
                margin: EdgeInsets.symmetric(horizontal: 3),
                child: ListView.builder(
                  itemCount: popularItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext ctx, int index){
                    return ChangeNotifierProvider.value(
                      value: popularItems[index],
                      child: PopularProducts(
                        //ova zakomentiranovo e drug pristap preku KONSTRUKOR
                        //ova gore sho go odbrav so ChangeNotifierProvider e so DEPENDENCY INJECTION i mislam deka e podobro

                       /* imageUrl:popularItems[index].imageUrl,
                        title: popularItems[index].title,
                        description: popularItems[index].description,
                        price: popularItems[index].price,*/
                      ),
                    );
                    }),

              ),




            ],





          ),
        ),
      )
      ),
    );
  }
}
