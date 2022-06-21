
abstract class RegisterStates{}
class RegisterInitState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{

}

class RegisterErrorState extends RegisterStates{
  final String error;
  RegisterErrorState(this.error);
}

class RegisterCreateSuccessState extends RegisterStates{

}

class RegisterErrorCreateState extends RegisterStates{
  final String error;
  RegisterErrorCreateState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates{}

