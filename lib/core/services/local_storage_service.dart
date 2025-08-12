
import 'package:hive_flutter/hive_flutter.dart';

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



}
