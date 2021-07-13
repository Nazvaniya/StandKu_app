import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stand_app/model/post.dart';

class PostPreferences {
  static  SharedPreferences _preferences;

  static const _keyPost = 'post';
  static const myPost = Post (
    imagePath:'https://i.ytimg.com/vi/cCUVGMgO0k0/maxresdefault.jpg',
    name: 'Samsudin',
    place: 'Bengkong',
    ket: "Orchard Night Out adalah bazar kuliner kreatif dimana menyajikan makanan terbaik dan kreatif baik dalam penjualan online maupun offline. Ada 20 stand lebih makanan yang dihadirkan dalam iven ini. ",
    jenis: 'Kuliner',
  );

  static Future init() async =>
    _preferences = await SharedPreferences.getInstance();

  static Future setPost(Post post) async {
    final json = jsonEncode(post.toJson());

    await _preferences.setString(_keyPost, json);
  }

  static Post getPost(){
    final json = _preferences.getString(_keyPost);

    return json == null ? myPost : Post.fromJson(jsonDecode(json));
  }
}