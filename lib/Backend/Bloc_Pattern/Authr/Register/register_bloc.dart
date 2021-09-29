import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:thrid_ecom/Backend/Bloc_Pattern/Authr/auth/userauthenticate_bloc.dart';
import 'package:thrid_ecom/Backend/Respo/Authr/Reglogin_Respo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserauthenticateBloc authenticationBloc = UserauthenticateBloc();
  CusRLRespo userRepository = CusRLRespo();

  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is SignUpBtn) {
      yield RegisterLoading();

      try {
        var user = await userRepository.regRespo(
            email: event.email,
            phone: event.phone,
            fullname: event.fullname,
            password: event.password);
        // print('this is Register token RUNTYPE : -  ${user.runtimeType}');
        if (user == true) {
          // authenticationBloc.add(SignedIn(regtoken: user));
          // yield RegisterSucced(user: user);
          yield RegisterSucced();
        }
        yield RegisterInitial();
      } catch (e) {
        yield RegisterFailed(message: e.toString());
      }
    }
  }
}
