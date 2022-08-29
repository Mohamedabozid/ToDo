import 'package:flutter/material.dart';

import '../../../../styles/theme.dart';
import '../../add_task_page/components/rounded_contained.dart';

class BuildBottomSheet extends StatelessWidget {
  final Function() onTap;

  final String label;

  final Color clr;

  const BuildBottomSheet(
      {Key? key, required this.onTap, required this.label, required this.clr})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
          borderColor: Colors.transparent,
          color: clr,
          child: Center(
            child: Text(
              label,
              style: bodyStyle.copyWith(letterSpacing: 1, color: white),
            ),
          )),
    );
  }
}
