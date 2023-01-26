import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  var data = "hasan";

  setUp(() {
    data = "hasan";
  });

  group("Test String", () {
    test("String First", () {
      data = "$data husein";
      expect(data, equals("hasan husein"));
    });

    test("String second", () {
      data = "$data ali";
      expect(data, equals("hasan ali"));
    });
  });
}
