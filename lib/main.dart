import 'package:flutter/material.dart';
import 'pages/create_post.dart';
import 'pages/home.dart';
import 'pages/notifications.dart';
import 'pages/profile.dart';
import 'pages/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    CreatePostPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Instagram'),
        ),
        body: TabBarView(
          children: pages,
        ),
      ),
    );
  }
}