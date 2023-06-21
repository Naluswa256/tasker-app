// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel(
      {
      required String userDisplayName,
      required String userPersonalEmail,
      required String? userPhoneNumber,
      required String? userProfilePic,
      required String uid
      }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
