
import 'package:e_commerce_app_demo/components/custom_suffix_icon.dart';
import 'package:e_commerce_app_demo/components/custom_text_form_field.dart.dart';
import 'package:e_commerce_app_demo/components/form_error.dart';
import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:e_commerce_app_demo/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  //fake account for login
  String? email;
  String? password;
  String? cpassword;

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
                }else if(cpassword == value && errors.contains(kMatchPassError)){
                  removeError(error: kMatchPassError);
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
                password = value;
                return null; 
              }, 
              hintText: 'Enter your password', 
              label: 'Password', 
              iconPath: 'assets/icons/Lock.svg'
            ),
            SizedBox(height: size.width * 0.08,),
            CustomTextFormField(
              isPassword: true,
              onSaved: (newValue) => cpassword = newValue,
              onChanged: (value){
                if(password == value && errors.contains(kMatchPassError)){
                  removeError(error: kMatchPassError);
                }
              },
              validator: (value){
                //this line will check if pass field is empty or not
                if(password != value && value!.isNotEmpty){
                  addError(error: kMatchPassError);
                  return "";
                }else if(value!.isEmpty){
                  return "";
                }
                cpassword = value;
                return null; 
              },
              hintText: 'Re-enter your password', 
              label: 'Confirm password', 
              iconPath: 'assets/icons/Lock.svg'
            ),
            FormError(error: errors,),
            SizedBox(height: size.width * 0.08,),
            RoundedButton(
              width: size.width * 0.8,
              height: size.width * 0.17,
              text: "Register",
              onPress: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save(); //save info that valid
                  //if all things are valid then
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                }
              }
            ),

          ],
        )
      ),
    );
  }
}
