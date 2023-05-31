// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditCard _$$_CreditCardFromJson(Map<String, dynamic> json) =>
    _$_CreditCard(
      creditCardId: json['creditCardId'] as String?,
      creditCardHolderName: json['creditCardHolderName'] as String?,
      userId: json['userId'] as String?,
      cardNumber: json['cardNumber'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      csv: json['csv'] as String?,
      validateDate: json['validateDate'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$_CreditCardToJson(_$_CreditCard instance) =>
    <String, dynamic>{
      'creditCardId': instance.creditCardId,
      'creditCardHolderName': instance.creditCardHolderName,
      'userId': instance.userId,
      'cardNumber': instance.cardNumber,
      'amount': instance.amount,
      'csv': instance.csv,
      'validateDate': instance.validateDate,
      'createdAt': instance.createdAt,
    };
