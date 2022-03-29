import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.error,
  }) : super(key: key);

  final List<String> error;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(error.length, (index) => formErrorText(size, error[index]))
    );
  }

  Widget formErrorText(Size size, String error) {
    return Container(
      margin: EdgeInsets.only(top: size.width * 0.02),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/Error.svg", width: size.width * 0.05),
          SizedBox(width: size.width * 0.03,),
          Text(error)
        ],
      ),
    );
  }
}