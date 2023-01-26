import 'package:belajar_dart_unit_test/book.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'mock_object_test.mocks.dart';

@GenerateNiceMocks([MockSpec<BookRepository>()])
// import "mock_object_test_mocks.dart";

void main() {
  group("BookService", () {
    var bookRepository = MockBookRepository();
    // var bookRepository = BookRepository();
    var bookService = BookService(bookRepository);

    test("save new book must success", () {
      bookService.save("1", "dart", 100000);
      verify(bookRepository.save(Book("1", "dart", 100000)));
    });

    test("Find book by id not found", () {
      expect((){
        bookService.find("1");
        }, throwsException );

      verify(bookRepository.findById("1")).called(1);
    });

    test("find book by id success", () {
      when(bookRepository.findById("1"))
          .thenReturn(Book("1", "dart", 100000));

      var book = bookService.find('1');
      expect(book, equals(Book("1", "dart", 100000)));
      verify(bookRepository.findById("1")).called(1);
    });

    test("find book by id hasan123", () {
      when(bookRepository.findById(argThat(startsWith("hasan"))))
          .thenReturn(Book("hasan123", "dart", 100000));

          var book = bookService.find("hasan123");
      expect(book, equals(Book("hasan123", "dart", 100000)));
      verify(bookRepository.findById(any)).called(1);
    });
  });
}
