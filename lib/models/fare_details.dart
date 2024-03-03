import 'package:json_annotation/json_annotation.dart';
import 'package:tryapp/models/bus_details.dart';
import 'package:tryapp/models/departure_details.dart';
import 'package:tryapp/models/user_details.dart';
part 'fare_details.g.dart';

@JsonSerializable()
class FareDetails {
  @JsonKey(name: '_id')
  String id;
  DepartureDetails departure;
  BusDetails bus;
  double amount;
  UserDetails faredBy;
  bool isFaredByUser;
  String status, timestamp;
  List<int> seats;

  FareDetails({
    required this.id,
    required this.departure,
    required this.faredBy,
    required this.isFaredByUser,
    required this.amount,
    required this.bus,
    required this.seats,
    required this.status,
    required this.timestamp,
  });

  factory FareDetails.fromJson(Map<String, dynamic> json) =>
      _$FareDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$FareDetailsToJson(this);
}
