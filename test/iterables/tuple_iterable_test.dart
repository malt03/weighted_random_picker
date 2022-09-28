import 'package:weighted_random_picker/src/iterables/tuple_iterable.dart';
import 'package:weighted_random_picker/src/tuple.dart';
import 'package:test/test.dart';

void main() {
  test('Tuple2Iterable', () {
    final a = Tuple2Iterable([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);
    expect(a.toList(), [
      const Tuple2(0, 1),
      const Tuple2(2, 3),
      const Tuple2(4, 5),
      const Tuple2(6, 7),
      const Tuple2(8, 9),
    ]);

    final b = Tuple2Iterable([0]);
    expect(b.toList(), []);
  });
}
