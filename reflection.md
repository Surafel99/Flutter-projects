QR1. The Hardest Concept: Async/Await & Custom Exceptions

One of the most challenging parts of this project was understanding how asynchronous operations work, especially with async and await. At first, I had trouble figuring out why the History Log was not updating correctly. After some debugging, I realized that if I didn’t use await when calling the calculation function, the program would store a Future object instead of the actual result.

Another new concept for me was creating a custom exception (UnknownOperationException). Implementing it helped me better understand how Dart handles errors and how inheritance works when creating custom error types.

QR2. Changing to List<double> 

If I changed the list type from int to double, several parts of the program would need to be updated. Most of the function parameters and variables currently typed as int would need to be changed to double, including the Bubble Sort implementation. In total, around ten type annotations would likely need adjustment.

However, the average calculation (totalSum / numbers.length) would still work the same way because division already returns a decimal value. This change helped me understand that strong typing in Dart improves code safety, but it also means developers must carefully plan their data types when designing programs.

QR3. Real-World Async Usage and the User Interface

In real-world Flutter applications, asynchronous programming is very important. For example, when an app fetches data from an API—such as a user's transaction history—the result usually comes as a Future that resolves to something like a List<Transaction>.

While the app is waiting for the data, the UI typically shows a loading indicator, such as a spinner or shimmer effect, to let the user know that the process is still running. Without proper use of async/await, the application could become unresponsive or slow, which would create a poor user experience.

QR4. Separate Methods vs. Generic Wrappers

Using separate methods like add() and multiply() makes the code easier to test and understand. Each function has a single responsibility, which means it can be tested individually to ensure the calculation works correctly.

On the other hand, using a more generic method such as computeAsync() makes the program easier to extend in the future. For example, if I wanted to add operations like power or square root, I could simply update the switch statement inside the wrapper instead of modifying how the rest of the program interacts with the calculator.

Reflection on Bonus Challenges

Implementing Bubble Sort manually was a helpful exercise because it reminded me how sorting algorithms actually work behind the scenes. Although Dart’s built-in .sort() method is faster and more optimized, writing the algorithm myself strengthened my understanding of loops and algorithm complexity.

Another useful lesson came from adding the Empty List Guard in Task 1. This showed me the importance of defensive programming, which means designing programs to handle unexpected or incorrect inputs. Small checks like this can prevent crashes and make applications more reliable, which is an important practice in professional software development.