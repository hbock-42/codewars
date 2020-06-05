// https://www.codewars.com/kata/59b24a2158ef58966e00005e/train/dart

var tree1 = [
  " o o o  ",
  " /    / ",
  "   /    ",
  "  /  /  ",
  "   ||   ",
  "   ||   ",
  "   ||   "
];
var tree2 = [
  " o o  oo  ",
  " \\\\\\   \\\\ ",
  "  o \\o    ",
  "  \\\\  \\   ",
  "    ||    ",
  "    ||    ",
  "    ||    "
];

void printNutFarm2() {
  print(shake_tree(tree2));
}

List<int> shake_tree(var tree) {
  var sTree = List<String>.from(tree);
  var treeGround = List<int>.filled(sTree.first.length, 0);

  for (var i = 0; i < sTree.length; i++) {
    treeGround = computeLine(treeGround, sTree[i]);
  }

  return treeGround;
}

List<int> computeLine(List<int> current, String line) {
  var next = List<int>.filled(current.length, 0);
  for (var i = 0; i < current.length; i++) {
    var char = line.substring(i, i + 1);
    if (isNutt(char))
      next[i] += current[i] + 1;
    else if (canFall(char)) {
      next[i] += current[i];
    } else if (char == '\\') {
      var j = i + 1;
      while (charAtIndex(j, line) == '\\') j++;
      if (canFall(charAtIndex(j, line)) || isNutt(charAtIndex(j, line)))
        next[j] += current[i];
    } else if (char == '/') {
      var j = i - 1;
      while (charAtIndex(j, line) == '/') j--;
      if (canFall(charAtIndex(j, line)) || isNutt(charAtIndex(j, line)))
        next[j] += current[i];
    }
  }
  return next;
}

String charAtIndex(int index, String line) => line.substring(index, index + 1);

bool canFall(String char) => char == '.' || char == '|' || char == ' ';
bool isNutt(String char) => char == 'o';
