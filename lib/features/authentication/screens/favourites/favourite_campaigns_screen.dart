import 'package:assignment/Components/campaigntiles.dart';
import 'package:assignment/features/authentication/models/favorite_provider.dart';
import 'package:assignment/features/authentication/screens/Home_Screen.dart';
import 'package:assignment/features/authentication/screens/chat.dart';
import 'package:assignment/features/authentication/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);
  
  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
    int _selectedIndex = 1;
  final List<Color> _bgColors = [
    HexColor("#15CE1F"),
    HexColor("#13B662"),
    HexColor("#119DA4"),
    HexColor("#19647E"),
  ];
  final List<Widget> _pages = [
    favorite(),
  ];
  @override
  Widget build(BuildContext context) {
      Color topic = Theme.of(context).brightness == Brightness.dark ? HexColor("#0EC42B") : HexColor("#4D4B4B");
        Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#333333") : Colors.white;
    return Scaffold(
      body: Column(
        children: [
          // Padding(
          //   padding:EdgeInsets.only(left:30,right:20.0,top:93.0,bottom:20.0),
          //   child: Text('Favorites',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color:topic)),
          // ), 
          Container(
            child: Expanded(
              child: Consumer<FavouriteModel>(
                builder: (context, value, child) {
                  return GridView.builder(
                    itemCount: value.favouriteList.length,
                    padding: EdgeInsets.all(20.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait
                          ? 2
                          : 4,
                      childAspectRatio: 138/198,
                    ),
                    itemBuilder: (context, index) {

                      var x = value.favouriteList[index];
                      return CampaignTiles(
                        image: x.image,
                        title: x.name,
                        price: x.price,
                        // onCategorySelected: (String ) {  },
                      );
                    },
                  );
                },
              ),
            ),
          )
 
        ],
        
      ),
    );
  }
}