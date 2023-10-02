import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class contactus extends StatefulWidget {
  const contactus({Key? key}) : super(key: key);
  
  @override
  State<contactus> createState() => _contactusState();

}

class _contactusState extends State<contactus> {
  @override
  Widget build(BuildContext context) { 
    Color topic = Theme.of(context).brightness == Brightness.dark ? HexColor("#FFFFFF") : HexColor("#4D4B4B");
    Color text = Theme.of(context).brightness == Brightness.dark ? HexColor("#848484") : HexColor("#4D4B4B");
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Contact-Us',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 10.0),
              child: Row(
                children: [
                ],
              ),
            ),
            isLandscape
                ? Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Container(
                            width: 295,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: HexColor("#848484"),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                // First Column with phone icon and number
                                Padding(
                                  padding: const EdgeInsets.only(left: 22.0, top: 20.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.phone,
                                        color: HexColor("#9E54CA"),
                                        size: 30,
                                      ),
                                      SizedBox(width: 16.0),
                                      Text(
                                        '0112896475',
                                        style: TextStyle(
                                          color: text,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                // Second Column with email icon and address
                                Padding(
                                  padding: const EdgeInsets.only(left: 22.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.email,
                                        color: HexColor("#9E54CA"),
                                        size: 30,
                                      ),
                                      SizedBox(width: 16.0),
                                      Text(
                                        'influen@gmail.com',
                                        style: TextStyle(
                                          color: text,
                                          fontSize: 16,
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
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 24.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                                child: Text(
                                  'Feedback-Complain Form',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("#4D4B4B"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 280.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: HexColor("#848484")),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(left: 10.0, top: -6.0),
                                          hintText: 'Name',
                                          hintStyle: TextStyle(
                                            fontSize: 15.0,
                                            color: HexColor("#848484"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      width: 280.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: HexColor("#848484")),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(left: 10.0, top: -6.0),
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                            fontSize: 15.0,
                                            color: HexColor("#848484"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      width: 280.0,
                                      height: 45.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: HexColor("#848484")),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(left: 10.0, top: -6.0),
                                          hintText: 'Event Occured on',
                                          hintStyle: TextStyle(
                                            fontSize: 15.0,
                                            color: HexColor("#848484"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    Container(
                                      width: 280.0,
                                      height: 141.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5.0),
                                        border: Border.all(color: HexColor("#848484")),
                                      ),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(left: 10.0, top: -6.0),
                                          hintText: 'Complain or Feedback',
                                          hintStyle: TextStyle(
                                            fontSize: 15.0,
                                            color: HexColor("#848484"),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20.0),
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text('Sent'),
                                              content: Text('Your feedback has been sent successfully'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    // Perform redeeming logic
                                                    Navigator.of(context).pop(); // Close the pop-up
                                                  },
                                                  child: Text(
                                                    'Ok',
                                                    style: TextStyle(
                                                      color: topic,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                                        width: 256.0,
                                        height: 40.0,
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: const Text(
                                          "Send",
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
                    ],
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          width: 295,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: HexColor("#848484"),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              // First Column with phone icon and number
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0, top: 20.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: HexColor("#9E54CA"),
                                      size: 30,
                                    ),
                                    SizedBox(width: 16.0),
                                    Text(
                                      '0112896475',
                                      style: TextStyle(
                                        color: text,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 16.0),
                              // Second Column with email icon and address
                              Padding(
                                padding: const EdgeInsets.only(left: 22.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: HexColor("#9E54CA"),
                                      size: 30,
                                    ),
                                    SizedBox(width: 16.0),
                                    Text(
                                      'influen@gmail.com',
                                      style: TextStyle(
                                        color: text,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 46.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 10.0),
                        child: Text(
                          'Feedback-Complain Form',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: topic,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 280.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: HexColor("#848484")),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 10.0, top: -6.0),
                                  hintText: 'Name',
                                  hintStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: HexColor("#848484"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              width: 280.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: HexColor("#848484")),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 10.0, top: -6.0),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: HexColor("#848484"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              width: 280.0,
                              height: 45.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: HexColor("#848484")),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 10.0, top: -6.0),
                                  hintText: 'Event Occured on',
                                  hintStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: HexColor("#848484"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              width: 280.0,
                              height: 141.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(color: HexColor("#848484")),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(left: 10.0, top: -6.0),
                                  hintText: 'Complain or Feedback',
                                  hintStyle: TextStyle(
                                    fontSize: 15.0,
                                    color: HexColor("#848484"),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Sent'),
                                      content: Text('Your feedback has been sent successfully'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            // Perform redeeming logic
                                            Navigator.of(context).pop(); // Close the pop-up
                                          },
                                          child: Text(
                                            'Ok',
                                            style: TextStyle(
                                              color: topic,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
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
                                width: 256.0,
                                height: 40.0,
                                padding: const EdgeInsets.only(top: 8.0),
                                child: const Text(
                                  "Send",
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
          ],
        ),
      ),
    );
  }
}
