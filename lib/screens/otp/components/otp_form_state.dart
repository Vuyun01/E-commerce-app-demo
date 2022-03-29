import 'package:e_commerce_app_demo/components/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class OtpFormState extends StatefulWidget {
  const OtpFormState({ Key? key }) : super(key: key);

  @override
  State<OtpFormState> createState() => _OtpFormStateState();
}

class _OtpFormStateState extends State<OtpFormState> {
  late FocusNode box2;
  late FocusNode box3;
  late FocusNode box4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    box2 = FocusNode();
    box3 = FocusNode();
    box4 = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    box2.dispose();
    box3.dispose();
    box4.dispose();
    super.dispose();
  }
  void nextNode({required String value, required FocusNode focusNode}){
    if(value.length == 1){
      focusNode.requestFocus();
    }
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: size.width * 0.15,
                child: TextFormField( 
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: size.width * 0.03),
                    enabledBorder: outlineInputBorder(),
                    focusedBorder: outlineInputBorder(),
                    border: outlineInputBorder(),
                  ),
                  onChanged: (value){
                    nextNode(value: value, focusNode: box2);
                  },
                ),
              ),
              SizedBox(
                width: size.width * 0.15,
                child: TextFormField(
                  focusNode: box2,
                  obscureText: true,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: size.width * 0.03),
                    enabledBorder: outlineInputBorder(),
                    focusedBorder: outlineInputBorder(),
                    border: outlineInputBorder(),
                  ),
                  onChanged: (value){
                    nextNode(value: value, focusNode: box3);
                  },
                ),
              ),
              SizedBox(
                width: size.width * 0.15,
                child: TextFormField(
                  focusNode: box3,
                  obscureText: true,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: size.width * 0.03),
                    enabledBorder: outlineInputBorder(),
                    focusedBorder: outlineInputBorder(),
                    border: outlineInputBorder(),
                  ),
                  onChanged: (value){
                    nextNode(value: value, focusNode: box4);
                  },
                ),
              ),
              SizedBox(
                width: size.width * 0.15,
                child: TextFormField(
                  focusNode: box4,
                  obscureText: true,
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: size.width * 0.03),
                    enabledBorder: outlineInputBorder(),
                    focusedBorder: outlineInputBorder(),
                    border: outlineInputBorder(),
                  ),
                  onChanged: (value){
                    box4.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: size.width * 0.3,),
          RoundedButton(
            width: size.width * 0.8,
            height: size.width * 0.17,
            text: "Continue", onPress: (){}
          )
        ],
      )
    );
  }
  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: kTextColor),
    );
  }
}