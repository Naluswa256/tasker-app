// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      userDisplayName: json['userDisplayName'] as String,
      userPersonalEmail: json['userPersonalEmail'] as String,
      userPhoneNumber: json['userPhoneNumber'] as String?,
      userProfilePic: json['userProfilePic'] as String?,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'userDisplayName': instance.userDisplayName,
      'userPersonalEmail': instance.userPersonalEmail,
      'userPhoneNumber': instance.userPhoneNumber,
      'userProfilePic': instance.userProfilePic,
      'uid': instance.uid,
    };
