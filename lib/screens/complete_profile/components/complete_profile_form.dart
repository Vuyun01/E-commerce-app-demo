import 'package:e_commerce_app_demo/components/custom_text_form_field.dart.dart';
import 'package:e_commerce_app_demo/components/form_error.dart';
import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:e_commerce_app_demo/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({ Key? key }) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  //fake account for login
  String? firstName;
  String? lastName;
  String? phone;
  String? address;


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
              onSaved: (newValue) => firstName = newValue, //save value to variable
              onChanged: (value){
                if(value!.isNotEmpty && errors.contains(kNullNameError)){
                  removeError(error: kNullNameError);
                }
              },
              validator: (value){
                if(value!.isEmpty){
                  addError(error: kNullNameError);
                  return "";
                }
                return null; 
              },
              hintText: 'Enter your first name', 
              label: 'First name', 
              iconPath: 'assets/icons/User.svg'
            ),
            SizedBox(height: size.width * 0.08,),
            CustomTextFormField(
              onSaved: (newValue) => lastName = newValue,
              onChanged: (value){
                if(value!.isNotEmpty && errors.contains(kNullNameError)){
                  removeError(error: kNullNameError);
                }
              },
              validator: (value){
                if(value!.isEmpty){
                  addError(error: kNullNameError);
                  return "";
                }
                return null; 
              }, 
              hintText: 'Enter your last name', 
              label: 'Last name', 
              iconPath: 'assets/icons/User.svg'
            ),
            SizedBox(height: size.width * 0.08,),
            CustomTextFormField(
              textInputType: TextInputType.number,
              onSaved: (newValue) => phone = newValue,
              onChanged: (value){
                if(value!.isNotEmpty && errors.contains(kPhoneNumberNullError)){
                  removeError(error: kPhoneNumberNullError);
                }
              },
              validator: (value){
                if(value!.isEmpty){
                  addError(error: kPhoneNumberNullError);
                  return "";
                }
                return null; 
              },
              hintText: 'Enter your phone number', 
              label: 'Phone number', 
              iconPath: 'assets/icons/Phone.svg'
            ),
            SizedBox(height: size.width * 0.08,),
            CustomTextFormField(
              textInputType: TextInputType.streetAddress,
              onSaved: (newValue) => address = newValue,
              onChanged: (value){
                if(value!.isNotEmpty && errors.contains(kAddressNullError)){
                  removeError(error: kAddressNullError);
                }
              },
              validator: (value){
                //this line will check if pass field is empty or not
                if(value!.isEmpty){
                  addError(error: kAddressNullError);
                  return "";
                }
                return null; 
              },
              hintText: 'Enter your address', 
              label: 'Address', 
              iconPath: 'assets/icons/Location point.svg'
            ),
            FormError(error: errors,),
            SizedBox(height: size.width * 0.08,),
            RoundedButton(
              width: size.width * 0.8,
              height: size.width * 0.17,
              text: "Complete Profile",
              onPress: (){
                if(_formKey.currentState!.validate()){
                  // _formKey.currentState!.save(); //save info that valid
                  //if all things are valid then
                  Navigator.pushNamed(context, OPTScreen.routeName);
                }
              }
            ),

          ],
        )
      ),
    );
  }
}