// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrxDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrxDetails _$TrxDetailsFromJson(Map<String, dynamic> json) {
  return TrxDetails(
    phoneNumber: json['phoneNumber'] as String?,
    memo: json['memo'] as String?,
    appliedCharge: json['appliedCharge'] as String?,
    appliedVat: json['appliedVat'] as String?,
    totalAmount: json['totalAmount'] as String?,
    pOSID: json['pOSID'] as String?,
  );
}

Map<String, dynamic> _$TrxDetailsToJson(TrxDetails instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'memo': instance.memo,
      'appliedCharge': instance.appliedCharge,
      'appliedVat': instance.appliedVat,
      'totalAmount': instance.totalAmount,
      'pOSID': instance.pOSID,
    };
