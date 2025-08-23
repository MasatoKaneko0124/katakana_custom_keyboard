extension IterableExt<T> on Iterable<T> {
  /// インデックスと要素を同時に扱うための拡張メソッド
  Iterable<E> mapWithIndex<E>(E Function(T element, int index) toElement) {
    int index = 0;
    return map((T element) {
      final result = toElement(element, index);
      index++;
      return result;
    });
  }
}
