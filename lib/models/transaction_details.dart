import 'package:json_annotation/json_annotation.dart';
part 'transaction_details.g.dart';

@JsonSerializable()
class transactionDetails {
  @JsonKey(name: '_id')
  String id;
  String method, who;
  double amount;
  bool isUser, isIncomming;

  transactionDetails({
    required this.id,
    required this.method,
    required this.who,
    required this.isIncomming,
    required this.isUser,
    required this.amount,
  });
  factory transactionDetails.fromJson(Map<String, dynamic> json) =>
      _$transactionDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$transactionDetailsToJson(this);
}


//  amount: { type: Number, required: true },
//   method: { type: String, required: true },
//   who: { type: String, required: true },
//   isUser: { type: Boolean, default: false },
//   isIncomming: { type: Boolean, default: false },