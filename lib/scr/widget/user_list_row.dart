import 'package:flutter/material.dart';
import 'package:mvvm_1/scr/users_list/models/user_model.dart';
import 'package:mvvm_1/scr/widget/app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel? userModel;
  final Function()? ontap;
  const UserListRow({Key? key, this.userModel, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(text: userModel?.name),
              // AppTitle(text: userModel?.email),
              Text('${userModel?.email}',
              style: const TextStyle(color: Colors.black)),
            ],
          )),
    );
  }
}
