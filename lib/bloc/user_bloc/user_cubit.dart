import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class UserCubit extends Cubit<String> {
  UserCubit() : super('User');

  void setUserName(String userName){
    emit(userName);
  }
}
