import 'package:weighted_random_picker/weighted_random_picker.dart';
import 'package:test/test.dart';

class _Entity implements WeightedRandomPickable {
  final String id;
  @override
  final double probabilityWeight;
  const _Entity(this.id, this.probabilityWeight);
}

final x = 3.1; // Arbitrary values to clutter the test values.
List<_Entity> _createEntities() => [
      _Entity('a', 0.20 * x),
      _Entity('b', 0.05 * x),
      _Entity('c', 0.01 * x),
      _Entity('d', 0.00 * x),
      _Entity('e', 0.01 * x),
      _Entity('f', 0.15 * x),
      _Entity('g', 0.40 * x),
      _Entity('h', 0.08 * x),
      _Entity('i', 0.10 * x),
    ];

final n = 262144;

/// The result of this test will be a binomial distribution, and if the probability p and the number of trials n are
/// sufficiently large, the binomial distribution can approximate a normal distribution.
/// The variance of the binomial distribution is np(1-p), which reaches its maximum when p is 0.5, which is n/4.
/// This means that after 262,144 trials, the maximum value of variance is 65,536 and the standard deviation is 256, giving a
/// minimum probability of 99.73% of falling within ±768.
Matcher _rangeMatcher(double probability) {
  final e = probability * n;
  return inInclusiveRange(e - 768, e + 768);
}

void main() {
  test('random pick', () {
    final entities = _createEntities();
    final picker = WeightedRandomPicker(entities);

    final pickedIdCount = <String, int>{};
    for (var i = 0; i < n; i++) {
      final picked = picker.pick();
      pickedIdCount[picked.id] = (pickedIdCount[picked.id] ?? 0) + 1;
    }

    // Do not test values that are not large enough.
    expect(pickedIdCount['a'], _rangeMatcher(0.20));
    expect(pickedIdCount['d'], null);
    expect(pickedIdCount['f'], _rangeMatcher(0.15));
    expect(pickedIdCount['g'], _rangeMatcher(0.40));
    expect(pickedIdCount['h'], _rangeMatcher(0.08));
    expect(pickedIdCount['i'], _rangeMatcher(0.10));
  });

  test('update', () {
    final picker = WeightedRandomPicker(_createEntities());

    picker.elements[1] = _Entity('b', 0);
    picker.elements[5] = _Entity('f', 0);
    picker.elements[6] = _Entity('g', 0.6 * x);
    picker.update(1);
    picker.update(5);
    picker.update(6);

    final pickedIdCount = <String, int>{};
    for (var i = 0; i < n; i++) {
      final picked = picker.pick();
      pickedIdCount[picked.id] = (pickedIdCount[picked.id] ?? 0) + 1;
    }

    // Do not test values that are not large enough.
    expect(pickedIdCount['a'], _rangeMatcher(0.20));
    expect(pickedIdCount['b'], null);
    expect(pickedIdCount['d'], null);
    expect(pickedIdCount['f'], null);
    expect(pickedIdCount['g'], _rangeMatcher(0.60));
    expect(pickedIdCount['h'], _rangeMatcher(0.08));
    expect(pickedIdCount['i'], _rangeMatcher(0.10));
  });
}
