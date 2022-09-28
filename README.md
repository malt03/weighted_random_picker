[![Pub](https://img.shields.io/pub/v/weighted_random_picker.svg)](https://pub.dev/packages/weighted_random_picker)
[![build](https://github.com/malt03/weighted_random_picker/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/malt03/weighted_random_picker/actions/workflows/build-and-test.yml)
[![codecov](https://codecov.io/gh/malt03/weighted_random_picker/branch/main/graph/badge.svg?token=ALK9UYEQPS)](https://codecov.io/gh/malt03/weighted_random_picker)
[![license](https://img.shields.io/github/license/malt03/weighted_random_picker.svg?style=flat)](https://github.com/malt03/weighted_random_picker/blob/main/LICENSE)

The elements of the array given to the constructor can be randomly picked with weights according to the probabilityWeight property of each element.

## Computational Complexity
|Function   |Complexity|
|:----------|:---------|
|constructor|O(N)      |
|update     |O(log N)  |
|pick       |O(log N)  |

## Usage

```dart
final picker = WeightedRandomPicker(entities);

print(picker.pick().id);

picker.elements.probabilityWeight = 10;
picker.update(2);

print(picker.pick().id);
```

## Performance Test
```
Class Creating
10000x100: 0:00:00.314480
20000x100: 0:00:00.703230
30000x100: 0:00:00.737919
40000x100: 0:00:01.534356
50000x100: 0:00:01.566525
60000x100: 0:00:01.627591
70000x100: 0:00:03.316556
80000x100: 0:00:03.690221
90000x100: 0:00:03.526130

Picking
1000000x100: 0:00:00.000839
2000000x100: 0:00:00.079502
3000000x100: 0:00:00.000440
4000000x100: 0:00:00.000629
5000000x100: 0:00:00.000357
6000000x100: 0:00:00.000454
7000000x100: 0:00:00.000348
8000000x100: 0:00:00.000787
9000000x100: 0:00:00.000528

Updating
1000000x100: 0:00:00.000371
2000000x100: 0:00:00.000089
3000000x100: 0:00:00.000101
4000000x100: 0:00:00.000030
5000000x100: 0:00:00.000036
6000000x100: 0:00:00.000063
7000000x100: 0:00:00.000032
8000000x100: 0:00:00.000029
9000000x100: 0:00:00.000031
```

## Reference
- https://qiita.com/kaityo256/items/64c12bb8c8946d7f03c6