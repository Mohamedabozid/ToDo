abstract class ToDoStates{}


class ToDoInitialState extends ToDoStates{}

class ToDoGetUserLoadingState extends ToDoStates{}


class ToDoGetUserSuccessState extends ToDoStates{}

class ToDoGetUserErrorState extends ToDoStates
{
 final String error;

  ToDoGetUserErrorState(this.error);

}





