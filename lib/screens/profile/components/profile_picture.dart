import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.35,
      height: size.width * 0.35,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,  //clip.none will
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/yourname.png"),
          ),
          Positioned(
            right: -12,
            bottom: 0,
            child: SizedBox(
              width: size.width * 0.12,
              height: size.width * 0.12,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.grey.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                    side: BorderSide(color: Colors.white, width: 2)
                  )
                ),
                onPressed: (){}, 
                child: SvgPicture.asset("assets/icons/Camera Icon.svg")
              ),
            )
          )

          // GestureDetector(
          //     onTap: (){},
          //     child: Container(
          //       width: size.width * 0.12,
          //       height: size.width * 0.12,
          //       padding: EdgeInsets.all(size.width * 0.025),
          //       decoration: BoxDecoration(
          //         color: Colors.grey.shade100,
          //         border: Border.all(color: Colors.black, width: 2),
          //         shape: BoxShape.circle
          //       ),
          //       child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
          //     ),
          //   )
        ],
      )
    );
  }
}