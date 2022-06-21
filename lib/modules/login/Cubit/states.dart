
abstract class loginStates{}
class LoginInitState extends loginStates{}

class LoginLoadingState extends loginStates{}

class LoginSuccessState extends loginStates{
  final String uId;
  LoginSuccessState(this.uId);}

class LoginErrorState extends loginStates{
  final String error;
  LoginErrorState(this.error);
}

class LoginChangePasswordVisibilityState extends loginStates{}

