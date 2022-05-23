import 'package:flutter/material.dart';
import 'package:mvvm_1/scr/users_list/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        actions: [IconButton(onPressed: ()async {
          bool userAdded = await userViewModel.addUserFunc();
          if(!userAdded){
            return;
          }
          Navigator.pop(context);
        }, icon: const Icon(Icons.save))],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(hintText: "Name"),
                  onChanged: (val) async {
                    userViewModel.addUser?.name = val;
                  }),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  decoration: const InputDecoration(hintText: "email"),
                  onChanged: (val) async {
                    userViewModel.addUser?.email = val;
                  })
            ],
          )),
    );
  }
}
