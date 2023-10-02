import 'package:assignment/features/authentication/models/favorite_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';



class CampaignTiles extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  const CampaignTiles({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);
  @override
  _CampaignTilesState createState() => _CampaignTilesState();
}
class _CampaignTilesState extends State<CampaignTiles> {
  bool isFavorite = false;
  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
@override
Widget build(BuildContext context) {
  Color topic = Theme.of(context).brightness == Brightness.dark ? HexColor("#FFFFFF") : HexColor("#4D4B4B");
  var favouriteModel = Provider.of<FavouriteModel>(context, listen: false);
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: HexColor("#848484"),
          width: 1.0,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        widget.title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: topic,
        ),
      ),
      Spacer(),
      Align(
        alignment: Alignment.bottomRight,
        child: Text(
          widget.price,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: topic,
          ),
        ),
      ),
    ],
  ),
),

              ),
            ],
          ),
          Positioned(
  top: -5.0,
  left: -3.0,
  child: Container(
    width: 35.0,
    height: 35.0,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.7),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(75.0),
      ),
    ),
    child: IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? const Color(0xFF710005) :  const Color(0xFF710005),
      ),
      onPressed: (){
        toggleFavorite();
        if(isFavorite){
          favouriteModel.addFavouritesItems(name: widget.title, image: widget.image, price: widget.price);
          setState(() {});
        }
      },
    ),
  ),
),
        ],
      ),
    ),
  );
}


}