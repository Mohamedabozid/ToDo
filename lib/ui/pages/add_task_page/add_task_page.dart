import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/controllers/task_controller.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/ui/pages/home_page/home_page.dart';
import 'package:to_do/styles/theme.dart';
import 'package:intl/intl.dart';
import '../../size_config.dart';
import '../../widgets/button.dart';
import 'components/rounded_input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format(
        DateTime.now().add(
          Duration(minutes: 15),
        ),
      )
      .toString();
  int _remind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _repeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.to(HomePage());
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 25,
              color: Appcolors.purple,
            ),
          ),
          elevation: 0,
          backgroundColor: context.theme.backgroundColor,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Add Task', style: supHeadingStyle),
                InputField(
                  icon: Icon(
                    Icons.subtitles_outlined,
                    size: 25,
                    color: Appcolors.purple,
                  ),
                  text: 'Title',
                  hintText: 'Enter Title Here !',
                  controller: _titleController,
                ),
                InputField(
                  icon: Icon(
                    Icons.note_alt_outlined,
                    size: 25,
                    color: Appcolors.purple,
                  ),
                  text: 'Note',
                  hintText: 'Add Note Here',
                  controller: _noteController,
                ),
                InputField(
                    text: 'Date',
                    hintText: DateFormat.yMd().format(_selectedDate),
                    widget: IconButton(
                        onPressed: () => _getDateFromUser(),
                        icon: Icon(
                          Icons.calendar_month_rounded,
                          size: 25,
                          color: Appcolors.purple,
                        ))),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: InputField(
                              text: 'StartTime',
                              hintText: _startTime,
                              widget: IconButton(
                                  onPressed: () =>
                                      _getTimeFromUser(isStartTime: true),
                                  icon: Icon(
                                    Icons.watch_outlined,
                                    size: 25,
                                    color: Appcolors.purple,
                                  )))),
                      Expanded(
                          child: InputField(
                              text: 'EndTime',
                              hintText: _endTime,
                              widget: IconButton(
                                  onPressed: () =>
                                      _getTimeFromUser(isStartTime: false),
                                  icon: Icon(
                                    Icons.watch_off_outlined,
                                    size: 25,
                                    color: Appcolors.purple,
                                  )))),
                    ]),
                InputField(
                    text: 'Remind',
                    hintText: '$_remind Minutes early',
                    widget: Row(children: [
                      DropdownButton(
                        borderRadius: BorderRadius.circular(15),
                        iconEnabledColor: Colors.blueGrey,
                        style: bodyStyle,
                        underline: Container(
                          height: 0,
                        ),
                        iconSize: 35,
                        dropdownColor: Colors.blueGrey,
                        items: remindList
                            .map<DropdownMenuItem<String>>((int value) =>
                                DropdownMenuItem(
                                    value: value.toString(),
                                    child: Text('$value ')))
                            .toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _remind = int.parse('$newVal');
                          });
                        },
                        elevation: 4,
                      ),
                      SizedBox(
                        width: 6,
                      )
                    ])),
                InputField(
                    text: 'Repeat',
                    hintText: _repeat,
                    widget: Row(children: [
                      DropdownButton(
                        borderRadius: BorderRadius.circular(15),
                        iconEnabledColor: Colors.blueGrey,
                        style: bodyStyle,
                        underline: Container(
                          height: 0,
                        ),
                        iconSize: 35,
                        dropdownColor: Colors.blueGrey,
                        items: repeatList
                            .map<DropdownMenuItem<String>>((value) =>
                                DropdownMenuItem(
                                    value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String? newVal) {
                          setState(() {
                            _repeat = newVal!;
                          });
                        },
                        elevation: 4,
                        alignment: Alignment.bottomLeft,
                      ),
                      SizedBox(
                        width: 6,
                      )
                    ])),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Color',
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                            spacing: 10,
                            children: List.generate(
                                4,
                                (index) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedColor = index;
                                        });
                                      },
                                      child: CircleAvatar(
                                          child: _selectedColor == index
                                              ? Icon(Icons.done)
                                              : null,
                                          backgroundColor: (index == 0)
                                              ? Appcolors.purple
                                              : (index == 1)
                                                  ? Appcolors.yellow
                                                  : (index == 2)
                                                      ? Appcolors.black
                                                      : Appcolors.bleu),
                                    ))),
                        MyButton(
                          height: SizeConfig.screenHeight * 0.07,
                          width: SizeConfig.screenWidth * 0.3,
                          borderRadius: BorderRadius.circular(20),
                          label: 'Creat Task',
                          onTap: () {
                            checkValidate();
                          },
                        )
                      ])
                ])
              ],
            ),
          ),
        ));
  }

  void checkValidate() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar('', '',
          colorText: Colors.red,
          titleText: Text(
            'Warinig',
            style: supHeadingStyle.copyWith(
                color: Colors.red, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          messageText: Text(
            'All Fields Are Required',
            style: bodyStyle,
            textAlign: TextAlign.center,
          ),
          icon: Icon(
            Icons.warning,
            size: 30,
            color: Colors.red,
          ),
          snackPosition: SnackPosition.TOP);
    } else {
      debugPrint('Some Thing Go Wrong');
    }
  }

  addTaskToDb() async {
    try {
      int value = await _taskController.addTask(
          task: Task(
              title: _titleController.text,
              note: _noteController.text,
              isCompleted: 0,
              date: DateFormat.yMd().format(_selectedDate),
              startTime: _startTime,
              endTime: _endTime,
              color: _selectedColor,
              remind: _remind,
              repeat: _repeat));
      debugPrint('$value');
    } catch (e) {
      print(e);
    }
  }

  _getDateFromUser() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    } else {
      print('SomeThing Go Wrong');
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
              DateTime.now().add(
                Duration(minutes: 15),
              ),
            ),
    );
    String formatedPicedTime = pickedTime!.format(context);
    if (isStartTime == true) {
      setState(() {
        _startTime = formatedPicedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = formatedPicedTime;
      });
    } else {
      print('SomeThing Go Wrong');
    }
  }
}
