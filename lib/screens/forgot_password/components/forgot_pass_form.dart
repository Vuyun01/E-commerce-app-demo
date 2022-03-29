
import 'package:e_commerce_app_demo/components/custom_suffix_icon.dart';
import 'package:e_commerce_app_demo/components/custom_text_form_field.dart.dart';
import 'package:e_commerce_app_demo/components/form_error.dart';
import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? email;

  void addError({required String error}){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }
  void removeError({required String error}){
    // if(errors.contains(error)){
      setState(() {
        errors.remove(error); 
      });
    // }
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
            SizedBox(height: size.width * 0.2,),
            CustomTextFormField(
              textInputType: TextInputType.emailAddress,
              onSaved: (newValue) => email = newValue, //save value to variable
              onChanged: (value){
                if(value!.isNotEmpty && errors.contains(kEmailNullError)){
                  removeError(error: kEmailNullError);
                }
                //this line will check if email are valid or not
                else if(emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
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
            SizedBox(height: size.width * 0.02,),
            FormError(error: errors,),
            SizedBox(height: size.width * 0.08,),
            RoundedButton(
              width: size.width * 0.8,
              height: size.width * 0.17,
              text: "Send",
              onPress: (){
                if(_formKey.currentState!.validate()){
                  // _formKey.currentState!.save();
                  // Navigator.of(context).pop();
                }
              }
            ),

          ],
        )
      ),
    );
  }
}
