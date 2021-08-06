import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stand_app/model/user.dart';

class UserPreferences {
  static  SharedPreferences _preferences;
  
  static const _keyUser = 'people';
  static const myUser = People (
    imagePath:'https://firebasestorage.googleapis.com/v0/b/standapp-7c328.appspot.com/o/event.jpg?alt=media&token=c411c433-34b0-4cae-9bb6-0831f273f3ed',
    name: 'Orchard Group',
    job: 'Penyelenggara',
    alamat: 'Batam Center',
    email: 'orchardgroup@gmail.com',
    nomor: '07781454',
    jenis: 'Kuliner',
  );

  static Future init() async =>
    _preferences = await SharedPreferences.getInstance();

  static Future setUser(People people) async {
    final json = jsonEncode(people.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static People getUser(){
    final json = _preferences.getString(_keyUser);

    return json == null ? myUser : People.fromJson(jsonDecode(json));
  }
}