// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return PaymentModel(
    id: json['id'] as int?,
    trxRef: json['trxRef'] as String?,
    fromEntityId: json['fromEntityId'] as int?,
    toEntityId: json['toEntityId'] as int?,
    amount: (json['amount'] as num?)?.toDouble(),
    trxDate: json['trxDate'] as String?,
    mobileNumber: json['mobileNumber'] as String?,
    fullNameAR: json['fullNameAR'] as String?,
    fullNameEN: json['fullNameEN'] as String?,
    corporateFullNameAR: json['corporateFullNameAR'] as String?,
    corporateFullNameEN: json['corporateFullNameEN'] as String?,
    trxDetails: json['trxDetails'] == null
        ? null
        : TrxDetails.fromJson(json['trxDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'trxRef': instance.trxRef,
      'fromEntityId': instance.fromEntityId,
      'toEntityId': instance.toEntityId,
      'amount': instance.amount,
      'trxDate': instance.trxDate,
      'mobileNumber': instance.mobileNumber,
      'fullNameAR': instance.fullNameAR,
      'fullNameEN': instance.fullNameEN,
      'corporateFullNameAR': instance.corporateFullNameAR,
      'corporateFullNameEN': instance.corporateFullNameEN,
      'trxDetails': instance.trxDetails?.toJson(),
    };
