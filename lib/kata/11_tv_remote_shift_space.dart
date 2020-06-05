// https://www.codewars.com/kata/5b277e94b6989dd1d9000009/train/dart

import 'dart:math';

void printTvRemote() {
  print(tv_remote('Does'));
}

var command = [
  ['a', 'b', 'c', 'd', 'e', '1', '2', '3'],
  ['f', 'g', 'h', 'i', 'j', '4', '5', '6'],
  ['k', 'l', 'm', 'n', 'o', '7', '8', '9'],
  ['p', 'q', 'r', 's', 't', '.', '@', '0'],
  ['u', 'v', 'w', 'x', 'y', 'z', '_', "/"],
  ['aA', 'SP', null, null, null, null, null, null],
];

const Point<int> majPos = Point(0, 5);
const Point<int> spacePos = Point(1, 5);

int tv_remote(String word) {
  var charPositions = Map<String, Point<int>>();
  for (var i = 0; i < command.length - 1; i++) {
    for (var j = 0; j < command[i].length; j++) {
      if (command[i][j] != null) {
        if (isSpace(command[i][j])) {
          charPositions[command[i][j]] = spacePos;
        } else if (isMajButton(command[i][j])) {
          charPositions[command[i][j]] = majPos;
        } else {
          charPositions[command[i][j]] = Point<int>(j, i);
        }
      }
    }
  }
  bool caseUp = false;
  var position = Point<int>(0, 0);
  int buttonPresedCount = 0;

  for (var i = 0; i < word.length; i++) {
    String char = charAtIndex(word, i);
    if (needSwitchCase(caseUp, char)) {
      buttonPresedCount += dist(position, majPos);
      position = majPos;
      caseUp = !caseUp;
    }
    if (char == ' ') {
      buttonPresedCount += dist(position, spacePos);
      position = spacePos;
    } else {
      var target = charPositions[char.toLowerCase()];
      buttonPresedCount += dist(position, target);
      position = target;
    }
  }

  return buttonPresedCount;
}

bool isSpace(String char) => char == 'SP';
bool isMajButton(String char) => char == 'aA';

int dist(Point from, Point to) =>
    (from.x - to.x).abs() + (from.y - to.y).abs() + 1;

String charAtIndex(String str, int index) => str.substring(index, index + 1);

bool needSwitchCase(bool current, String char) =>
    char.toLowerCase() == char.toUpperCase()
        ? false
        : current != isCharUpperCase(char);

bool isCharUpperCase(String char) => char == char.toUpperCase();
