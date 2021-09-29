part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}
/* -------------------------------------------------------------------------- */
/*                     // !  PROFILE STATE                                   */
/* -------------------------------------------------------------------------- */

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

// !  PROFILE LOADED GET REQUEST METHOD
class ProfileLoadedState extends ProfileState {
  List<Profile> profileData;

  ProfileLoadedState({required this.profileData});

  @override
  List<Object> get props => [];
}

// ! END PROFILE DATA
class ProfileSuccessState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  late String error;
  ProfileErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure(error: $error)';
}
