import 'package:weighted_random_picker/weighted_random_picker.dart';

class Entity implements WeightedRandomPickable {
  final String id;
  @override
  final double probabilityWeight;
  const Entity(this.id, this.probabilityWeight);
}

void main() {
  final List<Entity> entities = [
    const Entity('a', 1.1),
    const Entity('b', 1.1),
    const Entity('c', 0.9),
    const Entity('d', 0.3),
    const Entity('e', 0.1),
  ];

  final picker = WeightedRandomPicker(entities);

  print(picker.pick().id);

  entities[2] = Entity('c', 0.5);
  picker.update(2);

  print(picker.pick().id);
}
