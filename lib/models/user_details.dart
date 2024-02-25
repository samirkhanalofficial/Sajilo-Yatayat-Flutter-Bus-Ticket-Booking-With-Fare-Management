import 'package:json_annotation/json_annotation.dart';
part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  @JsonKey(name: '_id')
  String id;
  String name;
  String mobile;
  DateTime dob;
  String address;
  String gender;
  DateTime timestamp;

  UserDetails({
    required this.id,
    required this.name,
    required this.mobile,
    required this.dob,
    required this.address,
    required this.gender,
    required this.timestamp,
  });
  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}
