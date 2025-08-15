
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task/feature/home/domain/entities/user_entity.dart';

class LocalStorageService{
  Box? _settingBox;
  LocalStorageService._internal();
  static final LocalStorageService _instance= LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  Future<void> openBox()async{
    if(!Hive.isBoxOpen("setting")){
      _settingBox= await Hive.openBox("mainBox");
    }
  }

  Future<void> writeSettingBox(String key,dynamic value)async{
    await _settingBox!.put(key, value);
  }

  T? readSettingBox<T>(String key){
    return _settingBox!.get(key);
  }

  Future<void> setLoginStatus(bool status)async{
    await _settingBox!.put('loginStatus', status);
  }

  bool? getLoginStatus(){
    return _settingBox!.get('loginStatus',defaultValue: false);
  }

  Future<void> setTheme(String theme)async{
    await _settingBox!.put('theme', theme);
  }

  String? getTheme(){
    return _settingBox!.get('theme'?? ThemeMode.system.toString());
  }

  Future<void> setLang(String lang)async{
    await _settingBox!.put("lang", lang);
  }

  String? getLang(){
    return _settingBox!.get('lang',defaultValue: 'en');
  }

  Future<void> addUsers(List<UserEntity> users)async{
    await _settingBox!.put('users', users);
  }

  List<UserEntity>? getUsers(){
    return _settingBox!.get('users',defaultValue: []);
  }

  Future<void> addUser(UserEntity user)async{
    await _settingBox!.put('user', user);
  }

  UserEntity? getUser(){
    return _settingBox!.get('user');
  }



}
