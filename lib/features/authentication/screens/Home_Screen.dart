import 'package:provider/provider.dart';
import 'package:assignment/Components/categorytiles.dart';
import 'package:assignment/features/authentication/models/category_model.dart';
import 'package:assignment/features/authentication/screens/category_Page.dart';
import 'package:assignment/features/authentication/screens/chat.dart';
import 'package:assignment/features/authentication/screens/favourites.dart';
import 'package:assignment/features/authentication/screens/settings_screen.dart';
import 'package:assignment/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'SignUp_Page.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Color> _bgColors = [
    HexColor("#E0ADFF"),
    HexColor("#BD6DFB"),
    HexColor("#9E54CA"),
    HexColor("#722E9A"),
  ];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;


  @override
  Widget build (BuildContext context) {
    Color TextColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : HexColor("#575353");
    Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#3B3B3B") : Colors.white;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(xOffset == 0 && yOffset == 0 ? 0 : 20),
              color: Theme.of(context).colorScheme.background,
            ),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 55.0,
                ),
                Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.0),
            child: Text(
              "Hi!",
              style: TextStyle(
                fontSize: 30.0,
                color: TextColor,
              ),
            )
          ),
          const SizedBox(
                  height: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.0),
            child: Text(
              "Discover suitable campaigns tailored to you.",
              style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, color:TextColor,),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? 50
                : 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37.0),
            child: Text(
              "Categories",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color:TextColor,),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
                  child: Consumer<CategoryModel>(
                    builder: (context, value, child) {
                      return GridView.builder(
                        itemCount: value.categories.length,
                        padding: const EdgeInsets.all(12.0),
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait
                          ? 2
                          : 3,
                          childAspectRatio: 4 / 5,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryPage(title: value.categories[index][1]),
                                ),
                              );
                            },
                            child: categoryTiles(
                              image: value.categories[index][0],
                              title: value.categories[index][1],
                              color: value.categories[index][2],

                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            
          ),
          
        ],
      ),
      bottomNavigationBar: Visibility(
        visible: xOffset == 0 && yOffset == 0,
        child: Container(
           color: navbar,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: GNav(
              selectedIndex: _selectedIndex,
              iconSize: 30.0,
              gap: 8.0,
              textSize: 18.0,
              // backgroundColor: Color.fromARGB(255, 199, 77, 77),
              tabBackgroundColor: _bgColors[_selectedIndex],
              activeColor: Colors.white,
              padding: EdgeInsets.all(16.0),
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  iconColor: HexColor("#E0ADFF"),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                GButton(
                  icon: Icons.favorite_outline,
                  text: 'Favorites',
                  iconColor: HexColor("#BD6DFB"),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const favPage()),
                    );
                  },
                ),
                GButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  text: 'Chat',
                  iconColor: HexColor("#9E54CA"),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => chatPage()),
                    );
                  },
                ),
                GButton(
                  icon: Icons.settings,
                  text: 'Settings',
                  iconColor: HexColor("#722E9A"),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 3;
                    });
                    var themeNotifier = ThemeNotifier(ThemeMode.light);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => settings(themeNotifier: themeNotifier,)),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}