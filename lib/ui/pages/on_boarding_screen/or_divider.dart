import 'package:flutter/material.dart';
import 'package:to_do/styles/theme.dart';
import 'package:to_do/ui/size_config.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key, required this.height}) : super(key: key);
final double height ;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.screenWidth * 0.8,
      child: Row(
        children: [
          buildExpanded(),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          Text('OR'),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
          buildExpanded(),
        ],
      ),
    );
  }

  Expanded buildExpanded() {
    return Expanded(
        child: Divider(
      height:height,
      color: darkGreyClr,
    ));
  }
}
