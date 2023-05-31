

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'credit_card.freezed.dart';
part 'credit_card.g.dart';

@freezed
class CreditCard with _$CreditCard {
  const factory CreditCard({
    @JsonKey(name: 'creditCardId') String? creditCardId,
    @JsonKey(name: 'creditCardHolderName') String? creditCardHolderName,
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'cardNumber') String? cardNumber,
    @JsonKey(name: 'amount') double? amount,
    @JsonKey(name: 'csv') String? csv,
    @JsonKey(name: 'validateDate') String? validateDate,
    @JsonKey(name: 'createdAt') String? createdAt,
  }) = _CreditCard;

  factory CreditCard.fromJson(Map<String, Object?> json) =>
      _$CreditCardFromJson(json);
}
