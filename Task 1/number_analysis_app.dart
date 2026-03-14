// Task 1: Number Analysis App
// Name: [Your Name Here]

/// GUARD CLAUSE: Checks if the list is empty to prevent runtime crashes.
/// (Bonus Task: Empty List Guard)
bool isListInvalid(List<int> numbers) {
  if (numbers.isEmpty) {
    print('Error: The provided list is empty. Cannot perform analysis.');
    return true;
  }
  return false;
}

int findMax(List<int> numbers) {
  if (isListInvalid(numbers)) return 0;
  int currentMax = numbers[0];
  for (int num in numbers) {
    if (num > currentMax) currentMax = num;
  }
  return currentMax;
}

int findMin(List<int> numbers) {
  if (isListInvalid(numbers)) return 0;
  int currentMin = numbers[0];
  for (int num in numbers) {
    if (num < currentMin) currentMin = num;
  }
  return currentMin;
}

int calculateSum(List<int> numbers) {
  if (isListInvalid(numbers)) return 0;
  int sum = 0;
  for (int num in numbers) {
    sum += num;
  }
  return sum;
}

double calculateAverage(List<int> numbers) {
  if (isListInvalid(numbers)) return 0.0;
  return calculateSum(numbers) / numbers.length;
}

/// BONUS: Counts how many negative integers are in the list.
int countNegatives(List<int> numbers) {
  if (isListInvalid(numbers)) return 0;
  int count = 0;
  for (int num in numbers) {
    if (num < 0) count++;
  }
  return count;
}

/// BONUS: Manual Bubble Sort algorithm (Ascending order).
List<int> manualSort(List<int> numbers) {
  if (isListInvalid(numbers)) return [];
  List<int> sorted = List.from(numbers);
  for (int i = 0; i < sorted.length - 1; i++) {
    for (int j = 0; j < sorted.length - i - 1; j++) {
      if (sorted[j] > sorted[j + 1]) {
        int temp = sorted[j];
        sorted[j] = sorted[j + 1];
        sorted[j + 1] = temp;
      }
    }
  }
  return sorted;
}

void main() {
  final numbers = <int>[34, -7, 89, 12, -45, 67, 3, 100, -2, 55];

  print('Number Analysis Results');
  print('========================');
  print('Original List   : $numbers');
  print('Maximum value   : ${findMax(numbers)}');
  print('Minimum value   : ${findMin(numbers)}');
  print('Sum             : ${calculateSum(numbers)}');
  print('Average         : ${calculateAverage(numbers).toStringAsFixed(1)}');
  print('Negative Count  : ${countNegatives(numbers)}');
  print('Sorted (Bubble) : ${manualSort(numbers)}');
  print('========================');
}

/* CONCEPTUAL QUESTIONS (Task 1)
  
  Q1: List<int> is a "type-safe" container only for integers, whereas List<dynamic> 
      is a "junk drawer" that accepts anything. Using List<int> is better because 
      it helps the compiler catch errors before the app runs and makes the code faster.

  Q2: Starting at numbers[0] ensures the "maximum" is a real value from our data. 
      If I started at 0 and the list was all negative numbers, the answer would 
      be 0 (which is wrong since 0 wasn't in the list).

  Q3: Reusing calculateSum() inside calculateAverage() follows the DRY (Don't Repeat 
      Yourself) principle. It makes code easier to maintain and reduces logic bugs.

  Q4: A for-in loop is a simple way to "grab every item" without caring about 
      positions. A traditional for loop uses an index (i) which is necessary if 
      you need to know exactly where an item is or if you want to modify the list 
      as you go.

  Q5: If called with an empty list, it would normally crash (RangeError). I fixed 
      this by adding an `isListInvalid` guard clause to handle empty cases safely.
*/
