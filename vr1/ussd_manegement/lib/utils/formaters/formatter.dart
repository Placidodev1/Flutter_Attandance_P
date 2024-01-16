import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static formatCurrancy(double amount) {
    return NumberFormat.currency(locale: 'en_Us', symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 9) {
      return '(${phoneNumber.substring(0, 2)}) ${phoneNumber.substring(2, 6)} ${phoneNumber.substring(6, 9)}';
    }
    return phoneNumber;
  }

  

}
