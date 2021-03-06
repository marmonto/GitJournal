import 'package:test/test.dart';

import 'package:gitjournal/utils/datetime.dart';

void main() {
  group('DateTime Utils', () {
    test('Test random date', () {
      var dateTime = DateTime.utc(2011, 12, 23, 10, 15, 30);
      var str = toIso8601WithTimezone(dateTime);

      expect(str, "2011-12-23T10:15:30+00:00");
    });

    test('Test with small date', () {
      var dateTime = DateTime.utc(2011, 6, 6, 5, 5, 3);
      var str = toIso8601WithTimezone(dateTime);

      expect(str, "2011-06-06T05:05:03+00:00");
    });

    test('Test with positive offset', () {
      var dateTime = DateTime.utc(2011, 6, 6, 5, 5, 3);
      var str = toIso8601WithTimezone(dateTime, const Duration(hours: 2));

      expect(str, "2011-06-06T05:05:03+02:00");
    });

    test('Test with positive offset and minutes', () {
      var dateTime = DateTime.utc(2011, 6, 6, 5, 5, 3);
      var str = toIso8601WithTimezone(dateTime, const Duration(hours: 10));

      expect(str, "2011-06-06T05:05:03+10:00");
    });

    test('Test with negative offset', () {
      var dateTime = DateTime.utc(2011, 6, 6, 5, 5, 3);
      var str = toIso8601WithTimezone(dateTime, const Duration(hours: -5));

      expect(str, "2011-06-06T05:05:03-05:00");
    });

    test('Test with negative offset and minutes', () {
      var dateTime = DateTime.utc(2011, 6, 6, 5, 5, 3);
      var str = toIso8601WithTimezone(
          dateTime, const Duration(hours: -11, minutes: -30));

      expect(str, "2011-06-06T05:05:03-11:30");
    });
  });
}
