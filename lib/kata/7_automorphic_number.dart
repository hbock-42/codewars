// https://www.codewars.com/kata/5a58d889880385c2f40000aa/train/dart

void runAutomorphic() {
  print(automorphic(23));
}

String automorphic(n) {
  int newN = n;
  int numbOfDigits = newN.toString().length;
  var squaredMin = newN * newN - newN;
  var squaredString = squaredMin.toString();
  for (var i = 0; i < numbOfDigits; i++) {
    if (int.parse(squaredString.substring(squaredString.length - 1 - i)) != 0)
      return "Not!!";
  }

  return "Automorphic";
}
