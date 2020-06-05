// https://www.codewars.com/kata/5779624bae28070489000146/train/dart

import 'dart:math';

void runLogisticMap() {
  print(logisticMap(5, 2, [0, 4], [0, 0]));
}

logisticMap(width, height, xs, ys) {
  var targets = List<Point>.generate(xs.length, (id) => Point(xs[id], ys[id]));
  return List<List<int>>.generate(
      height,
      (y) => List<int>.generate(width,
          (x) => targets.length == 0 ? null : minDist(Point(x, y), targets)));
}

int dist(Point from, Point target) =>
    (from.x - target.x).abs() + (from.y - target.y).abs();

int minDist(Point from, List<Point> targets) {
  int minDist = 9999999999;
  for (var i = 0; i < targets.length; i++) {
    var distance = dist(from, targets[i]);
    if (distance < minDist) {
      minDist = distance;
      if (distance == 0) return 0;
    }
  }
  return minDist;
}
