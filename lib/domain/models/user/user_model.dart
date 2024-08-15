import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @Default(false) bool success,
    @Default('') String message,
    @Default('') String token,
    @Default(UserData()) UserData data,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    @Default('') String userID,
    @Default('') String name,
    @Default('') String email,
    @Default('') String profile,
    @Default('') String number,
    @Default(false) bool isEmailVerified,
    @Default(false) bool isUserChangeSecretCode,
    @Default(false) bool isSignUpWithSocial,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
