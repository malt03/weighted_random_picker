import 'dart:math';

import 'package:weighted_random_picker/weighted_random_picker.dart';

class _Entity implements WeightedRandomPickable {
  @override
  final double probabilityWeight;
  const _Entity(this.probabilityWeight);
}

final _random = Random();
List<_Entity> _createEntities(int n) => [for (var i = 0; i < n; i++) _Entity(_random.nextDouble())];

void _testClassCreatingPerformance(int n) {
  final entities = _createEntities(n);

  final stopwatch = Stopwatch();
  stopwatch.start();
  for (var i = 0; i < 100; i++) {
    WeightedRandomPicker(entities);
  }
  stopwatch.stop();
  print('${n}x100: ${stopwatch.elapsed}');
}

void _testPickingPerformance(int n) {
  final picker = WeightedRandomPicker(_createEntities(n));

  final stopwatch = Stopwatch();
  stopwatch.start();
  for (var i = 0; i < 100; i++) {
    picker.pick();
  }
  stopwatch.stop();

  print('${n}x100: ${stopwatch.elapsed}');
}

void _testUpdatingPerformance(int n) {
  final picker = WeightedRandomPicker(_createEntities(n));

  final stopwatch = Stopwatch();
  stopwatch.start();
  for (var i = 0; i < 100; i++) {
    picker.update(100);
  }
  stopwatch.stop();

  print('${n}x100: ${stopwatch.elapsed}');
}

void main() {
  print('Class Creating');
  for (var i = 1; i < 10; i++) {
    _testClassCreatingPerformance(10000 * i);
  }

  print('');

  print('Picking');
  for (var i = 1; i < 10; i++) {
    _testPickingPerformance(1000000 * i);
  }

  print('');

  print('Updating');
  for (var i = 1; i < 10; i++) {
    _testUpdatingPerformance(1000000 * i);
  }
}
