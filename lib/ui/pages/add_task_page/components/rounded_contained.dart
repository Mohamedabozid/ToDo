import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../../styles/theme.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  Color?borderColor;



  RoundedContainer(
      {Key? key, required this.child, required this.color, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      width: SizeConfig.screenWidth * 0.9,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
          border: Border.all(color:borderColor!)),
      child: child,
    );
  }

  void navigateAndFinish(
      context,
      widget,
      ) =>
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => widget), (route) {
        return false;
      });
}
