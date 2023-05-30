// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentModel _$$_PaymentModelFromJson(Map<String, dynamic> json) =>
    _$_PaymentModel(
      paymentId: json['paymentId'] as String?,
      payerId: json['payerId'] as String?,
      amount: json['amount'] as int?,
      typeOfPayment: json['typeOfPayment'] as String?,
      receiverId: json['receiverId'] as String?,
      receiverName: json['receiverName'] as String?,
      paymentDate: json['paymentDate'] as String?,
    );

Map<String, dynamic> _$$_PaymentModelToJson(_$_PaymentModel instance) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
      'payerId': instance.payerId,
      'amount': instance.amount,
      'typeOfPayment': instance.typeOfPayment,
      'receiverId': instance.receiverId,
      'receiverName': instance.receiverName,
      'paymentDate': instance.paymentDate,
    };
