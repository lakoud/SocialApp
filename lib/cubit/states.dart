abstract class SocialStates{}
class SocialGetuserInitStates extends SocialStates{}
class SocialGetuserLoadingStates extends SocialStates{}
class SocialGetUserSuccesstStates extends SocialStates{}
class SocialGetUserErrorStates extends SocialStates{
  final String error;
  SocialGetUserErrorStates(this.error);
}
class SocialChangeBottomNavState extends SocialStates{}
class SocialChangeModeState extends SocialStates{}

class SocialPostState extends SocialStates{


}
