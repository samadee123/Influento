import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);
  
  @override
  State<profile> createState() => _profileState();
}

  class _profileState extends State<profile> {
    int _selectedIndex = 3;

    // final ImagePicker _picker = ImagePicker();
    bool _is_profile_pic_from_camera = false;
    File? _image;

  final List<Color> _bgColors = [
    HexColor("#15CE1F"),
    HexColor("#13B662"),
    HexColor("#119DA4"),
    HexColor("#19647E"),
  ];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;


  Future<void> _takePhotoWithCamera() async {
    try {
      final XFile? image =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) {
        return;
      }

      final imageTemporary = File(image.path);

      setState(() {
        _image = imageTemporary;
        _is_profile_pic_from_camera = true;
      });
    } catch (e) {
      print(e);
    }
  }

  
  @override
  Widget build(BuildContext context) {
    Color topic = Theme.of(context).brightness == Brightness.dark ? HexColor("#FFFFFF") : HexColor("#4D4B4B");
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'My Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(
                  height: 45.0,
                ),
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'lib/images/profile.png',
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0, 
                      child: GestureDetector(
                        onTap: _takePhotoWithCamera,
                        child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: HexColor("#9E54CA")),
                        child: const Icon(
                          CupertinoIcons.camera,
                          color: Colors.white,
                          size: 23,
                        ),
                      ),
                      ),
                      
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                    width: 300.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color:HexColor("#848484")),
                    ),
                    child:TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                        hintText:'Name',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color:HexColor("#848484"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                  height: 20.0,
                ),
                Container(
                    width: 300.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color:HexColor("#848484")),
                    ),
                    child:TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                        hintText:'Contact No',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color:HexColor("#848484"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                  height: 20.0,
                ),
                Container(
                    width: 300.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color:HexColor("#848484")),
                    ),
                    child:TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                        hintText:'Address',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color:HexColor("#848484"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                  height: 20.0,
                ),
                Container(
                    width: 300.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color:HexColor("#848484")),
                    ),
                    child:TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                        hintText:'Date Of Birth',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color:HexColor("#848484"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                  height: 20.0,
                ),
                Container(
                    width: 300.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color:HexColor("#848484")),
                    ),
                    child:TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left:10.0,top:-6.0),
                        hintText:'Email Address',
                        hintStyle: TextStyle(
                          fontSize: 15.0,
                          color:HexColor("#848484"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                  height: 20.0,
                ),
                  Center(
              child: Column(
                children: [
                  
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Updated'),
                            content: Text('Your profile has been updated '),
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(HexColor("#9E54CA")),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Container(
                      width: 278.0,
                      height: 35.0,
                      padding: const EdgeInsets.only(top: 5.0),
                      child: const Text(
                        "Update",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}