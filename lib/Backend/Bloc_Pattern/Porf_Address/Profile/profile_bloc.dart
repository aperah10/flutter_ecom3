import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:thrid_ecom/Backend/Models/Prof_Address/Profilem.dart';
import 'package:thrid_ecom/Backend/Respo/Prof_Address/ProfileRespo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  // ! Adding Repo for data logic

  ProfileDataRespo profRespo = ProfileDataRespo();

  ProfileBloc() : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    // ! FIRST STATE /EVENT FOR FETECH DATA
    if (event is FetchProfileEvent) {
      yield ProfileLoadingState();

      try {
        List<Profile> profileData = await profRespo.getProfileData();

        print('profData:- $profileData ');

        yield ProfileLoadedState(
          profileData: profileData,
        );
      } catch (e) {
        yield ProfileErrorState(error: e.toString());
      }
    }

    /* -------------------------------------------------------------------------- */
    /*                  // ! PROFILE ADDED , ADDING  , DELETING BLOC                 */
    /* -------------------------------------------------------------------------- */
    if (event is ProfileBtnEvent) {
      List<Profile> prodList = await profRespo.addProfileData(
          fullname: event.fullname,
          email: event.email,
          pic: event.pic,
          gender: event.gender);

      yield ProfileSuccessState();
    }
  }
}
