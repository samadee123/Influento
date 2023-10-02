import 'package:assignment/features/authentication/screens/Home_Screen.dart';
import 'package:assignment/features/authentication/screens/favourites.dart';
import 'package:assignment/features/authentication/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';


class chatPage extends StatefulWidget {
  const chatPage({ Key? key }) : super(key: key);
  
  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
   int _selectedIndex = 2;
   final List<Color> _bgColors = [
    HexColor("#E0ADFF"),
    HexColor("#BD6DFB"),
    HexColor("#9E54CA"),
    HexColor("#722E9A"),
  ];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

    List <Message> messages = [
      Message(
        text: 'Hi!',
        date: DateTime.now().subtract(const Duration(days:12, minutes: 10)),
        isSentByMe: false,
      ),
      Message(
        text: 'Hello!',
        date: DateTime.now().subtract(const Duration(days:12, minutes: 20)),
        isSentByMe: true,
      ),
      Message(
        text: 'Yeah Sure :)',
        date: DateTime.now().subtract(const Duration(days:10, minutes: 5)),
        isSentByMe: false,
      ),
      Message(
        text: 'Can I know more details?',
        date: DateTime.now().subtract(const Duration(days:10, minutes: 10)),
        isSentByMe: true,
      ),
      Message(
        text: 'I will contact you soon.',
        date: DateTime.now().subtract(const Duration(days:8, minutes: 5)),
        isSentByMe: false,
      ),
      Message(
        text: 'Any update?',
        date: DateTime.now().subtract(const Duration(days:8, minutes: 10)),
        isSentByMe: true,
      ),
      Message(
        text: 'We will add soon.',
        date: DateTime.now().subtract(const Duration(days:3, minutes: 2)),
        isSentByMe: false,
      ),
      Message(
        text: 'Any new campaigns?',
        date: DateTime.now().subtract(const Duration(days:3, minutes: 4)),
        isSentByMe: true,
      ),
      Message(
        text: 'No worries',
        date: DateTime.now().subtract(const Duration(days:2, minutes: 10)),
        isSentByMe: false,
      ),
      Message(
        text: 'Thanks alot for the help. I will try it',
        date: DateTime.now().subtract(const Duration(days:2, minutes: 20)),
        isSentByMe: true,
      ),

    ].reversed.toList();

     @override
     Widget build(BuildContext context) {
      Color TextColor = Theme.of(context).brightness == Brightness.dark ? Colors.white : HexColor("#575353");
      Color navbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#3B3B3B") : Colors.white;
      Color chatbar = Theme.of(context).brightness == Brightness.dark ? HexColor("#3B3B3B") : Colors.grey.shade200;
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Chat',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: messages,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 50,
                  child: Center(
                    child: Card(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        DateFormat.yMMMd().format(message.date),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  ),
                  
                ),
                itemBuilder: (context, Message message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
                )
                
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: chatbar,
                borderRadius: BorderRadius.circular(20.0),
                
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(12),
                        hintText: 'Send a message...',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (text) {
                        final message = Message(
                          text: text,
                          date: DateTime.now(),
                          isSentByMe: true,
                        );

                        setState(() => messages.add(message));
                        
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                      onPressed: () {},
                  ),
                ],
              ), 
            ),
            const SizedBox(
                  height: 10.0,
          ),
          ],
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

class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}