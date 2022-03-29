import 'package:flutter/material.dart';

import '../constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.6,
      // height: size.width * 0.15,
      decoration: BoxDecoration(
        color: kTextColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        cursorColor: kTextColor,
        onChanged: (value){},
        decoration: InputDecoration(
          hintText: "Search product",
          prefixIcon: Icon(Icons.search, color: kTextColor,),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,       
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03,
            vertical: size.width * 0.03
          )
        ),
      ),
    );
  }
}
