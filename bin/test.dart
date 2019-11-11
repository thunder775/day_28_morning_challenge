import 'package:test/test.dart';

import 'main.dart';
main(){
  test('list flattening', (){
    expect(flattenList([1,2,3,[1,2,3]]), [1,2,3,1,2,3]);
  });
}