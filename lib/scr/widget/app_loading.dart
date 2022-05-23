import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const CupertinoActivityIndicator(),
    ));
  }
}
