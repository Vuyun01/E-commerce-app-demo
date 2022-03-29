import 'package:e_commerce_app_demo/screens/forgot_password/forgot_pass_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ForgotPasswordItem extends StatelessWidget {
  const ForgotPasswordItem({ 
    Key? key, 
    this.isChecked = false, 
    required this.onPress,

  }) : super(key: key);

  final bool isChecked;
  final Function(bool? value) onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Row(
            children: [
              Checkbox(
                activeColor: kPrimaryColor,
                value: isChecked,
                onChanged: onPress,
              ),
              Text("Remember me")
            ],
          ),
          Spacer(),
          TextButton(
            onPressed: () => Navigator.popAndPushNamed(context, ForgotPasswordScreen.routeName), 
            child: Text('Forgot Password?', style: TextStyle(color: kPrimaryColor))
          ),
          
        ],
    );
  }
}