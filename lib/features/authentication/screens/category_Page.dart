import 'package:assignment/Components/campaigntiles.dart';
import 'package:assignment/features/authentication/models/campaign_model.dart';
import 'package:assignment/features/authentication/screens/campaign_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';



class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  Future? _loadAllPrefs;
  int _selectedIndex=0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

    @override
  void initState() {
    var itemModel= Provider.of<CampaignModel>(context,listen: false);
     _loadAllPrefs = itemModel.loadItems();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
     Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#333333") : Colors.white;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            ),
            centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: HexColor("#9E54CA"), // Set the border color here
                    width: 1.0,
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    hintText: 'Search',
                    prefixIcon: null,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 30.0,
                      ),
                      onPressed: () {},
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
      Expanded(
        child: Consumer<CampaignModel>(
          builder: (context, value, child) {
            return GridView.builder(
              itemCount: value.items.length,
              padding: EdgeInsets.all(20.0),
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait
                          ? 2
                          : 4,
                childAspectRatio: 138/198,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => CampaignPage(
                        title: value.items[index][index]['title'],
                        image: value.items[index][index]['image'],
                        price: value.items[index][index]['price'],
                        description: value.items[index][index]['description'],
                       )));
                  },
                  child: CampaignTiles(
                  image: value.items[index][index]['image'],
                  title: value.items[index][index]['title'],
                  price: value.items[index][index]['price'],
                  // onCategorySelected: (String ) {  },
                ),
                );
                // var x = value.items[index][0];
                // print(x['image']);
                
              },
            );
          },
        ),
      ),
          ],
        ),
      ),
    );
  }
}