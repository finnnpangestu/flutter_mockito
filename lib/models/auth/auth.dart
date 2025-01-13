import 'package:flutter_mockito/models/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@Freezed(genericArgumentFactories: true)
class Auth with _$Auth {
  const factory Auth({
    String? accessToken,
    String? refreshToken,
    User? user,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
