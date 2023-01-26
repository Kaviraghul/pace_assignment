import 'package:intl/intl.dart';

String dateConvertor(String responseDate) {
  DateTime date = DateTime.parse(responseDate);
  String formattedDate = DateFormat('yyyy-MM-dd').format(date);
  return formattedDate; // "2023-01-25"
}
