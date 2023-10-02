import 'package:flutter/material.dart';
import 'package:assignment/constants/image_string.dart';
import 'package:hexcolor/hexcolor.dart';
import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor =
      Theme.of(context).brightness == Brightness.dark ? Colors.white : HexColor("#565555");
    Color navbar =
      Theme.of(context).brightness == Brightness.dark ? HexColor("#3B3B3B") : Colors.white;
    final Brightness brightness = Theme.of(context).brightness;

    String sentence = 'Brands want YOU and now it is easier than ever to find the right brand match.';
    int breakIndex = 24;
    int breakIndex1 = 55;
    String firstPart = sentence.substring(0, breakIndex);
    String secondPart = sentence.substring(breakIndex, breakIndex1);
    String thirdPart = sentence.substring(breakIndex1);

    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image(
                    image: AssetImage(SplashImage),
                    width: 500.0,
                    height: 404.11,
                  ),
                ),

                //text
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      Text(
                        firstPart,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: _getResponsiveFontSize(context, 23.0),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: textColor,
                        ),
                      ),
                      Text(
                        secondPart,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:  _getResponsiveFontSize(context, 23.0),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: textColor,
                        ),
                      ),
                      Text(
                        thirdPart,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:  _getResponsiveFontSize(context, 23.0),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                          color: textColor,
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: 40.0, // Customize the height value as needed
                ),

                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }),
                  ),
                  child: Container(
                    width: _getResponsiveWidth(context, 250.0),
                    height: _getResponsiveHeight(context, 70.0),
                    decoration: BoxDecoration(
                      color: HexColor("9E54CA"),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      "Get Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: _getResponsiveFontSize(context, 24.0),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        color: HexColor("#FFFFFF"),
                      ),
                    ),
                  )
                )
              ]
            );
          } else {
            // Handle the case when orientation is not portrait
            return Center(
              child: Text('Landscape orientation is not supported yet.'),
            );
          }
        }
      ),
    );
  }
}

// Helper function to calculate responsive font size
  double _getResponsiveFontSize(BuildContext context, fontSize) {
    final screenWidth = MediaQuery.of(context).size.width;
    return fontSize * screenWidth / 414.0; // Adjust the base screen width as needed
  }

  // Helper function to calculate responsive width
  double _getResponsiveWidth(BuildContext context, double width) {
    final screenWidth = MediaQuery.of(context).size.width;
    return width * screenWidth / 414.0; // Adjust the base screen width as needed
  }

  // Helper function to calculate responsive height
  double _getResponsiveHeight(BuildContext context, double height) {
    final screenHeight = MediaQuery.of(context).size.height;
    return height * screenHeight / 896.0; // Adjust the base screen height as needed
  }