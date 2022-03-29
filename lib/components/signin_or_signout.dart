import 'package:flutter/material.dart';

import '../constants.dart';

class SignUpOrSignIn extends StatelessWidget {
  const SignUpOrSignIn({
    Key? key, 
    this.isAccountExisted = false, 
    required this.onPress,
  }) : super(key: key);

  final bool isAccountExisted;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Text(!isAccountExisted ? "Don't have any account?" : "Already have an account?" ),
          TextButton(
          onPressed: onPress, 
          child: Text(!isAccountExisted ? 'Sign Up' : 'Log In', style: TextStyle(color: kPrimaryColor))
        ),
      ],
    );
  }
}