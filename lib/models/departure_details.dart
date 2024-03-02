import 'package:json_annotation/json_annotation.dart';
import 'package:tryapp/models/bus_details.dart';
part 'departure_details.g.dart';

@JsonSerializable()
class DepartureDetails {
  @JsonKey(name: '_id')
  String id;
  String from, to, date, time, timestamp;
  double amount;
  BusDetails bus;
  DepartureDetails({
    required this.id,
    required this.from,
    required this.to,
    required this.date,
    required this.time,
    required this.timestamp,
    required this.amount,
    required this.bus,
  });

  factory DepartureDetails.fromJson(Map<String, dynamic> json) =>
      _$DepartureDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DepartureDetailsToJson(this);
}
