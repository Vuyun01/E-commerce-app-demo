
import 'package:e_commerce_app_demo/components/custom_suffix_icon.dart';
import 'package:e_commerce_app_demo/components/custom_text_form_field.dart.dart';
import 'package:e_commerce_app_demo/components/forgot_password.dart';
import 'package:e_commerce_app_demo/components/form_error.dart';
import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:e_commerce_app_demo/screens/forgot_password/forgot_pass_screen.dart';
import 'package:e_commerce_app_demo/screens/login_success/login_success.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  //fake account for login
  String? email;
  String? password;
  bool remember = false;

  void addError({required String error}){
    if(!errors.contains(error))
      setState(() {
        errors.add(error);
      });
    
  }
  void removeError({required String error}){
    // if(errors.contains(error))
      setState(() {
        errors.remove(error); 
      });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              textInputType: TextInputType.emailAddress,
              onSaved: (newValue) => email = newValue, //save value to variable
              onChanged: (value){
                if(value!.isNotEmpty && errors.contains(kEmailNullError)){
                  removeError(error: kEmailNullError);
                }
                //this line will check if email are valid or not
                else if(emailValidatorRegExp.hasMatch(value) &&  errors.contains(kInvalidEmailError)){
                  removeError(error: kInvalidEmailError);
                }
              },
              validator: (value){
                //this line will check if email field is empty or not
                if(value!.isEmpty){
                  addError(error: kEmailNullError);
                  return "";
                }
                //this line will check if email are valid or not
                else if(!emailValidatorRegExp.hasMatch(value) && value.isNotEmpty){
                  addError(error: kInvalidEmailError);
                  return "";
                }
                return null; 
              },
              hintText: 'Enter your email', 
              label: 'Email', 
              iconPath: 'assets/icons/Mail.svg'
            ),
            SizedBox(height: size.width * 0.08,),
            CustomTextFormField(
              isPassword: true,
              onSaved: (newValue) => password = newValue,
              onChanged: (value){
                if(value!.isNotEmpty && errors.contains(kPassNullError)){
                  removeError(error: kPassNullError);
                }else if(value.length >= 8 && errors.contains(kShortPassError)){
                  removeError(error: kShortPassError);
                }
              },
              validator: (value){
                //this line will check if pass field is empty or not
                if(value!.isEmpty){
                  addError(error: kPassNullError);
                  return "";
                }
                //this line will check if pass are enough characters
                else if(value.length < 8 && value.isNotEmpty){
                  addError(error: kShortPassError);
                  return "";
                }
                return null; 
              }, 
              hintText: 'Enter your password', 
              label: 'Password', 
              iconPath: 'assets/icons/Lock.svg'
            ),
            SizedBox(height: size.width * 0.04,),
            ForgotPasswordItem(
              isChecked: remember,
              onPress: (value){
                setState(() {
                  remember = value!;
                });
              }, 
            ),
            FormError(error: errors,),
            SizedBox(height: size.width * 0.08,),
            RoundedButton(
              width: size.width * 0.8,
              height: size.width * 0.17,
              text: "Sign In",
              onPress: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save(); //save info that valid
                  //if all things are valid then
                  Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                }
              }
            ),

          ],
        )
      ),
    );
  }
}