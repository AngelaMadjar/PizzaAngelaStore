import 'package:flutter/material.dart';
import 'package:pizza_angela_store/inner_screens/categories_feed.dart';
import 'package:pizza_angela_store/screens/feeds.dart';

/*
class CategoryWidget extends StatefulWidget {
//  const CategoryWidget({Key? key}) : super(key: key);
//ovde namerno index e staveno na index=1 za da funkcionirat sega duri ne e zavrsen delov
//hardcoded e ke se  smenit posle [PETAR]
  CategoryWidget({Key? key,   required this.index}) : super(key: key);

final int index;
*/



  class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}


class _CategoryWidgetState extends State<CategoryWidget> {

//mapa od image path i naslovot na kategorijata
List<Map<String,Object>> categories = [
  {
    'categoryName': 'Pizza',
    'categoryImagesPath': 'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fquatrofromaggi.jpg?alt=media&token=467b1c65-d01f-48e7-97ee-10fca3db516f',
  },
  {
    'categoryName': 'Pasta',
    'categoryImagesPath': 'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fpasta.jpg?alt=media&token=6a56c1fb-01e9-4f62-b000-f4bd8a063064',
  },
  {
    'categoryName': 'Pastrmajlija',
    'categoryImagesPath': 'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fpastrmajlija.jpg?alt=media&token=7c8f8434-2732-4c1d-b2bd-77fa17ead479',
  },
  {
    'categoryName': 'Specialities',
    'categoryImagesPath': 'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fpileskososos.jpg?alt=media&token=c828b036-863c-4977-97a9-e7e10c19ae9c',
  },
  {
    'categoryName': 'Desserts',
    'categoryImagesPath': 'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Fblagapizza.jpg?alt=media&token=ce1b9f28-158b-4f56-ad87-67f3ebad3910',
  },
];



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            //koga ke se stegnit nekoja kategorija da navigirat kon
            //soodvetniot FeedScreen (na primer: FeedScreen za Pizza, FeedScreen za Pasta, itn itn)

            //**VAZNO**
            //kako gi zemame produktite od soodvetnata kategorija?
            //taka sto vo funkcijava podolu pustame arguments
            //od home.dart moze da vidime deka vrakjame INDEX od CategoryWidget

            Navigator.of(context).pushNamed(CategoriesFeedScreen.routeName, arguments: '${categories[widget.index]['categoryName']}');
          },
          child: Container(
            child: Image.network(categories[widget.index]['categoryImagesPath']  as String, fit: BoxFit.cover,),

           /* decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              //vo videata go nemat ova as String na kraj ama mi davase error deka od Object ne mojt cast vo String
              //stack overflow: https://stackoverflow.com/questions/67853012/how-can-i-resolve-the-argument-type-object-cant-be-assigned-to-the-paramete
              image: DecorationImage(
                image: AssetImage(categories[widget.index]['categoryImagesPath'] as String),
                fit: BoxFit.cover,
              )
            ),*/
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,


          ),
        ),
        Positioned(
          bottom:0,
          left:10,
          right:10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            color: Theme.of(context).backgroundColor,
          //ERROROT E RESHEN !!
          child: Text(categories[widget.index]['categoryName'] as String,
                  style: TextStyle(fontWeight: FontWeight.w800,
          fontSize: 18, )
          )
          )
        ),
      ],
    );
  }


}
