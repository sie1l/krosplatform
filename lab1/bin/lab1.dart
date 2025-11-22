import 'dart:math';

void main() {
  const valueFrom = -1.0;
  const valueTo = 5.0;
  const step = 0.1;

  print("y = 90 / x^2 + x\n");

  double? yMin, yMax, xMin, xMax;

  for (double x = valueFrom; x < valueTo; x += step) {
    if (x == 0) continue;

    final y = calc(x);
    print("x = ${x.toStringAsFixed(2)}, 90 / ${x.toStringAsFixed(2)}^2 + ${x.toStringAsFixed(2)} = ${y.toStringAsFixed(4)}");

    if (yMin == null || y < yMin) { yMin = y; xMin = x; }
    if (yMax == null || y > yMax) { yMax = y; xMax = x; }
  }

  print("\nmin y = ${yMin?.toStringAsFixed(4)} при x = ${xMin?.toStringAsFixed(2)}");
  print("max y = ${yMax?.toStringAsFixed(4)} при x = ${xMax?.toStringAsFixed(2)}");
}

double calc(double x) => 90 / (x * x) + x;
