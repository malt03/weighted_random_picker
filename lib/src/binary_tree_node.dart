class BinaryTreeNode<T> {
  BinaryTreeNode<T>? parent;
  BinaryTreeNode<T>? left;
  BinaryTreeNode<T>? right;

  // 同一の深さの中で左から何番目にあるか
  int index;
  T value;

  BinaryTreeNode(this.parent, this.left, this.right, this.index, this.value);

  @override
  toString() => '{index:$index,value:$value}';
}
