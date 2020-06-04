//  https://www.codewars.com/kata/5656b6906de340bd1b0000ac

// a = "xyaabbbccccdefww"
// b = "xxxxyyyyabklmopq"
// longest(a, b) -> "abcdefklmopqwxy"

// a = "abcdefghijklmnopqrstuvwxyz"
// longest(a, a) -> "abcdefghijklmnopqrstuvwxyz"

void runLongest() {
  print(longest('xyaabbbccccdefww', 'xxxxyyyyabklmopq'));
}

String longest(String a, String b) {
  var split = (a + b).split('');
  split.sort((c1, c2) => c1.compareTo(c2));
  return split.fold(
      split.first,
      (prev, element) =>
          element == prev.substring(prev.length - 1) ? prev : prev + element);
}
