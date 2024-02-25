import 'package:json_annotation/json_annotation.dart';
part 'error_format.g.dart';

@JsonSerializable()
class ErrorFormat {
  String message;

  ErrorFormat({
    required this.message,
  });
  factory ErrorFormat.fromJson(Map<String, dynamic> json) =>
      _$ErrorFormatFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorFormatToJson(this);
}
