import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_response.g.dart';
@JsonSerializable()
class SignUpResponse {
  final String message;
  final Data data;
  final bool status;
  final int code;

  SignUpResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code});

  factory SignUpResponse.fromJson(Map<String , dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class Data {
  final String token;
  @JsonKey(name: 'username')
  final String userName;

  Data({required this.token, required this.userName});

  factory Data.fromJson(Map<String , dynamic> json) =>
      _$DataFromJson(json);
}