import 'package:flutter/cupertino.dart';
import 'package:mvvm_1/scr/users_list/models/user_error.dart';
import 'package:mvvm_1/scr/users_list/models/user_model.dart';
import 'package:mvvm_1/scr/users_list/repo/api_status.dart';
import 'package:mvvm_1/scr/users_list/repo/user_service.dart';

class UserViewModel extends ChangeNotifier {
  //variable declearation
  bool _loading = false;
  List<UserModel> _userListModel = [];
  UserError? _userError;
  UserModel? _selectedUser;
UserModel _addUser = UserModel();
//using getter to get those variable out of the class
  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError? get userError => _userError;
  UserModel? get selectedUser => _selectedUser;
  UserModel? get addUser => _addUser;

  UserViewModel() {
    getUsers();
  }

  //method to set data into these variables
  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) async {
    _userListModel = userListModel;
  }

  setSelectedUser(UserModel selectedUser) {
    _selectedUser = selectedUser;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  addUserFunc()async{
    if(!isValid()){
      return;
    }
    _userListModel.add(addUser!);
    _addUser =UserModel();
    notifyListeners();
    return true;
  }

  isValid(){
    if(addUser?.name == null  || addUser?.name == ""){
      return false;
    }
    if(addUser?.email == null  || addUser?.email == ""){
      return false;
    }
    return true;
  }


  getUsers() async {
    setLoading(true);
    var response = await UserService.getUsers();
    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );

      setUserError(userError);
    }

    setLoading(false);
  }
}
