// @Retry(10)

import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test("test failed", () {
    expect(1, 2);
  }, retry: 5);
}
