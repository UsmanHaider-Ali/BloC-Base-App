// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      token: json['token'] as String? ?? '',
      data: json['data'] == null
          ? const UserData()
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'token': instance.token,
      'data': instance.data,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      userID: json['userID'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      profile: json['profile'] as String? ?? '',
      number: json['number'] as String? ?? '',
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      isUserChangeSecretCode: json['isUserChangeSecretCode'] as bool? ?? false,
      isSignUpWithSocial: json['isSignUpWithSocial'] as bool? ?? false,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'name': instance.name,
      'email': instance.email,
      'profile': instance.profile,
      'number': instance.number,
      'isEmailVerified': instance.isEmailVerified,
      'isUserChangeSecretCode': instance.isUserChangeSecretCode,
      'isSignUpWithSocial': instance.isSignUpWithSocial,
    };
