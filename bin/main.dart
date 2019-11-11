// Challenge
// Flatten a list
// Create a function that takes a list. This list can have all kinds of items, even other lists. The function should return a single, flat, one-dimensional, list with all elements. Here are the conditions:
//
// - If the item is a list, include each item in it and the following still apply:
// - If the item is a Function, include the function's output, not the function itself.
// - If the item is a plain Object or a Primitive, include it as is.

// Example
// flattenList([1, "2", [3, function () { return 4; }, [ "five" ], "six", true, { prop: "val" }]])
//  ➞ [1, "2", 3, 4, "five", "six", true, { prop: "val" }]
List flattenList(List inputList) {
  List flattenedList = [];
  for (var x in inputList) {
    if (x is List) {
      print('x is $x');
      extractor(flattenedList, x);
      continue;
    }
    if (x is Function) {
      print('function loop x is ${x()}');
      if (x() is List) {
        extractor(flattenedList, x());
      } else {
        flattenedList.add(x());
        continue;
      }
    } else {
      print('x is $x');
      flattenedList.add(x);
    }
  }
  return flattenedList;
}

void extractor(List flattenedList, List x) {
  for (var y in x) {
    if (y is List) {
      extractor(flattenedList, y);
    } else if (y is Function) {
      if (y() is List) {
        print('${y()}');
        extractor(flattenedList, y());
      } else {
        flattenedList.add(y());
      }
      continue;
    } else {
      flattenedList.add(y);
    }
  }
}

main() {
  print(flattenList([
    () {
      return [1, 2, 3];
    },
    () {
      return 'w';
    }
  ]));
}
