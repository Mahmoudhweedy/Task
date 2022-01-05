import 'package:json_annotation/json_annotation.dart';
import 'package:task/General/Models/TrxDetailsModel.dart';
part 'PaymentModel.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentModel {
  int? id;
  String? trxRef;
  int? fromEntityId;
  int? toEntityId;
  double? amount;
  String? trxDate;
  String? mobileNumber;
  String? fullNameAR;
  String? fullNameEN;
  String? corporateFullNameAR;
  String? corporateFullNameEN;
  TrxDetails? trxDetails;
  bool isOpened = false;

  PaymentModel(
      {this.id,
      this.trxRef,
      this.fromEntityId,
      this.toEntityId,
      this.amount,
      this.trxDate,
      this.mobileNumber,
      this.fullNameAR,
      this.fullNameEN,
      this.corporateFullNameAR,
      this.corporateFullNameEN,
      this.isOpened = false,
      this.trxDetails});
  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
