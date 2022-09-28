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