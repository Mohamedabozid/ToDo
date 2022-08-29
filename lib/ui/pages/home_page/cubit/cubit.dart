import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/ui/pages/home_page/cubit/states.dart';
import '../../../../models/task.dart';
import '../components/constants.dart';

class ToDoCubit extends Cubit<ToDoStates> {
  ToDoCubit() : super(ToDoInitialState());

  static ToDoCubit get(context) => BlocProvider.of(context);

  ToDoUserModel? userModel;

  void getUserData() {
    emit(ToDoGetUserLoadingState());

    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      // print(value.data());
      userModel = ToDoUserModel.fromJson(value.data()!);
      emit(ToDoGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ToDoGetUserErrorState(error.toString()));
    });


  }






}
