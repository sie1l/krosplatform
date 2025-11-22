// file: calc.dart
import 'dart:math';

class Calc {
  bool verbose = false;
  double? _result;

  double rangeFrom = -3.0;
  double rangeTo = 3.0;
  double step;

  Calc({this.step = 0.25});

  double? get result => _result;

  void setRangeFrom(double value) {
    rangeFrom = value;
  }

  void setRangeTo(double value) {
    rangeTo = value;
  }

  void setVerbose(bool value) {
    verbose = value;
  }

  void runCalc() {
    var x = rangeFrom;
    var count = 0;
    var all = 1.0;

    do {
      final y = _calc(x);

      if (verbose) {
        print("x = $x, 100 - (x + x^2) = $y");
      }

      all *= y;
      count++;
      x += step;
    } while (x < rangeTo);

    _result = exp(log(all) / count);
  }

  double _calc(double x) {
    return 100 - (x + x * x);
  }
}
