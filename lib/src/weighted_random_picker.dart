import 'dart:math';

import 'tuple.dart';
import 'binary_tree_node.dart';
import 'int.dart';
import 'iterables/iterables.dart';

abstract class WeightedRandomPickable {
  double get probabilityWeight;
}

Iterable<BinaryTreeNode<double>> _createAboveNodes(Iterable<BinaryTreeNode<double>> nodes) =>
    Tuple2Iterable(nodes).map((tuple) {
      final parent = BinaryTreeNode(null, tuple.a, tuple.b, -1, tuple.a.value + tuple.b.value);
      tuple.a.parent = parent;
      tuple.b.parent = parent;
      return parent;
    });

Iterable<BinaryTreeNode<double>> _createBinaryTreeRecursive(Iterable<BinaryTreeNode<double>> nodes) {
  if (nodes.take(2).length == 1) return nodes;
  return _createBinaryTreeRecursive(_createAboveNodes(nodes));
}

Tuple2<BinaryTreeNode<double>, List<BinaryTreeNode<double>>> _createBinaryTree(List<WeightedRandomPickable> list) {
  final length = list.length;
  final depth = countLengthNotZeros(length);

  final bottomNodes = list
      .asMap()
      .entries
      .map((entry) => BinaryTreeNode(null, null, null, entry.key, entry.value.probabilityWeight))
      .followedBy(RepeatIterable(BinaryTreeNode<double>(null, null, null, 0, 0), (1 << depth) - length))
      .toList();

  final root = _createBinaryTreeRecursive(bottomNodes);
  return Tuple2(root.first, bottomNodes);
}

final random = Random();

BinaryTreeNode<double> _pickRecursive(BinaryTreeNode<double> node) {
  final left = node.left;
  final right = node.right;
  if (left == null || right == null) return node;
  final value = random.nextDouble() * (left.value + right.value);

  return _pickRecursive(value < left.value ? left : right);
}

void _updateRecursive(BinaryTreeNode<double> node) {
  node.value = node.left!.value + node.right!.value;

  final parent = node.parent;
  if (parent == null) return;

  _updateRecursive(parent);
}

/// The elements of the array given to the constructor can be randomly picked with weights according to the probabilityWeight
/// property of each element.
class WeightedRandomPicker<E extends WeightedRandomPickable> {
  final BinaryTreeNode<double> _root;
  final List<BinaryTreeNode<double>> _bottomNodes;
  final List<E> _elements;

  /// A reference to the array passed to the constructor.
  List<E> get elements => _elements;

  WeightedRandomPicker._(this._elements, Tuple2<BinaryTreeNode<double>, List<BinaryTreeNode<double>>> tuple)
      : _root = tuple.a,
        _bottomNodes = tuple.b;

  /// The computational complexity is O(N).
  WeightedRandomPicker(List<E> list) : this._(list, _createBinaryTree(list));

  /// After changing the probabilityWeight of an element of an array passed to the constructor, the index of that element is
  /// passed to this function to update the weight.
  /// The computational complexity is O(log N).
  /// ```
  /// final picker = WeightedRandomPicker(entities);
  /// picker.elements[2] = Entity(10);
  /// // The original array can be changed.
  /// // It can be changed in any way as long as the obtained value of probabilityWeight is changed.
  /// entities[3].probabilityWeight = 20;
  /// picker.update(2);
  /// picker.update(3);
  /// ```
  void update(int index) {
    _bottomNodes[index].value = _elements[index].probabilityWeight;
    final parent = _bottomNodes[index].parent;
    if (parent == null) return;
    _updateRecursive(parent);
  }

  /// Random weighted pick.
  /// The computational complexity is O(log N).
  E pick() => _elements[_pickRecursive(_root).index];
}
