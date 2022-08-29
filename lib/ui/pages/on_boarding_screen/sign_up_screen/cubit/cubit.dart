import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/ui/pages/on_boarding_screen/sign_up_screen/cubit/states.dart';

class ToDoRegisterCubit extends Cubit<ToDoRegisterStates> {
  ToDoRegisterCubit() : super(ToDoRegisterInitialState());

  static ToDoRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    emit(ToDoRegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {

      createUser(
          uId: value.user!.uid,
          phone: phone,
          name: name,
          email: email,
      );
    }).catchError(
      (error) {
        emit(ToDoRegisterErrorState(error.toString()));
      },
    );
  }

  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    ToDoUserModel model = ToDoUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      image: 'https://img.freepik.com/free-photo/excited-happy-young-pretty-woman_171337-2005.jpg?w=740&t=st=1660660355~exp=1660660955~hmac=83b7580c91f9a5b6148f1410870971afb39917e5f56d00b9e64edef40c31dfd9'
    );

    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(ToDoCreateUserSuccessState());
    }).catchError((error) {
      emit(ToDoCreateUserErrorState(error.toString()));
    });
  }

// IconData suffix = Icons.visibility_outlined;
// bool isPassword = true;
//
// void changePasswordVisibility()
// {
//   isPassword = !isPassword;
//   suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
//
//   emit(ToDoChangePasswordVisibilityState());
// }
}
