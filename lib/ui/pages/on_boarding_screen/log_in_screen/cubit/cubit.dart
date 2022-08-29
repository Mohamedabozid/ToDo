import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/ui/pages/on_boarding_screen/log_in_screen/cubit/states.dart';

class ToDoLoginCubit extends Cubit<ToDoLoginStates> {
  ToDoLoginCubit() : super(ToDoLoginInitialState());

  static ToDoLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {

    var value;
    emit(ToDoLoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) {
          print(value.user!.email);
          print(value.user!.uid);

          emit(ToDoLoginSuccessState(value.user!.uid));
    })
        .catchError((error) {
          emit(ToDoLoginErrorState(error.toString()));
    }
        );
  }


  //
  // IconData suffix = Icons.visibility_outlined;
  // bool isPassword = true;
  //
  // void changePasswordVisibility() {
  //   isPassword = !isPassword;
  //   suffix =
  //       isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  //
  //   emit(ToDoChangePasswordVisibilityState());
  // }
}
