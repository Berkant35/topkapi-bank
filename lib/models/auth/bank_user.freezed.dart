// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankUser _$BankUserFromJson(Map<String, dynamic> json) {
  return _BankUser.fromJson(json);
}

/// @nodoc
mixin _$BankUser {
  @JsonKey(name: 'userId')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get userName => throw _privateConstructorUsedError;
  @JsonKey(name: 'surName')
  String? get surName => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  bool? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'iban')
  String? get iban => throw _privateConstructorUsedError;
  @JsonKey(name: 'pushToken')
  String? get pushToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'bankAccountNumber')
  String? get bankAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'qrLink')
  String? get qrLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance', defaultValue: 0.0)
  double? get balance => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updatedAt')
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankUserCopyWith<BankUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankUserCopyWith<$Res> {
  factory $BankUserCopyWith(BankUser value, $Res Function(BankUser) then) =
      _$BankUserCopyWithImpl<$Res, BankUser>;
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') String? userId,
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
      @JsonKey(name: 'updatedAt') String? updatedAt});
}

/// @nodoc
class _$BankUserCopyWithImpl<$Res, $Val extends BankUser>
    implements $BankUserCopyWith<$Res> {
  _$BankUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? email = freezed,
    Object? userName = freezed,
    Object? surName = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? iban = freezed,
    Object? pushToken = freezed,
    Object? bankAccountNumber = freezed,
    Object? qrLink = freezed,
    Object? balance = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      surName: freezed == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool?,
      iban: freezed == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String?,
      pushToken: freezed == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      qrLink: freezed == qrLink
          ? _value.qrLink
          : qrLink // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankUserCopyWith<$Res> implements $BankUserCopyWith<$Res> {
  factory _$$_BankUserCopyWith(
          _$_BankUser value, $Res Function(_$_BankUser) then) =
      __$$_BankUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userId') String? userId,
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
      @JsonKey(name: 'updatedAt') String? updatedAt});
}

/// @nodoc
class __$$_BankUserCopyWithImpl<$Res>
    extends _$BankUserCopyWithImpl<$Res, _$_BankUser>
    implements _$$_BankUserCopyWith<$Res> {
  __$$_BankUserCopyWithImpl(
      _$_BankUser _value, $Res Function(_$_BankUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? email = freezed,
    Object? userName = freezed,
    Object? surName = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? iban = freezed,
    Object? pushToken = freezed,
    Object? bankAccountNumber = freezed,
    Object? qrLink = freezed,
    Object? balance = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_BankUser(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      surName: freezed == surName
          ? _value.surName
          : surName // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as bool?,
      iban: freezed == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String?,
      pushToken: freezed == pushToken
          ? _value.pushToken
          : pushToken // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      qrLink: freezed == qrLink
          ? _value.qrLink
          : qrLink // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankUser with DiagnosticableTreeMixin implements _BankUser {
  const _$_BankUser(
      {@JsonKey(name: 'userId') this.userId,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'userName') this.userName,
      @JsonKey(name: 'surName') this.surName,
      @JsonKey(name: 'age') this.age,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'iban') this.iban,
      @JsonKey(name: 'pushToken') this.pushToken,
      @JsonKey(name: 'bankAccountNumber') this.bankAccountNumber,
      @JsonKey(name: 'qrLink') this.qrLink,
      @JsonKey(name: 'balance', defaultValue: 0.0) this.balance,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'updatedAt') this.updatedAt});

  factory _$_BankUser.fromJson(Map<String, dynamic> json) =>
      _$$_BankUserFromJson(json);

  @override
  @JsonKey(name: 'userId')
  final String? userId;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'userName')
  final String? userName;
  @override
  @JsonKey(name: 'surName')
  final String? surName;
  @override
  @JsonKey(name: 'age')
  final int? age;
  @override
  @JsonKey(name: 'gender')
  final bool? gender;
  @override
  @JsonKey(name: 'iban')
  final String? iban;
  @override
  @JsonKey(name: 'pushToken')
  final String? pushToken;
  @override
  @JsonKey(name: 'bankAccountNumber')
  final String? bankAccountNumber;
  @override
  @JsonKey(name: 'qrLink')
  final String? qrLink;
  @override
  @JsonKey(name: 'balance', defaultValue: 0.0)
  final double? balance;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BankUser(userId: $userId, email: $email, userName: $userName, surName: $surName, age: $age, gender: $gender, iban: $iban, pushToken: $pushToken, bankAccountNumber: $bankAccountNumber, qrLink: $qrLink, balance: $balance, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BankUser'))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('surName', surName))
      ..add(DiagnosticsProperty('age', age))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('iban', iban))
      ..add(DiagnosticsProperty('pushToken', pushToken))
      ..add(DiagnosticsProperty('bankAccountNumber', bankAccountNumber))
      ..add(DiagnosticsProperty('qrLink', qrLink))
      ..add(DiagnosticsProperty('balance', balance))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankUser &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.surName, surName) || other.surName == surName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.iban, iban) || other.iban == iban) &&
            (identical(other.pushToken, pushToken) ||
                other.pushToken == pushToken) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.qrLink, qrLink) || other.qrLink == qrLink) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      email,
      userName,
      surName,
      age,
      gender,
      iban,
      pushToken,
      bankAccountNumber,
      qrLink,
      balance,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankUserCopyWith<_$_BankUser> get copyWith =>
      __$$_BankUserCopyWithImpl<_$_BankUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankUserToJson(
      this,
    );
  }
}

abstract class _BankUser implements BankUser {
  const factory _BankUser(
      {@JsonKey(name: 'userId') final String? userId,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'userName') final String? userName,
      @JsonKey(name: 'surName') final String? surName,
      @JsonKey(name: 'age') final int? age,
      @JsonKey(name: 'gender') final bool? gender,
      @JsonKey(name: 'iban') final String? iban,
      @JsonKey(name: 'pushToken') final String? pushToken,
      @JsonKey(name: 'bankAccountNumber') final String? bankAccountNumber,
      @JsonKey(name: 'qrLink') final String? qrLink,
      @JsonKey(name: 'balance', defaultValue: 0.0) final double? balance,
      @JsonKey(name: 'createdAt') final String? createdAt,
      @JsonKey(name: 'updatedAt') final String? updatedAt}) = _$_BankUser;

  factory _BankUser.fromJson(Map<String, dynamic> json) = _$_BankUser.fromJson;

  @override
  @JsonKey(name: 'userId')
  String? get userId;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'userName')
  String? get userName;
  @override
  @JsonKey(name: 'surName')
  String? get surName;
  @override
  @JsonKey(name: 'age')
  int? get age;
  @override
  @JsonKey(name: 'gender')
  bool? get gender;
  @override
  @JsonKey(name: 'iban')
  String? get iban;
  @override
  @JsonKey(name: 'pushToken')
  String? get pushToken;
  @override
  @JsonKey(name: 'bankAccountNumber')
  String? get bankAccountNumber;
  @override
  @JsonKey(name: 'qrLink')
  String? get qrLink;
  @override
  @JsonKey(name: 'balance', defaultValue: 0.0)
  double? get balance;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'updatedAt')
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_BankUserCopyWith<_$_BankUser> get copyWith =>
      throw _privateConstructorUsedError;
}
