// file: main.dart
import 'calc.dart';

void main() {
  final processor = Calc(step: 0.25);

  processor.setRangeFrom(-2.0);
  processor.setRangeTo(2.0);

  processor.setVerbose(true);
  processor.runCalc();

  print("\nСереднє геометричне значення функції: ${processor.result}");
}
