import 'package:flutter/material.dart';
import 'package:mvvm_1/scr/users_list/models/user_model.dart';
import 'package:mvvm_1/scr/users_list/view_model/user_view_model.dart';
import 'package:mvvm_1/scr/utils/navigation_utils.dart';
import 'package:mvvm_1/scr/widget/app_error.dart';
import 'package:mvvm_1/scr/widget/app_loading.dart';
import 'package:mvvm_1/scr/widget/app_title.dart';
import 'package:mvvm_1/scr/widget/user_list_row.dart';
import 'package:provider/provider.dart';
// import 'package:mvvm_1/src/wiget/'

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
        actions: [
          IconButton(onPressed: (){
            openAddUser(context);
          }, icon:const Icon(Icons.add))
        ],
      ),
      body: Container(
          child: Column(
        children: [_ui(userViewModel)],
      )),
    );
  }

  _ui(UserViewModel userViewModel) {
    if (userViewModel.loading) {
      return const AppLoading();
    }
    if (userViewModel.userError != null) {
      return AppError(
        errorText:userViewModel.userError?.message.toString(),
      );
    }
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            UserModel userModel = userViewModel.userListModel[index];
            return UserListRow(
              userModel: userModel,
              ontap: ()async{
              userViewModel.setSelectedUser(userModel);
              openUserDetail(context );
            }, );
           
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemCount: userViewModel.userListModel.length),
    );
  }
}
