import 'package:task/General/Models/PaymentModel.dart';
import 'package:task/General/Resources/DioHelper.dart';

class PaymentApi {
  List<PaymentModel> _payments = [];
  Future<List<PaymentModel>> _paymentMain(String url) async {
    var _data = await DioHelper().get(url);
    if (url.contains('Reports')) {
            List<Map<String, dynamic>> _json =
          List<Map<String, dynamic>>.from(_data['result']['dateSet']);
      _payments = _json.map((e) => PaymentModel.fromJson(e)).toList();
    } else {
      List<Map<String, dynamic>> _json =
          List<Map<String, dynamic>>.from(_data['dateSet']);
      _payments = _json.map((e) => PaymentModel.fromJson(e)).toList();
    }

    return _payments;
  }

  Future<List<PaymentModel>> getPayments() async {
    return _paymentMain('Payment/GetPayment');
  }

  Future<List<PaymentModel>> getFilterdPayments(
      String dateFrom, String dateTo, String mobile) async {
    return _paymentMain(
        'Reports/HalaPayments?FromDate=$dateFrom&ToDate=$dateTo&MobileNumber=$mobile');
  }
}
