import 'package:flutter/material.dart';
import 'package:odoo_bug_busters/book_front.dart';
import 'package:odoo_bug_busters/home_page.dart';
import 'package:odoo_bug_busters/input_user_details.dart';
import 'package:odoo_bug_busters/profileperson.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library Management System',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: BookLibraryApp(),
    );
  }
}

