// https://www.codewars.com/kata/5a523566b3bfa84c2e00010b/

// minSum({5,4,2,3}) ==> return (22)

// minSum({12,6,10,26,3,24}) ==> return (342)

void runminSum() {
  print(minSum({12, 6, 10, 26, 3, 24}));
}

int minSum(arr) {
  var intList = List<int>.from(arr);
  int min = 0;
  intList.sort();
  for (var i = 0; i < intList.length / 2; i++) {
    min += intList[i] * intList[intList.length - 1 - i];
  }
  return min;
}
