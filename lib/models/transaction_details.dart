import 'package:json_annotation/json_annotation.dart';
part 'transaction_details.g.dart';

@JsonSerializable()
class TransactionDetails {
  @JsonKey(name: '_id')
  String id;
  String method, who;
  double amount;
  bool isUser, isIncomming;

  TransactionDetails({
    required this.id,
    required this.method,
    required this.who,
    required this.isIncomming,
    required this.isUser,
    required this.amount,
  });
  factory TransactionDetails.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionDetailsToJson(this);
}


//  amount: { type: Number, required: true },
//   method: { type: String, required: true },
//   who: { type: String, required: true },
//   isUser: { type: Boolean, default: false },
//   isIncomming: { type: Boolean, default: false },