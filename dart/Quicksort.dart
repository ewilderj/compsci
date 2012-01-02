class Quicksort {
  // comparator(a, b) returns -1 if a < b, 0 if a==b, else 1
  static void qsort(List l, comparator) {
    _qsort(l, 0, l.length-1, comparator);
  }
  
  // pretty naive quicksort algorithm
  static void _qsort(List li, int leftIndex, int rightIndex, Function comp) {
    
    int _partition(List l, int left, int right, Function cf) {
      // pick a pivot value: the middle. other schemes use
      // median of l[left], l[right] and l[middle]
      int p = (left + (right - left) / 2).toInt();
      
      // move the pivot value to the far right
      _swap(l, p, right);
      
      // the cursor is where we'll move values <= l[p] to:
      // it starts on the left hand side
      int cursor = left;
      
      // for every value
      for (int i = left; i < right; i++) {
        // if it's less than the pivot
        if (cf(l[i], l[right]) <= 0) {
          // move it to the left, swapped with the value that was
          // there.
          _swap(l, i, cursor);
          cursor++;
        }
      }
      
      // finally swap the pivot into place, so all values less
      // than or equal to it are to its left
      _swap(l, cursor, right);
      
      // return the pivot index, to partition the list
      return cursor;
    }
    
    // if there's any work left to do
    if (leftIndex < rightIndex) {
      // pick a pivot and sort everything less than it its left
      int p = _partition(li, leftIndex, rightIndex, comp);
      // sort the left partition
      _qsort(li, leftIndex, p-1, comp);
      // sort the right partition
      _qsort(li, p+1, rightIndex, comp);
    }
  }
  
  static void _swap(List l, int one, int two) {
    var o = l[one];
    l[one] = l[two];
    l[two] = o;
  }
  
}
