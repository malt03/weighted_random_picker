import 'dart:collection';

class RepeatIterable<E> with IterableMixin<E> {
  final E _value;
  final int _repeat;

  RepeatIterable(this._value, this._repeat);

  @override
  Iterator<E> get iterator => _Iterator(_value, _repeat);
}

class _Iterator<E> implements Iterator<E> {
  final E _value;
  int _remaining;

  _Iterator(this._value, this._remaining);

  @override
  get current => _value;

  @override
  bool moveNext() => _remaining-- > 0;
}
