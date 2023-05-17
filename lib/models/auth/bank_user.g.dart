// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankUser _$$_BankUserFromJson(Map<String, dynamic> json) => _$_BankUser(
      userId: json['userId'] as String?,
      email: json['email'] as String?,
      userName: json['userName'] as String?,
      surName: json['surName'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as bool?,
      iban: json['iban'] as String?,
      pushToken: json['pushToken'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      qrLink: json['qrLink'] as String?,
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$_BankUserToJson(_$_BankUser instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'userName': instance.userName,
      'surName': instance.surName,
      'age': instance.age,
      'gender': instance.gender,
      'iban': instance.iban,
      'pushToken': instance.pushToken,
      'bankAccountNumber': instance.bankAccountNumber,
      'qrLink': instance.qrLink,
      'balance': instance.balance,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
