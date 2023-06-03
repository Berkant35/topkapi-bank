import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'custom_transaction.freezed.dart';
part 'custom_transaction.g.dart';

@freezed
class CustomTransaction with _$CustomTransaction {
  const factory CustomTransaction({
    @JsonKey(name: 'transactionId') String? transactionId,
    @JsonKey(name: 'senderId') String? senderId,
    @JsonKey(name: 'receiverId') String? receiverId,
    @JsonKey(name: 'transactionExplain') String? transactionExplain,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'senderIban') String? senderIban,
    @JsonKey(name: 'receiverIban') String? receiverIban,
    @JsonKey(name: 'withQr') String? withQr,
    @JsonKey(name: 'transactionDate') String? transactionDate,
  }) = _CustomTransaction;

  factory CustomTransaction.fromJson(Map<String, Object?> json) =>
      _$CustomTransactionFromJson(json);
}
