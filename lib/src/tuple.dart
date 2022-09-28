class Tuple2<T1, T2> {
  final T1 a;
  final T2 b;

  const Tuple2(this.a, this.b);

  @override
  operator ==(Object other) {
    return other is Tuple2<T1, T2> && a == other.a && b == other.b;
  }

  @override
  get hashCode => Object.hash(a, b);

  @override
  toString() => '($a, $b)';
}
