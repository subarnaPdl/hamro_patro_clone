import 'package:intl/intl.dart';
import 'package:nepali_utils/nepali_utils.dart';

final npNow = NepaliDateTime.parse(NepaliDateTime.now().toIso8601String());

// Current time
late final time = NepaliDateFormat("h : mm aa").format(npNow);

// Today day, date
late final npToday = NepaliDateFormat("EEE, d MMMM, y").format(npNow);

// Next day
nextNpDate({int days = 0}) => NepaliDateFormat("MMMM d")
    .format(NepaliDateTime(npNow.year, npNow.month, npNow.day + days));

// Todays event
late final event =
    NepaliDateFormat("MMMM", Language.nepali).format(npNow) + " कृष्ण अष्टमी";

final engNow = DateTime.now();
// Today english date
late final engDateToday = DateFormat("MMM d, y").format(engNow);

// Next english date
nextEngDate({int days = 0}) => DateFormat("d MMM y")
    .format(DateTime(engNow.year, engNow.month, engNow.day + days));
