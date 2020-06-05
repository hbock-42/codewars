// https://www.codewars.com/kata/5a63948acadebff56f000018/train/dart

void runMaxProduct() {
  print(maxProduct([-4, -27, -15, -6, -1], 2));
}

int maxProduct(arr, size) {
  print(arr);
  var list = List<int>.from(arr);
  print(list);
  list.sort((b, a) => a.compareTo(b));
  print(list);
  int rez = 1;
  for (var i = 0; i < list.length && i < size; i++) {
    rez *= list[i];
  }
  return rez;
}
