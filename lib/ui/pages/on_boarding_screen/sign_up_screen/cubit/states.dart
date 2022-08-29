

abstract class ToDoRegisterStates{}


class ToDoRegisterInitialState extends ToDoRegisterStates{}

class ToDoRegisterLoadingState extends ToDoRegisterStates{}

class ToDoRegisterSuccessState extends ToDoRegisterStates {}

class ToDoRegisterErrorState extends ToDoRegisterStates
{
  final String error;

  ToDoRegisterErrorState(this.error);
}


class ToDoCreateUserSuccessState extends ToDoRegisterStates {}

class ToDoCreateUserErrorState extends ToDoRegisterStates
{
  final String error;

  ToDoCreateUserErrorState(this.error);
}




