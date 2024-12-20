import 'package:firestore/auth/core/app_util.dart';
import 'package:firestore/user/model/user_model.dart';
import 'package:firestore/user/service/user_service.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier{

  UserProvider(this.userService);
  UserService userService;

  String? error;
  bool isLoading=false;

  Future addUser(User user)async{
    try{
    error = null;
    isLoading=true;
     notifyListeners();
    await UserService.addUser(user);
    AppUtil.showToast('User Added Successfully');
    isLoading=false;

  }catch(e){
      error = e.toString();
      AppUtil.showToast(error.toString());
    }
    notifyListeners();
}
}