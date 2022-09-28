import 'package:weighted_random_picker/src/int.dart';
import 'package:test/test.dart';

void main() {
  test('count length not zeros', () {
    expect(countLengthNotZeros(0x0), 0);
    expect(countLengthNotZeros(0xE), 4);
    expect(countLengthNotZeros(0xE1), 8);
    expect(countLengthNotZeros(0x1FF), 9);
    expect(countLengthNotZeros(0xFFFFFFFF), 32);
  });
}
