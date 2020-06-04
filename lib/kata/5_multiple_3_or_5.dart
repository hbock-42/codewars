// https://www.codewars.com/kata/514b92a657cdc65150000006/dart

void runSolution() {
  print(solution(10));
}

int solution(int n) {
  var mList = [];
  for (var i = 1; i < n; i++) {
    var m3 = i * 3;
    var m5 = i * 5;
    if (m3 < n) {
      mList.add(m3);
    }
    if (m5 < n) {
      mList.add(m5);
    }
  }
  int sum = 0;
  mList.toSet().forEach((n) => sum += n);
  return sum;
}
