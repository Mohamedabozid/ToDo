import 'package:flutter/material.dart';
import 'package:to_do/ui/size_config.dart';
import 'package:to_do/styles/theme.dart';

class MyButton extends StatelessWidget {
   const MyButton(
      {Key? key,
       required this.label,
      required this.onTap,
      required this.height,
      required this.width,
      required this.borderRadius})
      : super(key: key);
  final  String label;
  final Function() onTap;
  final double height;
  final double width;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: borderRadius, color: Appcolors.purple),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                color: white,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
