import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String? errorText;
  const AppError({Key? key, this.errorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Visibility(
      visible: null != errorText && errorText!.isNotEmpty,
      child: Container(
        child:Text(errorText!, style: const TextStyle(color: Colors.red))
      ),
    );
  }
}