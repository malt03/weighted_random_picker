import 'package:weighted_random_picker/src/iterables/repeat_iterable.dart';
import 'package:test/test.dart';

void main() {
  test('RepeatIterable', () {
    expect(RepeatIterable('a', 5).join(), 'aaaaa');
    expect(RepeatIterable(1, 100).reduce((a, b) => a + b), 100);
    expect(RepeatIterable(1, 0).toList(), []);
  });
}
