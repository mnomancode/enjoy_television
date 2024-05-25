import 'package:enjoy_television/api/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_check.g.dart';

class PaymentStatus {
  final String status;
  final String message;
  bool? paymentDone;

  PaymentStatus(
      {required this.status, required this.message, this.paymentDone = true});
}

@Riverpod()
class PaymentStatusNotifier extends _$PaymentStatusNotifier {
  @override
  Future<PaymentStatus> build() {
    return _getPaymentStatus();
  }

  Future<PaymentStatus> _getPaymentStatus() async {
    DioClient dioClient = DioClient();
    var response = await dioClient.getPaymentStatus();

    return response;
  }
}
