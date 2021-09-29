import 'dart:convert';

MainProfile mainProductMFromJson(String str) =>
    MainProfile.fromJson(json.decode(str));

String mainProductMToJson(MainProfile data) => json.encode(data.toJson());

class MainProfile {
  MainProfile({
    required this.profileData,
  });

  List<Profile> profileData;

  factory MainProfile.fromJson(Map<String, dynamic> json) => MainProfile(
        profileData: List<Profile>.from(
            json["profileData"].map((x) => Profile.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "profileData": List<dynamic>.from(profileData.map((x) => x.toJson())),
      };
}

/* -------------------------------------------------------------------------- */
/*                 // orc 1.  PROFILE PAGE MODEL  IN WITHOUT LIST                */
/* -------------------------------------------------------------------------- */

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.id,
    this.fullname,
    this.email,
    this.gender,
    this.pic,
    this.uplod,
  });

  String? id;
  String? fullname;
  String? email;
  String? gender;
  dynamic pic;
  String? uplod;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        gender: json["gender"],
        pic: json["pic"],
        uplod: json["uplod"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "gender": gender,
        "pic": pic,
        "uplod": uplod,
      };
}
