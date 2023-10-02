import 'package:assignment/features/authentication/screens/Home_Screen.dart';
import 'package:assignment/features/authentication/screens/chat.dart';
import 'package:assignment/features/authentication/screens/favourites/favourite_campaigns_screen.dart';
import 'package:assignment/features/authentication/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';

import 'favourites/accepted_campaigns_screen.dart';
import 'favourites/pending_campaign_screen.dart';

class favPage extends StatefulWidget {
  const favPage({Key? key}) : super(key: key);

  @override
  State<favPage> createState() => _favPageState();
}

class _favPageState extends State<favPage> {
    int _selectedIndex = 1;
  final List<Color> _bgColors = [
    HexColor("#E0ADFF"),
    HexColor("#BD6DFB"),
    HexColor("#9E54CA"),
    HexColor("#722E9A"),
  ];
  final List<Widget> _pages = [
    favPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#3B3B3B") : Colors.white;
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Orders"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 20,
      ),
      body: const DefaultTabController(
        length: 3,
        child: Column(
          children: [
            // Text(
            //   'Orders',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            TabBar(
              tabs: [
                Tab(text: 'Favorites'),
                Tab(text: 'Pending'),
                Tab(text: 'Accepted'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  favorite(),
                  PendingCampaigns(),
                  AcceptedCampaigns(),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        color: navbar,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            selectedIndex: _selectedIndex,
            iconSize: 30.0,
            gap: 8.0,
            textSize: 18.0,
            // backgroundColor: Colors.white,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
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
    ); 
  }
}