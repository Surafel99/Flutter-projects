// Task 2: Async Calculator App
// Name: [Your Name Here]

import 'dart:async';

/// BONUS: Custom Exception for unrecognized operations.
class UnknownOperationException implements Exception {
  final String message;
  UnknownOperationException(this.message);
  @override
  String toString() => 'UnknownOperationException: $message';
}

class Calculator {
  final String name;
  final List<String> _history = []; // BONUS: History Log

  Calculator(this.name);

  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;

  double divide(double a, double b) {
    if (b == 0) throw ArgumentError('Cannot divide by zero.');
    return a / b;
  }

  Future<double> computeAsync(double a, double b, String op) async {
    double result;
    switch (op.toLowerCase()) {
      case 'add':
        result = add(a, b);
        break;
      case 'subtract':
        result = subtract(a, b);
        break;
      case 'multiply':
        result = multiply(a, b);
        break;
      case 'divide':
        result = divide(a, b);
        break;
      default:
        throw UnknownOperationException('"$op" is not a valid operation.');
    }

    await Future.delayed(const Duration(milliseconds: 1500));
    _history.add('$op($a, $b) = $result');
    return result;
  }

  Future<void> displayResult(double a, double b, String op) async {
    try {
      final result = await computeAsync(a, b, op);
      print('Result: $op($a, $b) = $result');
    } on ArgumentError catch (e) {
      print('Math Error: ${e.message}');
    } on UnknownOperationException catch (e) {
      print('Input Error: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    }
  }

  void printHistory() {
    print('\n--- Calculation History ---');
    for (var entry in _history) print(' • $entry');
    print('---------------------------\n');
  }
}

Future<void> main() async {
  final calc = Calculator('Pro-Calc 3000');
  print('--- ${calc.name} Starting ---');

  await calc.displayResult(10, 4, 'add');
  await calc.displayResult(20, 5, 'subtract');
  await calc.displayResult(10, 0, 'divide'); // Error test
  await calc.displayResult(5, 5, 'magic'); // Custom error test

  calc.printHistory();
  print('All calculations complete.');
}

/* CONCEPTUAL QUESTIONS (Task 2)
  
  Q6: Sync functions (like divide) happen instantly. Async functions (like 
      computeAsync) return a "Future" and allow the app to keep running while 
      waiting for a slow process to finish.

  Q7: `await` tells the code to pause until the Future is done. If you forget it, 
      you get "Instance of 'Future<double>'" because you are looking at the 
      unfinished promise instead of the real number.

  Q8: The try-catch block is my safety net. If I divide by zero without it, 
      the whole app crashes. With it, I can catch the error and print a 
      friendly message instead.

  Q9: Throwing an ArgumentError in divide() is good design because it follows 
      "Separation of Concerns." The math logic reports the error, and the 
      display logic decides how to show it to the user.

  Q10: `async` on main() lets me use `await` inside the main function. Without 
       it, the program would reach the end before the 1.5-second calculations 
       ever finished.
*/
