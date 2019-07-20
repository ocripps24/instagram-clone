import 'package:flutter/material.dart';
import 'user.dart';
import 'post.dart';
import 'comment.dart';

Post post1 = new Post(new AssetImage('lib/assets/photo_1.jpeg'), user, "My first post", DateTime.now(), [follower1, follower2, follower3], [], false, false); 
final User user = new User('olivercripps', AssetImage('lib/assets/my_profile.jpg'), [
  follower1, 
  follower2, 
  follower3
], [
  follower1, 
  follower2, 
  follower3
], [], [], false);

User follower1 = new User('thierry_henry', AssetImage('lib/assets/thierr_henry.jpg'), [], [], [], [], true);
User follower2 = new User('em_rata', AssetImage('lib/assets/em_rata.jpg'), [], [], [], [], true);
User follower3 = new User('anthony_joshua', AssetImage('lib/assets/anthony_joshua.jpg'), [], [], [], [], false);

List<Post> userPosts = [
  new Post(new AssetImage('lib/assets/photo_1.jpg'), user, "My First Post", DateTime.now(), [follower1, follower2, follower3], [
    new Comment(follower1, "Lol", DateTime.now(), false),
    new Comment(follower2, "Amazing!", DateTime.now(), false)
  ], false, false),
  new Post(new AssetImage('lib/assets/photo_2.jpg'), user, "My first post", DateTime.now(), [follower1, follower2], [
    new Comment(follower3, "Nice!", DateTime.now(), false),
    new Comment(follower2, "Love it!", DateTime.now(), false),
    new Comment(user, "Thanks!", DateTime.now(), false)
  ], false, false)
];