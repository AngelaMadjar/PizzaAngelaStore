import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:pizza_angela_store/consts/colors.dart';
import 'package:pizza_angela_store/consts/my_icons.dart';
import 'package:pizza_angela_store/provider/dark_theme_provider.dart';
import 'package:pizza_angela_store/screens/cart.dart';
import 'package:pizza_angela_store/screens/wishlist.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import '../../services/global_methods.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  bool _value = false;
  ScrollController _scrollController = ScrollController();
  var top = 0.0;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _uid;
  String? _name;
  String? _email;
  String? _joinedAt;
  int? _phoneNumber;
  String? _userImageUrl;
  GlobalMethods _globalMethods = GlobalMethods();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
    getData();
  }

  //GET DATA ABOUT USER FROM DATABASE
  void getData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;

    //logs for checking if it works
    print('user.displayName ${user.displayName}');
    print('user.photoURL ${user.photoURL}');

    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();

    if (userDoc == null) {
      return;
    }

    setState(() {
      _name = userDoc.get('name');
      _email = user.email!;
      _joinedAt = userDoc.get('joinedAt');
      _phoneNumber = userDoc.get('phoneNumber');
      _userImageUrl = userDoc.get('imageUrl');
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            ColorsConsts.starterColor,
                            ColorsConsts.endColor,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top <= 110.0 ? 1.0 : 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(_userImageUrl != null
                                          ? _userImageUrl.toString()
                                          : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  _name != null ? _name.toString() : 'Guest',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: NetworkImage(_userImageUrl != null
                            ? _userImageUrl.toString()
                            : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle('User Bag')),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () => Navigator.of(context)
                              .pushNamed(WishlistScreen.routeName),
                          title: Text('Wishlist'),
                          trailing: Icon(Icons.chevron_right_rounded),
                          leading: Icon(MyAppIcons.wishlist),
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Theme.of(context).splashColor,
                        child: ListTile(
                          onTap: () => {
                            Navigator.of(context)
                                .pushNamed(CartScreen.routeName)
                          },
                          title: Text('Cart'),
                          trailing: Icon(Icons.chevron_right_rounded),
                          leading: Icon(MyAppIcons.cart),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: userTitle('User Information')),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    userListTile('Email',
                        _email != null ? _email.toString() : '', 0, context),
                    userListTile(
                        'Phone number',
                        _phoneNumber != null ? _phoneNumber.toString() : '',
                        1,
                        context),
                   // userListTile('Shipping address', '', 2, context),
                    userListTile(
                        'joined date',
                        _joinedAt != null ? _joinedAt.toString() : '',
                        3,
                        context),
                    userListTileLocation(
                        'Location', 'Click for current location', 5, context),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: userTitle('User settings'),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    ListTileSwitch(
                      value: themeChange.darkTheme,
                      leading: Icon(Ionicons.md_moon),
                      onChanged: (value) {
                        setState(() {
                          themeChange.darkTheme = value;
                        });
                      },
                      visualDensity: VisualDensity.comfortable,
                      switchType: SwitchType.cupertino,
                      switchActiveColor: Colors.indigo,
                      title: Text('Dark theme'),
                    ),
                    Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Theme.of(context).splashColor,
                          child: ListTile(
                            onTap: () {
                              // Navigator.canPop(context) ? Navigator.pop(context) : null;
                              _auth.signOut();
                            },
                            title: Text('Logout'),
                            leading: Icon(Icons.exit_to_app_rounded),
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
          _buildFab()
        ],
      ),
    );
  }

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded,
    Icons.location_pin,
  ];

  Widget userListTile(
      String title, String subtitles, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
            onTap: () {},
            title: Text(title),
            subtitle: Text(subtitles),
            leading: Icon(_userTileIcons[index])),
      ),
    );
  }



  //LOCATION
  Widget userListTileLocation(
      String title, String subtitles, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
            onTap: () async {
              bool serviceEnabled;
              LocationPermission permission;

              // Test if location services are enabled.
              serviceEnabled = await Geolocator.isLocationServiceEnabled();

              permission = await Geolocator.checkPermission();

              if (permission == LocationPermission.denied) {
                permission = await Geolocator.requestPermission();
                if (permission == LocationPermission.denied) {
                  return Future.error('Location permissions are denied');
                }
              }

              if (permission == LocationPermission.deniedForever) {
                // Permissions are denied forever, handle appropriately.
                return Future.error(
                    'Location permissions are permanently denied, we cannot request permissions.');
              }

              // GET PERMISSION FOR THE LOCATION
              var locationMessage = "";
              var position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high);

              var lastPosition = await Geolocator.getLastKnownPosition();
              print(lastPosition);

              setState(() {
                locationMessage = "${position.latitude}, ${position.longitude}";
              });


              //  SHOW THE DIALOG WHEN CLICKED
              showDialog(context: context, builder: (BuildContext ctx){
                return AlertDialog(
                  title: Row(
                    children:[
                      Padding(
                        padding: const EdgeInsets.only(right:  6.0),
                        child: Image.network(
                          //location picture PIN
                          'https://firebasestorage.googleapis.com/v0/b/pizzaangela-82e5c.appspot.com/o/productImages%2Flocation_pin.png?alt=media&token=bad65f36-b575-4030-9b15-665ed155a482',
                          height: 20,
                          width: 20,),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Location"),
                      ),
                    ],
                  ),
                  content: Text("Your location is: \n Longitude: ${position.longitude} \n Latitude: ${position.latitude}"),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('OK'))

                  ],
                );
              });
            },
            title: Text(title),
            subtitle: Text(subtitles),
            leading: Icon(_userTileIcons[index])),
      ),
    );
  }

  Widget userTitle(String title) {
    return Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23));
  }

  //build Floating Action Button (kamerceto)
  Widget _buildFab() {
    //starting fab position
    final double defaultTopMargin = 200.0 - 4.0;
    //pixels from top where scaling should start
    final double scaleStart = 160.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down

        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down

        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      right: 16.0,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: FloatingActionButton(
          backgroundColor: Colors.purple,
          heroTag: "btn1",
          onPressed: () {},
          child: Icon(Icons.camera_alt_outlined),
        ),
      ),
    );
  }
}
