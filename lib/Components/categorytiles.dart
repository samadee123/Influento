import 'package:assignment/features/authentication/models/campaign_model.dart';
import 'package:assignment/features/authentication/screens/category_Page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

// import '../model/categoary_model.dart';
// import '../pages/Item_page.dart';


class categoryTiles extends StatefulWidget{
  final String image;
  final String title;
  final color;
  
  const categoryTiles({
    super.key,
    required this.image,
    required this.title,
    required this.color,
    
    });


  @override
  State<categoryTiles> createState() => _categoryTilesState();
}

class _categoryTilesState extends State<categoryTiles> {
  CampaignModel campaignModel = CampaignModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    campaignModel.setCurrentCategory(widget.title);
    campaignModel.loadItems();
    setState(() {});
  }
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<CampaignModel>(context, listen: false)
            .setCurrentCategory(widget.title);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(title: widget.title),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: widget.color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}