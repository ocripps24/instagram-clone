import 'package:flutter/material.dart';
// import 'package:instagram_clone/models/comment.dart';
import 'package:instagram_clone/models/global.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/models/user.dart';
// import 'package:instagram_clone/main.dart';
// import 'package:instagram_clone/models/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int page = 1;
  static Post the_post = post1;
  @override
  Widget build(BuildContext context) {
    Map<int, Widget> pageview = {
      1 : getMain(),
      2 : getLikes(the_post.likes),
      // 3 : getComments(the_post.comments)
    };
    return pageview[page];
  }

  Widget getMain() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram", style: textStyleBold),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 80,
                  child: getStories(),
                ),
                Divider(),
                Column(
                  children: getPosts(context),
                )
              ],
            )
          ],
        )
      ),
    );
  }

  Widget getStories() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: getUserStories()
    );
  }

  List<Widget> getUserStories() {
    List<Widget> stories = [];
    for (int i = 0; i < 5; i++) {
      for (User follower in user.following) {
        stories.add(getStory(follower));
      }
    }
    return stories; 
  }

  Widget getStory(User follower) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundColor: follower.hasStory ? Colors.red : Colors.grey,
                  ),
                ),
                Container(
                  height: 47,
                  width: 47,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  child: CircleAvatar(
                    backgroundImage: follower.profilePicture,
                  ),
                ),
                FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {

                  },
                )
              ],
            )
          ),
          Text(follower.username, style: textStyle)
        ],
      ),
    );
  }

  List<Widget> getPosts(BuildContext context) {
    List<Widget> posts = []; 
    int index = 0;
    for (Post post in userPosts) {
      posts.add(getPost(context, post, index));
      index++;
    }
    return posts;
  }
  
  Widget getPost(BuildContext context, Post post, int index) {
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
            constraints: BoxConstraints.expand(height: 1),
            color: Colors.grey,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 282
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
                          userPosts[index].isLiked = !post.isLiked; 
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
                      userPosts[index].isSaved = post.isSaved ? false : true;
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
              setState(() {
                the_post = post; 
                page = 2;
                build(context);
              });
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
              setState(() {
                // the_post = post;
                // page = 3;
                // build(context);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget getLikes(List<User> likes) {
    List<Widget> likers = [];
    for (User follower in likes) {
      likers.add(new Container(
        height: 45,
        padding: EdgeInsets.all(10),
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(follower.username, style: textStyleBold),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(3))
                ),
                child: FlatButton(
                  color: user.following.contains(follower) ? Colors.white : Colors.blue,
                  child: Text(user.following.contains(follower) ? "Following" : "Follow", style: TextStyle(fontWeight: FontWeight.bold, color: user.following.contains(follower) ? Colors.grey : Colors.white)),
                  onPressed: () {
                    setState(() {
                      if (user.following.contains(follower)) {
                        user.following.remove(follower);
                      } else {
                        user.following.add(follower);
                      }
                    });
                  },
                ),
              )
            ],
          ),
          onPressed: () {

          },
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Likes", style: textStyleBold),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            setState(() {
              page = 1;
              build(context);
            });
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: likers,
        ),
      ),
    );

  }
} 
