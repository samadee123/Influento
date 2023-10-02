import 'package:assignment/features/authentication/screens/Home_Screen.dart';
import 'package:assignment/features/authentication/screens/chat.dart';
import 'package:assignment/features/authentication/screens/contact-us.dart';
import 'package:assignment/features/authentication/screens/favourites.dart';
import 'package:assignment/features/authentication/screens/profile.dart';
import 'package:assignment/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class settings extends StatefulWidget {
  final ThemeNotifier themeNotifier;
  const settings({Key? key, required this.themeNotifier}) : super(key: key);
  
  @override
  State<settings> createState() => _settingsState();
  }

  class _settingsState extends State<settings> {
    int _selectedIndex = 3;

  final List<Color> _bgColors = [
    HexColor("#E0ADFF"),
    HexColor("#BD6DFB"),
    HexColor("#9E54CA"),
    HexColor("#722E9A"),
  ];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool switchValue = false;
  final ThemeNotifier _themeNotifier = ThemeNotifier(ThemeMode.light);
  ThemeNotifier get themeNotifier => _themeNotifier;
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        print('Current theme mode: $themeMode');
        Color topic = Theme.of(context).brightness == Brightness.dark ? HexColor("#FFFFFF") : HexColor("#4D4B4B");
        Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#333333") : Colors.white;

      return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
            padding: const EdgeInsets.only(
              top: 180.0,
              left: 30.0,),
            child: Center(
              child: Text(
              "Settings",
              style: TextStyle(
                fontSize: 35.0,
                color: topic,
              ),
            ),
            ),
          ),
          const SizedBox(
                  height: 50.0,
          ),
          Padding(
  padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => profile()),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        color: Colors.grey.withOpacity(0.2), 
        child: ListTile(
          leading: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(CupertinoIcons.person_crop_circle),
          ),
          title: Text(
            "My Profile",
            style: TextStyle(
              color: topic,
            ),
          ),
          trailing: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(CupertinoIcons.chevron_forward),
          ),
        ),
      ),
    ),
  ),
),

            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => contactus()),
    );
  },
  child: Padding(
    padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: ListTile(
          leading: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              // color: HexColor("#808080").withOpacity(0.1),
            ),
            child: const Icon(CupertinoIcons.envelope),
          ),
          title: Text(
            "Contact Us",
            style: TextStyle(
              color: topic,
            ),
          ),
          trailing: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              // color: Colors.grey.withOpacity(0.1),
            ),
            child: const Icon(CupertinoIcons.chevron_forward),
          ),
        ),
      ),
    ),
  ),
),
           Padding(
  padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(25.0),
    child: Container(
      color: Colors.grey.withOpacity(0.2),
      child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Icon(CupertinoIcons.lightbulb),
        ),
        title: Text(
          "Appearance",
          style: TextStyle(
            color: topic,
          ),
        ),
        trailing: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Switch(
      value: switchValue,
      onChanged: (newValue) {
  print('Switch value changed: $newValue');
  setState(() {
    switchValue = newValue;
    themeNotifier.toggleTheme();
  });
},
    ),
  ],
),

      ),
    ),
  ),
),


            Padding(
  padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15,),
  child: GestureDetector(
    onTap: () {
      AuthenticationRepository.instance.logout();
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        color: Colors.grey.withOpacity(0.2),
        child: ListTile(
          leading: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(CupertinoIcons.escape),
          ),
          title: Text(
            "Logout",
            style: TextStyle(
              color: topic,
            ),
          ),
        ),
      ),
    ),
  ),
),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color:  navbar,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => favPage()),
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
                icon: Icons.favorite_outline,
                text: 'Settings',
                iconColor: HexColor("#722E9A"),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
      },
    );
    

    
  }
  }

  class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier(ThemeMode value) : super(value);

  void toggleTheme() {
  print('Toggling theme from: $value');
  value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  print('Toggled theme to: $value');
}
}