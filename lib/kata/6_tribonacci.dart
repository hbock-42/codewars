// https://www.codewars.com/kata/556deca17c58da83c00002db

void runTribonacci() {
  print(tribonacci([0, 0, 1], 5));
}

List<num> tribonacci(List<num> signature, int n) {
  if (n == 0) return [];
  if (signature.length >= n) return signature.sublist(0, n);
  int lastIndex = signature.length - 1;
  signature.add(signature[lastIndex] +
      signature[lastIndex - 1] +
      signature[lastIndex - 2]);
  return tribonacci(signature, n);
}
