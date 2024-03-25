import 'package:flutter_sms/flutter_sms.dart';


class SMSModule {

  Future<String> sendsSMS({required String message, required List<String> recipients, required bool sendDirect}) async {
    try {
      String _result = await sendSMS(
        message: message,
        recipients: recipients,
        sendDirect: sendDirect,
      );
      return _result;
    } catch (error) {
      return "Error while sending sms";
    }
  }

}
