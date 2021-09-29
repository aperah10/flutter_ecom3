part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  ProfileEvent();

  @override
  List<Object> get props => [];
}

// !  PROFILE FETCH Event
class FetchProfileEvent extends ProfileEvent {
  @override
  List<Object> get props => [];
}

/* -------------------------------------------------------------------------- */
/*                          // ! PROFILE SAVE BUTTON                          */
/* -------------------------------------------------------------------------- */

class ProfileBtnEvent extends ProfileEvent {
  final String? fullname;
  final String? email;
  final String? pic;
  final String? gender;

  ProfileBtnEvent({this.fullname, this.email, this.gender, this.pic});

  @override
  // List<Object> get props => [fullname, email, gender, pic];

  @override
  String toString() => 'ProfileBtn { username: $fullname, password: $email }';
}
