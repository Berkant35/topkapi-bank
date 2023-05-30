import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'payment_model.freezed.dart';
part 'payment_model.g.dart';

@freezed
class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    @JsonKey(name: 'paymentId') String? paymentId,
    @JsonKey(name: 'payerId') String? payerId,
    @JsonKey(name: 'amount') int? amount,
    @JsonKey(name: 'typeOfPayment') String? typeOfPayment,
    @JsonKey(name: 'receiverId') String? receiverId,
    @JsonKey(name: 'receiverName') String? receiverName,
    @JsonKey(name: 'paymentDate') String? paymentDate,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, Object?> json) =>
      _$PaymentModelFromJson(json);
}
