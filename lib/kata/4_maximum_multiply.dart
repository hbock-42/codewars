// https://www.codewars.com/kata/5aba780a6a176b029800041c

// maxMultiple (2,7) ==> return (6)

// maxMultiple (10,50)  ==> return (50)

void runMaxMultiple() {
  print(maxMultiple(10, 50));
}

int maxMultiple(divisor, bound) {
  int div = divisor;
  int bo = bound;
  double rez = bo / div;
  return (rez.toInt().toDouble() == rez) ? bo : maxMultiple(divisor, bound - 1);
}
