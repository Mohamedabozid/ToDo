
abstract class ToDoLoginStates{}


class ToDoLoginInitialState extends ToDoLoginStates{}

class ToDoLoginLoadingState extends ToDoLoginStates {}

class ToDoLoginSuccessState extends ToDoLoginStates
{
  final String uId;

  ToDoLoginSuccessState(this.uId);
}

class ToDoLoginErrorState extends ToDoLoginStates
{
  final String error;

  ToDoLoginErrorState(this.error);
}




