import 'package:setlistherofl/utils/date_utils.dart';
import 'package:test/test.dart';

void main() {
  test('End of day Test', () {
    var result = DateUtils.endOfCurrentDay();
    final todayEnd = DateTime.parse('2020-06-02 23:59:59');
    expect(result, todayEnd);
  });

  test('End of month Test', () {
    var result = DateUtils.endOfCurrentMonth();
    final todayEnd = DateTime.parse('2020-06-30 23:59:59');
    expect(result, todayEnd);
  });

  test('End of year Test', () {
    var result = DateUtils.endOfCurrentYear();
    final todayEnd = DateTime.parse('2020-12-31 23:59:59');
    expect(result, todayEnd);
  });
}