import 'package:geolocator/geolocator.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class SMSService {
  final TwilioFlutter _twilioFlutter;
  static const String _defaultAccountSid = '';
  static const String _defaultAuthToken = '';
  static const String _defaultTwilioNumber = '';

  SMSService({
    String accountSid = _defaultAccountSid,
    String authToken = _defaultAuthToken,
    String twilioNumber = _defaultTwilioNumber,
  }) : _twilioFlutter = TwilioFlutter(
          accountSid: accountSid,
          authToken: authToken,
          twilioNumber: twilioNumber,
        );

  Future<void> sendAlarmSMS(
      List<String> phoneNumbers, Position? currentLocation) async {
    try {
      if (currentLocation != null) {
        double latitude = currentLocation.latitude;
        double longitude = currentLocation.longitude;

        String mapLink = 'https://www.google.com/maps?q=$latitude,$longitude';
        String messageBodyWithLocation =
            'Fire Alarm Set at \nLocation: $mapLink';

        for (String phoneNumber in phoneNumbers) {
          await _twilioFlutter.sendSMS(
            toNumber: phoneNumber,
            messageBody: messageBodyWithLocation,
          );
        }
      } else {
        for (String phoneNumber in phoneNumbers) {
          await _twilioFlutter.sendSMS(
            toNumber: phoneNumber,
            messageBody: 'Fire Alarm Set',
          );
        }
      }
    } catch (e) {
      print('Error sending SMS: $e');
    }
  }
}
