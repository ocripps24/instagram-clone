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
        crossAxisAlignment: CrossAxisAlignment.start,
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
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 285
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: post.image
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                      Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.favorite, size: 30, color: post.isLiked ? Colors.red : Colors.black,),
                      IconButton(icon: Icon(Icons.favorite), color: post.isLiked ? Colors.red : Colors.white,
                      onPressed: () {
                        setState(() {
                          userPosts[0].isLiked = !post.isLiked; 
                          if (!post.isLiked) {
                            post.likes.remove(user);
                          } else {
                            post.likes.add(user);
                          }
                        });
                        print(post.likes.length);
                      },)
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.mode_comment, size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.mode_comment), color: Colors.white,
                      onPressed: () {
                        
                      },)
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(Icons.send, size: 30, color: Colors.black,),
                      IconButton(icon: Icon(Icons.send), color: Colors.white,
                      onPressed: () {
                        
                      },)
                    ],
                  ),
                ],
              ),
              Stack(
                alignment: Alignment(0, 0),
                children: <Widget>[
                  Icon(Icons.bookmark, size: 30, color: Colors.black,),
                  IconButton(icon: Icon(Icons.bookmark), color: post.isSaved ? Colors.black : Colors.white,
                  onPressed: () {
                    setState(() {
                      userPosts[0].isSaved = post.isSaved ? false : true;
                      if (!post.isSaved) {
                        user.savedPosts.remove(post);
                      } else {
                        user.savedPosts.add(post);
                      }
                    });
                  },)
                ],
              ),
            ],
          ),
          FlatButton(
            child: Text(post.likes.length.toString() + " likes", style: textStyleBold,),
            onPressed: () {

            },
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 10),
                child: Text(
                  post.user.username,
                  style: textStyleBold,
                ),
              ),
              Text(
                post.description,
                style: textStyle,
                )
            ],
          ),
          FlatButton(
            child: Text("View all " + post.comments.length.toString() + " comments", style: textStyleLightGrey,),
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }
} 