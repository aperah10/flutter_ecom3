import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Authr/auth/userauthenticate_bloc.dart';
import 'package:thrid_ecom/Backend/Respo/Authr/Reglogin_Respo.dart';

part 'userlogin_event.dart';
part 'userlogin_state.dart';

class UserloginBloc extends Bloc<UserloginEvent, UserloginState> {
  UserauthenticateBloc authenticationBloc = UserauthenticateBloc();
  CusRLRespo userRepository = CusRLRespo();

  UserloginBloc() : super(UserloginInitial());

  @override
  Stream<UserloginState> mapEventToState(
    UserloginEvent event,
  ) async* {
    if (event is LoginBtn) {
      yield LoginLoading();

      try {
        final usertoken = await userRepository.loginRespo(
            phone: event.phone, password: event.password);

        if (usertoken == true) {
          yield LoginSucccess();
        }
        yield UserloginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
