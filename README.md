Dart Fundamentals Assignment (Bonus Edition)
Name: [Your Full Name]
Student ID: [Your Student ID]

Assignment Overview
This repository includes a set of Dart programs that demonstrate my understanding of core Dart programming concepts. The tasks focus on working with collections, implementing algorithms manually, applying Object-Oriented Programming (OOP) principles, and handling asynchronous operations. Each task was designed not only to complete the required functionality but also to explore additional improvements and best practices.

Task 1: Number Analysis App
Location: /task1/number_analysis.dart

Features & Bonus Work
Manual Number Analysis: I implemented functions like findMax, findMin, and calculateSum using manual loops instead of relying on built-in functions. This helped reinforce how these operations work internally.

Handling Empty Lists: Safety checks were added to prevent the program from crashing due to RangeError when an empty list is passed.

Negative Number Counter: A function was added to count how many negative numbers exist in the list.

Bubble Sort Implementation: Instead of using Dart’s .sort() method, I implemented the Bubble Sort algorithm manually to better understand sorting logic.

Collection Method Comparison: I also explored the differences between using manual loops and Dart’s built-in collection methods, noting their advantages and trade-offs.

Task 2: Async Calculator App
Location: /task2/calculator_app.dart

Features & Bonus Work
Object-Oriented Design: The calculator functionality is organized within a Calculator class to keep the code modular and easy to maintain.

Async/Await Usage: To simulate real-world scenarios such as network delays, I used Future.delayed with async/await.

Custom Error Handling: I created a custom UnknownOperationException class to handle unsupported operations in a clear and structured way.

Calculation History: A private list stores the history of successful calculations performed during the program session.

Graceful Error Recovery: Different types of exceptions are handled using specific on Exception blocks so the application continues running even when errors occur.




## How to Run
1. Makesure you have the [Dart SDK](https://dart.dev/get-dart) installed.
2. Navigate to the specific task folder in your terminal.
3. Run the command:
   ```bash
   dart filename.dart