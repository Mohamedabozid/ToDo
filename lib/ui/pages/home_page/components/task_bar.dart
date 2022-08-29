import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../controllers/task_controller.dart';
import '../../../../styles/theme.dart';
import '../../../size_config.dart';
import '../../../widgets/button.dart';
import '../../add_task_page/add_task_page.dart';
class TaskBar extends StatelessWidget {
  const TaskBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TaskController _taskController = Get.put(TaskController());
    return   Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: supHeadingStyle.copyWith(letterSpacing: 1),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Today', style: supHeadingStyle.copyWith(letterSpacing: 4)),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          MyButton(
            height: SizeConfig.screenHeight * 0.07,
            width: SizeConfig.screenWidth * 0.3,
            borderRadius: BorderRadius.circular(30),
            label: '+ Add Task',
            onTap: () async {
              await Get.to(AddTaskPage());
              _taskController.getTasks();
            },
          ),
        ],
      ),
    );

  }
}
