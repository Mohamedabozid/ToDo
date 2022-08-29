import 'dart:convert';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/ui/pages/home_page/cubit/cubit.dart';
import 'package:to_do/ui/pages/home_page/cubit/states.dart';
import 'package:to_do/ui/pages/on_boarding_screen/log_in_screen/cubit/cubit.dart';
import 'package:to_do/ui/pages/on_boarding_screen/sign_up_screen/cubit/cubit.dart';

import '../../../styles/tooo.dart';
import 'components/task_bar.dart';
import '../../../controllers/task_controller.dart';
import '../../../models/task.dart';
import '../../../services/notification_services.dart';
import '../../../services/theme_services.dart';
import '../../../styles/theme.dart';
import '../../size_config.dart';
import '../../widgets/task_tile.dart';
import 'components/build_bottom_sheet.dart';
import 'components/no_show_msg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotifyHelper notifyHelper;

  @override
  //first initialize when project open
  void initState() {
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    _taskController.getTasks();
    super.initState();
  }

  DateTime _selectedDate = DateTime.now();
  final TaskController _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      //the app bar of home page
      appBar: _app_bar(),

      body: Column(
        children: [
          TaskBar(),
          _addDateBar(),
          SizedBox(
            height: 20,
          ),
          _showTasks(),
        ],
      ),
    );
  }

//App Bar Of Home Page
  AppBar _app_bar() {

    return AppBar(
      title: Text(
        'Hello Mohamed',
        style: headingStyle.copyWith(letterSpacing: 1),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.settings,
            size: 25,
            color: Appcolors.purple,
          ),
          onPressed: () {
            Get.bottomSheet(Container(
              padding: EdgeInsets.only(top: 4),
              //Check Dark Theme Mode
              color: Get.isDarkMode ? darkGreyClr : Colors.white,
              width: SizeConfig.screenWidth,
              //Check If The Device On land Scape Mode Or Portarit Mode
              height: (SizeConfig.orientation == Orientation.landscape)
                  ? SizeConfig.screenHeight * 0.6
                  : SizeConfig.screenHeight * 0.30,
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      height: 6,
                      width: 120,
                      decoration: BoxDecoration(
                          //Check Dark Theme Mode
                          color: Get.isDarkMode ? white : Colors.grey[700],
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: 50,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Dark Mode',
                          style: bodyStyle,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        DayNightSwitcher(
                          isDarkModeEnabled: ThemeServices().loadThemeFromBox(),
                          onStateChanged: (newVal) {
                            setState(() {
                              ThemeServices().loadThemeFromBox() == newVal;
                              ThemeServices().switchTheme();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        _taskController.DeleteAllTasks();
                        notifyHelper.cancelAllNotification();
                        Get.back();
                      },
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          margin: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          height: 50,
                          width: SizeConfig.screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Delete All Tasks',
                                style: bodyStyle,
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Icon(
                                Icons.delete_forever_rounded,
                                size: 30,
                              ),
                            ],
                          ))),
                ],
              ),
            ));
          },
        )
      ],
      leading: InkWell(
        child: CircleAvatar(
          radius: 20.0,

        )
      ),
      backgroundColor: context.theme.backgroundColor,
      elevation: 0,
    );
  }

  _addDateBar() {
    return Container(
        margin: EdgeInsets.only(left: 8, top: 10),
        child: DatePicker(
          DateTime.now(),
          height: 100,
          width: 75,
          initialSelectedDate: DateTime.now(),
          selectionColor: Appcolors.purple,
          monthTextStyle: subBodyStyle.copyWith(color: Colors.grey[800]),
          dateTextStyle: subBodyStyle.copyWith(color: Colors.grey[800]),
          dayTextStyle: subBodyStyle.copyWith(color: Colors.grey[800]),
          onDateChange: (newDate) {
            setState(() {
              _selectedDate = newDate;
            });
          },
        ));
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        //check if it home page has no tasks
        if (_taskController.taskList.isEmpty) {
          return NoShowMsg();
        } else {
          return ListView.builder(
            scrollDirection: SizeConfig.orientation == Orientation.landscape
                ? Axis.horizontal
                : Axis.vertical,
            itemBuilder: (context, index) {
              var task = _taskController.taskList[index];
              //check for the task repeat if none,daile,weekly,monthly
              if (task.repeat == 'Daily' ||
                  task.date == DateFormat.yMd().format(_selectedDate) ||
                  (task.repeat == 'Weekly' &&
                      _selectedDate
                                  .difference(
                                      DateFormat.yMd().parse(task.date!))
                                  .inDays %
                              7 ==
                          0) ||
                  (task.repeat == 'Monthly' &&
                      DateFormat.yMd().parse(task.date!).day ==
                          _selectedDate.day)) {
              } else {
                return Container();
              }
              // var hour = task.startTime.toString().split('|')[0];
              //  var minute = task.startTime.toString().split('|')[1];
              //  notifyHelper.scheduledNotification(
              //      int.parse(hour),
              // int.parse(minute),
              //      task);
              // initialize hours and minutes for Notification scheduleding and show the hours and minutes the user input
              var date = DateFormat.jm().parse(task.startTime!);
              var myDate = DateFormat('HH:mm').format(date);
              notifyHelper.scheduledNotification(
                  int.parse(myDate.toString().split(':')[0]),
                  int.parse(myDate.toString().split(':')[1]),
                  task);
              // get the task with simple animation
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 850),
                child: SlideAnimation(
                  //verticalOffset: 300,
                  horizontalOffset: 300,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {
                        showBottomSheet(context, task);
                      },
                      child: TaskTile(
                        task: task,
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: _taskController.taskList.length,
          );
        }
      }),
    );
  }

  showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 4),
        width: SizeConfig.screenWidth,
        height: (SizeConfig.orientation == Orientation.landscape)
            ? (task.isCompleted == 1
                ? SizeConfig.screenHeight * 0.6
                : SizeConfig.screenHeight * 0.8)
            : (task.isCompleted == 1
                ? SizeConfig.screenHeight * 0.30
                : SizeConfig.screenHeight * 0.39),
        color: context.theme.backgroundColor,
        child: Column(
          children: [
            Flexible(
              child: Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        Get.isDarkMode ? Colors.grey[300] : Colors.grey[600]),
              ),
            ),
            task.isCompleted == 1
                ? Container()
                : BuildBottomSheet(
                    onTap: () {
                      _taskController.MarkTaskCompleted(task.id!);
                      notifyHelper.cancelNotification(task);
                      Get.back();
                    },
                    label: 'Task Is Completed',
                    clr: Colors.blue),
            BuildBottomSheet(
                onTap: () {
                  _taskController.DeleteTask(task);
                  notifyHelper.cancelNotification(task);
                  Get.back();
                },
                label: 'Delete Task',
                clr: Colors.red),
            Divider(
              color: Get.isDarkMode ? Colors.grey : darkGreyClr,
            ),
            BuildBottomSheet(
                onTap: () {
                  Get.back();
                },
                label: 'Cancel',
                clr: Colors.blueGrey)
          ],
        ),
      ),
    ));
  }
}
