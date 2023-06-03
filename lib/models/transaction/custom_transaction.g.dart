// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomTransaction _$$_CustomTransactionFromJson(Map<String, dynamic> json) =>
    _$_CustomTransaction(
      transactionId: json['transactionId'] as String?,
      senderId: json['senderId'] as String?,
      receiverId: json['receiverId'] as String?,
      transactionExplain: json['transactionExplain'] as String?,
      amount: json['amount'] as int?,
      senderIban: json['senderIban'] as String?,
      receiverIban: json['receiverIban'] as String?,
      withQr: json['withQr'] as String?,
      transactionDate: json['transactionDate'] as String?,
    );

Map<String, dynamic> _$$_CustomTransactionToJson(
        _$_CustomTransaction instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'transactionExplain': instance.transactionExplain,
      'amount': instance.amount,
      'senderIban': instance.senderIban,
      'receiverIban': instance.receiverIban,
      'withQr': instance.withQr,
      'transactionDate': instance.transactionDate,
    };
