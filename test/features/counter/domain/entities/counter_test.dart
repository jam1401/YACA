import 'package:test/test.dart';
import 'package:tdd_widgets/features/counter/domain/entities/counter.dart';

void main() {
  test('Counter should be initialized with 0', () {
    final counter = Counter(value: 0);
    expect(counter.value, 0);
  });

  test('Counter should be initialized with 10', () {
    final counter = Counter(value: 10);
    expect(counter.value, 10);
  });

  test('Counter can be copied with a new value', () {
    final counter = Counter(value: 0);
    final newCounter = counter.copyWith(value: 10);
    expect(newCounter.value, 10);
  });

  test('Counters can be compared', () {
    final counter = Counter(value: 0);
    final counter1 = Counter(value: 0);

    expect(counter1, equals(counter));

  });

  test('Get Props ', () {
    final counter = Counter(value: 10);
    List<Object?> props = counter.props;

    expect(props[0], 10);
  });
}