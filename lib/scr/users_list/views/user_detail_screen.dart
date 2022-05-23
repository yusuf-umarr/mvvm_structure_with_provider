import 'package:flutter/material.dart';
import 'package:mvvm_1/scr/users_list/view_model/user_view_model.dart';
import 'package:mvvm_1/scr/widget/app_title.dart';
import 'package:provider/provider.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('${userViewModel.selectedUser?.name}'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(text: userViewModel.selectedUser?.name),
              Text('${userViewModel.selectedUser?.email}',
                  style: const TextStyle(color: Colors.black)),
            ],
          )),
    );
  }
}
