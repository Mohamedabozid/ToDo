class Task {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;
  int? remind;
  String? repeat;

  Task({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
    this.remind,
    this.repeat,
  });



  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'note': note,
      'isCompleted': isCompleted,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'color': color,
      'remind': remind,
      'repeat': repeat,
    };
  }

  Task.fromJson(
      Map<String, dynamic> json) {


    id= json[('id')];
    title= json[('title')] ;
    note= json[('note')];
    isCompleted= json[('isCompleted')] ;
    date= json[('date')] ;
    startTime= json[('startTime')] ;
    endTime= json[('endTime')] ;
    color= json[('color')];
    remind= json[('remind')] ;
    repeat= json[('repeat')] ;
  }

}

class ToDoUserModel
{
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? image;

  ToDoUserModel(
  {
    this.name,
    this.email,
    this.phone,
    this.uId,
    this.image,
});

  ToDoUserModel.fromJson(Map< String , dynamic> json)
  {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
  }

  Map< String , dynamic>toMap()
  {
    return
      {
        'name':name,
        'email':email,
        'phone':phone,
        'uId':uId,
        'image':image,
      };
  }
}

