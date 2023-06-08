import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'bank_user.freezed.dart';
part 'bank_user.g.dart';

@freezed
class BankUser with _$BankUser {
  const factory BankUser({
    @JsonKey(name: 'userId') String? userId,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'userName') String? userName,
    @JsonKey(name: 'surName') String? surName,
    @JsonKey(name: 'age') int? age,
    @JsonKey(name: 'gender') bool? gender,
    @JsonKey(name: 'iban') String? iban,
    @JsonKey(name: 'pushToken') String? pushToken,
    @JsonKey(name: 'bankAccountNumber') String? bankAccountNumber,
    @JsonKey(name: 'qrLink') String? qrLink,
    @JsonKey(name: 'balance', defaultValue: 0.0) double? balance,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
  }) = _BankUser;

  factory BankUser.fromJson(Map<String, Object?> json) =>
      _$BankUserFromJson(json);
}
