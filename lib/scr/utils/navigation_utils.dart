import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_1/scr/users_list/views/add_user_screen.dart';
import 'package:mvvm_1/scr/users_list/views/user_detail_screen.dart';

void openUserDetail(BuildContext context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => UserDetailScreen()));
}
void openAddUser(BuildContext context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserScreen()));
}