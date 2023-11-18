import 'package:booklyapp/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
     this.borderRadius,
    required this.text,
     this.fontSize, this.onPresses
  });
final Color backgroundColor;
final Color textColor;
final BorderRadius? borderRadius;
final String text;
final double? fontSize;
final void Function()? onPresses;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 48,
      child: TextButton(
        onPressed: () {
          onPresses!();
        },
        style:TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:  RoundedRectangleBorder(
            borderRadius:borderRadius ?? BorderRadius.circular(
              12
            )
          )
        ) ,
        child:  Text(text,
          style: Styles.texStyle18.copyWith(
            color: textColor,
              fontSize: fontSize??18,
            fontWeight: FontWeight.w900
          ),),
      ),
    );
  }
}
