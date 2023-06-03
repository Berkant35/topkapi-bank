// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomTransaction _$CustomTransactionFromJson(Map<String, dynamic> json) {
  return _CustomTransaction.fromJson(json);
}

/// @nodoc
mixin _$CustomTransaction {
  @JsonKey(name: 'transactionId')
  String? get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'senderId')
  String? get senderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiverId')
  String? get receiverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionExplain')
  String? get transactionExplain => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  int? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'senderIban')
  String? get senderIban => throw _privateConstructorUsedError;
  @JsonKey(name: 'receiverIban')
  String? get receiverIban => throw _privateConstructorUsedError;
  @JsonKey(name: 'withQr')
  String? get withQr => throw _privateConstructorUsedError;
  @JsonKey(name: 'transactionDate')
  String? get transactionDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomTransactionCopyWith<CustomTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomTransactionCopyWith<$Res> {
  factory $CustomTransactionCopyWith(
          CustomTransaction value, $Res Function(CustomTransaction) then) =
      _$CustomTransactionCopyWithImpl<$Res, CustomTransaction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionId') String? transactionId,
      @JsonKey(name: 'senderId') String? senderId,
      @JsonKey(name: 'receiverId') String? receiverId,
      @JsonKey(name: 'transactionExplain') String? transactionExplain,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'senderIban') String? senderIban,
      @JsonKey(name: 'receiverIban') String? receiverIban,
      @JsonKey(name: 'withQr') String? withQr,
      @JsonKey(name: 'transactionDate') String? transactionDate});
}

/// @nodoc
class _$CustomTransactionCopyWithImpl<$Res, $Val extends CustomTransaction>
    implements $CustomTransactionCopyWith<$Res> {
  _$CustomTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? senderId = freezed,
    Object? receiverId = freezed,
    Object? transactionExplain = freezed,
    Object? amount = freezed,
    Object? senderIban = freezed,
    Object? receiverIban = freezed,
    Object? withQr = freezed,
    Object? transactionDate = freezed,
  }) {
    return _then(_value.copyWith(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: freezed == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionExplain: freezed == transactionExplain
          ? _value.transactionExplain
          : transactionExplain // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      senderIban: freezed == senderIban
          ? _value.senderIban
          : senderIban // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverIban: freezed == receiverIban
          ? _value.receiverIban
          : receiverIban // ignore: cast_nullable_to_non_nullable
              as String?,
      withQr: freezed == withQr
          ? _value.withQr
          : withQr // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomTransactionCopyWith<$Res>
    implements $CustomTransactionCopyWith<$Res> {
  factory _$$_CustomTransactionCopyWith(_$_CustomTransaction value,
          $Res Function(_$_CustomTransaction) then) =
      __$$_CustomTransactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transactionId') String? transactionId,
      @JsonKey(name: 'senderId') String? senderId,
      @JsonKey(name: 'receiverId') String? receiverId,
      @JsonKey(name: 'transactionExplain') String? transactionExplain,
      @JsonKey(name: 'amount') int? amount,
      @JsonKey(name: 'senderIban') String? senderIban,
      @JsonKey(name: 'receiverIban') String? receiverIban,
      @JsonKey(name: 'withQr') String? withQr,
      @JsonKey(name: 'transactionDate') String? transactionDate});
}

/// @nodoc
class __$$_CustomTransactionCopyWithImpl<$Res>
    extends _$CustomTransactionCopyWithImpl<$Res, _$_CustomTransaction>
    implements _$$_CustomTransactionCopyWith<$Res> {
  __$$_CustomTransactionCopyWithImpl(
      _$_CustomTransaction _value, $Res Function(_$_CustomTransaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = freezed,
    Object? senderId = freezed,
    Object? receiverId = freezed,
    Object? transactionExplain = freezed,
    Object? amount = freezed,
    Object? senderIban = freezed,
    Object? receiverIban = freezed,
    Object? withQr = freezed,
    Object? transactionDate = freezed,
  }) {
    return _then(_$_CustomTransaction(
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
      senderId: freezed == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: freezed == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionExplain: freezed == transactionExplain
          ? _value.transactionExplain
          : transactionExplain // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      senderIban: freezed == senderIban
          ? _value.senderIban
          : senderIban // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverIban: freezed == receiverIban
          ? _value.receiverIban
          : receiverIban // ignore: cast_nullable_to_non_nullable
              as String?,
      withQr: freezed == withQr
          ? _value.withQr
          : withQr // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionDate: freezed == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomTransaction
    with DiagnosticableTreeMixin
    implements _CustomTransaction {
  const _$_CustomTransaction(
      {@JsonKey(name: 'transactionId') this.transactionId,
      @JsonKey(name: 'senderId') this.senderId,
      @JsonKey(name: 'receiverId') this.receiverId,
      @JsonKey(name: 'transactionExplain') this.transactionExplain,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'senderIban') this.senderIban,
      @JsonKey(name: 'receiverIban') this.receiverIban,
      @JsonKey(name: 'withQr') this.withQr,
      @JsonKey(name: 'transactionDate') this.transactionDate});

  factory _$_CustomTransaction.fromJson(Map<String, dynamic> json) =>
      _$$_CustomTransactionFromJson(json);

  @override
  @JsonKey(name: 'transactionId')
  final String? transactionId;
  @override
  @JsonKey(name: 'senderId')
  final String? senderId;
  @override
  @JsonKey(name: 'receiverId')
  final String? receiverId;
  @override
  @JsonKey(name: 'transactionExplain')
  final String? transactionExplain;
  @override
  @JsonKey(name: 'amount')
  final int? amount;
  @override
  @JsonKey(name: 'senderIban')
  final String? senderIban;
  @override
  @JsonKey(name: 'receiverIban')
  final String? receiverIban;
  @override
  @JsonKey(name: 'withQr')
  final String? withQr;
  @override
  @JsonKey(name: 'transactionDate')
  final String? transactionDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomTransaction(transactionId: $transactionId, senderId: $senderId, receiverId: $receiverId, transactionExplain: $transactionExplain, amount: $amount, senderIban: $senderIban, receiverIban: $receiverIban, withQr: $withQr, transactionDate: $transactionDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomTransaction'))
      ..add(DiagnosticsProperty('transactionId', transactionId))
      ..add(DiagnosticsProperty('senderId', senderId))
      ..add(DiagnosticsProperty('receiverId', receiverId))
      ..add(DiagnosticsProperty('transactionExplain', transactionExplain))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('senderIban', senderIban))
      ..add(DiagnosticsProperty('receiverIban', receiverIban))
      ..add(DiagnosticsProperty('withQr', withQr))
      ..add(DiagnosticsProperty('transactionDate', transactionDate));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomTransaction &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.transactionExplain, transactionExplain) ||
                other.transactionExplain == transactionExplain) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.senderIban, senderIban) ||
                other.senderIban == senderIban) &&
            (identical(other.receiverIban, receiverIban) ||
                other.receiverIban == receiverIban) &&
            (identical(other.withQr, withQr) || other.withQr == withQr) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionId,
      senderId,
      receiverId,
      transactionExplain,
      amount,
      senderIban,
      receiverIban,
      withQr,
      transactionDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomTransactionCopyWith<_$_CustomTransaction> get copyWith =>
      __$$_CustomTransactionCopyWithImpl<_$_CustomTransaction>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomTransactionToJson(
      this,
    );
  }
}

abstract class _CustomTransaction implements CustomTransaction {
  const factory _CustomTransaction(
          {@JsonKey(name: 'transactionId') final String? transactionId,
          @JsonKey(name: 'senderId') final String? senderId,
          @JsonKey(name: 'receiverId') final String? receiverId,
          @JsonKey(name: 'transactionExplain') final String? transactionExplain,
          @JsonKey(name: 'amount') final int? amount,
          @JsonKey(name: 'senderIban') final String? senderIban,
          @JsonKey(name: 'receiverIban') final String? receiverIban,
          @JsonKey(name: 'withQr') final String? withQr,
          @JsonKey(name: 'transactionDate') final String? transactionDate}) =
      _$_CustomTransaction;

  factory _CustomTransaction.fromJson(Map<String, dynamic> json) =
      _$_CustomTransaction.fromJson;

  @override
  @JsonKey(name: 'transactionId')
  String? get transactionId;
  @override
  @JsonKey(name: 'senderId')
  String? get senderId;
  @override
  @JsonKey(name: 'receiverId')
  String? get receiverId;
  @override
  @JsonKey(name: 'transactionExplain')
  String? get transactionExplain;
  @override
  @JsonKey(name: 'amount')
  int? get amount;
  @override
  @JsonKey(name: 'senderIban')
  String? get senderIban;
  @override
  @JsonKey(name: 'receiverIban')
  String? get receiverIban;
  @override
  @JsonKey(name: 'withQr')
  String? get withQr;
  @override
  @JsonKey(name: 'transactionDate')
  String? get transactionDate;
  @override
  @JsonKey(ignore: true)
  _$$_CustomTransactionCopyWith<_$_CustomTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}
