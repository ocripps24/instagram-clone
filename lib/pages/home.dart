import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            children: getPosts(),
          )
        ],
      ),
    );
  }

  List<Widget> getPosts() {
    List<Widget> posts = []; 
    for (Post post in userPosts) {
      posts.add(getPost(post));
    }
    return posts;
  }
  
  Widget getPost(Post post) {
    return Container(
      child: Text("Hello"),
    );
  }
} 