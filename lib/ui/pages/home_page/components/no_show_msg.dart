import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';
import '../../../../styles/theme.dart';

class NoShowMsg extends StatelessWidget {
  const NoShowMsg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      AnimatedPositioned(
        duration: Duration(milliseconds: 2000),
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            direction: SizeConfig.orientation == Orientation.landscape
                ? Axis.horizontal
                : Axis.horizontal,
            children: [
              SizeConfig.orientation == Orientation.landscape
                  ? SizedBox(
                      height: 6,
                    )
                  : SizedBox(
                      height: 220,
                    ),
              SvgPicture.asset(
                'images/task.svg',
                width: 200,
                height: 200,
                color: Appcolors.purple.withOpacity(0.6),
                semanticsLabel: 'Add Task',
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                child: Text(
                  'You don\'t have any tasks yet !\n Add new tasks to make your days productive',
                  style: bodyStyle.copyWith(
                      letterSpacing: 1, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              SizeConfig.orientation == Orientation.landscape
                  ? SizedBox(
                      height: 120,
                    )
                  : SizedBox(
                      height: 180,
                    ),
            ],
          ),
        ),
      ),
    ]);
  }
}
