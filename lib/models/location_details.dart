import 'package:json_annotation/json_annotation.dart';
part 'location_details.g.dart';

@JsonSerializable()
class LocationDetails {
  @JsonKey(name: '_id')
  String id;
  String name, timestamp;

  LocationDetails({
    required this.id,
    required this.name,
    required this.timestamp,
  });
  factory LocationDetails.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationDetailsToJson(this);
}
