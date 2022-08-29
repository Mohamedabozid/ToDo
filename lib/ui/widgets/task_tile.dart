import 'package:flutter/material.dart';

import '../../models/task.dart';
import '../size_config.dart';
import '../../styles/theme.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.orientation == Orientation.landscape
              ? getProportionateScreenWidth(4)
              : getProportionateScreenWidth(20)),
      width: SizeConfig.orientation == Orientation.landscape
          ? SizeConfig.screenWidth / 2
          : SizeConfig.screenWidth,
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(12)),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _getColor(task.color!)),
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(task.title!,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            color: white,
                            fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_alarms_rounded,
                          size: 25,
                          color: white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('${task.startTime} - ${task.endTime}',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                color: white,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${task.note}',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            color: white,
                            fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 100,
              width: 0.5,
              color: Colors.grey[400]!.withOpacity(0.3),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Center(
                child: Text(
                  task.isCompleted == 0 ? 'TO DO' : 'Completed',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                      color: white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_getColor(int clr) {
  switch (clr) {
    case (0):
      {
        return Appcolors.purple;
      }
    case (1):
      {
        return Appcolors.yellow;
      }
    case (2):
      {
        return Appcolors.black;
      }
    case (3):
      {
        return Appcolors.bleu;
      }
    default:
      {
        return Appcolors.white;
      }
  }
}
