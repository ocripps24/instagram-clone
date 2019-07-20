import 'package:flutter/material.dart';
// import 'package:instagram_clone/models/comment.dart';
import 'package:instagram_clone/models/global.dart';
import 'package:instagram_clone/models/post.dart';
// import 'package:instagram_clone/models/user.dart';
// import 'package:instagram_clone/main.dart';

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
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CircleAvatar(backgroundImage: post.user.profilePicture,),
                    ),
                    Text(post.user.username,)
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {
                    
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
} 