import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:lorby_neobis/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.earth).existsSync(), isTrue);
    expect(File(Images.illustration).existsSync(), isTrue);
  });
}
