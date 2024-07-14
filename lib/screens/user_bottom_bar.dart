import 'package:finals_oddo/screens/user_books_screen.dart';
import 'package:finals_oddo/screens/user_home_screen.dart';
import 'package:finals_oddo/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';

class UserBottomBar extends StatefulWidget {
  const UserBottomBar({super.key});

  @override
  _UserBottomBarState createState() => _UserBottomBarState();
}

class _UserBottomBarState extends State<UserBottomBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    UserHomeScreen(),
    YourBooksScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Your Books',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}





