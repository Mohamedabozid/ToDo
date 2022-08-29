import 'package:flutter/material.dart';

import '../../../../size_config.dart';


class CircularButton extends StatelessWidget {
  const CircularButton(
      {Key? key,
      required this.onTap,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.icon,
      required this.color})
      : super(key: key);
  final Function() onTap;
  final double height;
  final double width;
  final BorderRadius borderRadius;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(borderRadius: borderRadius, color: color),
        child: Center(child: icon),
      ),
    );
  }
}
