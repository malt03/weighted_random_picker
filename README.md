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

## Reference
- https://qiita.com/kaityo256/items/64c12bb8c8946d7f03c6