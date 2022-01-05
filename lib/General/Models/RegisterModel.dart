import 'package:json_annotation/json_annotation.dart';
part 'RegisterModel.g.dart';

@JsonSerializable()
class RegisterModel {
  String? fullName;
  String? email;
  String? password;
  List<String>? roles;
  RegisterModel({this.email, this.fullName, this.password, this.roles});
  factory RegisterModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
