#import('dart:html');
#source('Quicksort.dart');

class algos {

  algos() {
  }

  void printList(List l) {
    StringBuffer s = new StringBuffer();
    l.forEach((i) => s.add(i.toString()+" "));
    print(s.toString());
  }
  
  void run() {
    List<int> l = new List<int> ();
    for (int i=0; i<100; i++) {
      l.add((Math.random()*100.0).toInt());
    }
    printList(l);
    Quicksort.qsort(l, (a,b) {
      if (a < b) {
        return -1;
      } else if (a == b) {
        return 0;
      } else {
        return 1;
      }
      });
    print("-->");
    printList(l);
    write("all done");
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
  }
}

void main() {
  new algos().run();
}
