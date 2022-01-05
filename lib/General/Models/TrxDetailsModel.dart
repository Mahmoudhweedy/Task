import 'package:json_annotation/json_annotation.dart';
part 'TrxDetailsModel.g.dart';

@JsonSerializable(includeIfNull: true)
class TrxDetails {
  String? phoneNumber;
  String? memo;
  String? appliedCharge;
  String? appliedVat;
  String? totalAmount;
  String? pOSID;

  TrxDetails(
      {this.phoneNumber,
      this.memo,
      this.appliedCharge,
      this.appliedVat,
      this.totalAmount,
      this.pOSID});
  factory TrxDetails.fromJson(Map<String, dynamic> json) =>
      _$TrxDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$TrxDetailsToJson(this);
}
