class Quicksort {
  // comparator(a, b) returns -1 if a < b, 0 if a==b, else 1
  static void qsort(List l, comparator) {
    _qsort(l, 0, l.length-1, comparator);
  }
  
  static void _qsort(List li, int leftIndex, int rightIndex, Function comp) {
    
     int _partition(List l, int left, int right, Function cf) {
      int p = (left + (right - left) / 2).toInt();
      _swap(l, p, right);
      int cursor = left;
      for (int i = left; i < right; i++) {
        if (cf(l[i], l[right]) <= 0) {
          _swap(l, i, cursor);
          cursor++;
        }
      }
      _swap(l, cursor, right);
      return cursor;
    }
    
    if (leftIndex < rightIndex) {
      int p = _partition(li, leftIndex, rightIndex, comp);
      _qsort(li, leftIndex, p-1, comp);
      _qsort(li, p+1, rightIndex, comp);
    }
  }
  
  static void _swap(List l, int one, int two) {
    var o = l[one];
    l[one] = l[two];
    l[two] = o;
  }
  
}
