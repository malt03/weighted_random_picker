import '../tuple.dart';

class Tuple2Iterable<E> extends Iterable<Tuple2<E, E>> {
  final Iterable<E> _iterable;

  Tuple2Iterable(this._iterable);

  @override
  get iterator => _Iterator(_iterable.iterator);
}

class _Iterator<E> extends Iterator<Tuple2<E, E>> {
  final Iterator<E> _iterator;
  Tuple2<E, E>? _current;

  _Iterator(this._iterator);

  @override
  get current => _current!;

  @override
  bool moveNext() {
    if (!_iterator.moveNext()) return false;
    final a = _iterator.current;
    if (!_iterator.moveNext()) return false;
    final b = _iterator.current;

    _current = Tuple2(a, b);
    return true;
  }
}
