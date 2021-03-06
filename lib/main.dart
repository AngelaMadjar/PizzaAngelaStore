import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizza_angela_store/inner_screens/categories_feed.dart';
import 'package:pizza_angela_store/inner_screens/product_details.dart';
import 'package:pizza_angela_store/provider/cart_provider.dart';
import 'package:pizza_angela_store/provider/dark_theme_provider.dart';
import 'package:pizza_angela_store/provider/favs_provider.dart';
import 'package:pizza_angela_store/provider/products.dart';
import 'package:pizza_angela_store/screens/auth/login.dart';
import 'package:pizza_angela_store/screens/auth/signup.dart';
import 'package:pizza_angela_store/screens/bottom_bar.dart';
import 'package:pizza_angela_store/consts/theme_data.dart';
import 'package:pizza_angela_store/screens/cart.dart';
import 'package:pizza_angela_store/screens/feeds.dart';
import 'package:pizza_angela_store/screens/landing_page.dart';
import 'package:pizza_angela_store/screens/main_screen.dart';
import 'package:pizza_angela_store/screens/user_state.dart';
import 'package:pizza_angela_store/screens/wishlist.dart';
import 'package:provider/provider.dart';

import 'screens/upload_product_form.dart';

/*void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  //const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async{
  themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreferences.getTheme();
  }
  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  //initializer for firebase
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
      future: _initialization,
      builder: (context, snapshot) {

        if(snapshot.connectionState == ConnectionState.waiting){
          return MaterialApp(
            home:Scaffold(
                body:Center(
                    child:CircularProgressIndicator()
            )
            )
          );
        }
        else if(snapshot.hasError){
          return MaterialApp(
              home:Scaffold(
                  body:Center(
                      child:Text('Error occured')
                  )
              )
          );
        }


        return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => Products(),),

              ChangeNotifierProvider(create: (_) {
                return themeChangeProvider;
              }),

              ChangeNotifierProvider(create: (_) => CartProvider(),),

              ChangeNotifierProvider(create: (_) => FavsProvider(),),

            ],
            child:
                Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
              return MaterialApp(
                title: 'Pizza Angela Struga',
                theme: Styles.themeData(themeChangeProvider.darkTheme, context),
                home: MainScreens(),
                //initialRoute: '/',
                routes: {
                  //   '/': (ctx) => LandingPage(),
                //  BrandNavigationRailScreen.routeName: (ctx) =>
                     // BrandNavigationRailScreen(),
                  CartScreen.routeName: (ctx) => CartScreen(),
                  FeedScreen.routeName: (ctx) => FeedScreen(),
                  WishlistScreen.routeName: (ctx) => WishlistScreen(),
                  ProductDetails.routeName: (ctx) => ProductDetails(),
                  CategoriesFeedScreen.routeName: (ctx) => CategoriesFeedScreen(),
                  LoginScreen.routeName: (ctx) => LoginScreen(),
                  SignUpScreen.routeName: (ctx) => SignUpScreen(),
                  BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
                  UploadProductForm.routeName: (ctx) => UploadProductForm(),

                },

              );
            }));
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/


void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCwVRRfnqNnQAVnwegpUV1rtiWY8I05ZN0",
      appId: "1:572296690822:android:8c38afa3f6ecaf2e21e507",
      messagingSenderId: "572296690822",
      projectId: "pizzaangela-82e5c",
    ),);

  @override
  Widget build(BuildContext context)  {
    return FutureBuilder(
        future:  _initialization,
        builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
           if (snapshot.hasError) {
            MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Error occured'),
                ),
              ),
            );
          }
          return MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) {
                  return themeChangeProvider;
                }),
                ChangeNotifierProvider(
                  create: (_) => Products(),
                ),
                ChangeNotifierProvider(
                  create: (_) => CartProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => FavsProvider(),
                ),
              ],
              child: Consumer<DarkThemeProvider>(
                  builder: (context, themeData, child) {
                    return MaterialApp(
                      title: 'Pizza Angela Struga',
                      theme: Styles.themeData(themeChangeProvider.darkTheme, context),
                      home: UserState(),
                     // initialRoute: '/',
                      routes: {
                        //   '/': (ctx) => LandingPage(),
                        //  BrandNavigationRailScreen.routeName: (ctx) =>
                        // BrandNavigationRailScreen(),
                        CartScreen.routeName: (ctx) => CartScreen(),
                        FeedScreen.routeName: (ctx) => FeedScreen(),
                        WishlistScreen.routeName: (ctx) => WishlistScreen(),
                        ProductDetails.routeName: (ctx) => ProductDetails(),
                        CategoriesFeedScreen.routeName: (ctx) => CategoriesFeedScreen(),
                        LoginScreen.routeName: (ctx) => LoginScreen(),
                        SignUpScreen.routeName: (ctx) => SignUpScreen(),
                        BottomBarScreen.routeName: (ctx) => BottomBarScreen(),
                        UploadProductForm.routeName: (ctx) => UploadProductForm(),
                      },
                    );
                  }));
        });
  }
}