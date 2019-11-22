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
      flattenedList.addAll(flattenList(x));
      continue;
    }
    if (x is Function) {
      if (x() is List) {
        flattenedList.addAll(flattenList(x()));
      } else {
        flattenedList.add(x());
        continue;
      }
    } else {
      flattenedList.add(x);
    }
  }
  return flattenedList;
}

main() {
  print(flattenList([
    1,
    "2",
    [
      3,
      () {
        return [
          4,
          [4,[4,[44]]]
        ];
      },
      ["five"],
      "six",
      true,
      {1: "val"}
    ]
  ]));
  print(flattenList([
    () {
      return [1, 2, 3];
    },
    () {
      return 'w';
    }
  ]));
}
