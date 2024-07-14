
import 'package:test/test.dart';
import 'package:tdd_widgets/features/counter/domain/entities/counter.dart';
import 'package:tdd_widgets/features/counter/domain/repositories/counter_repository_impl.dart';


void main() {
  test('increment will update the counter repository', () async {
    final counterRepository = CounterRepositoryImpl();
    Counter subject = await counterRepository.incrementCounter();
    expect(subject.value, 1);
  });

  test('decrement will update the counter repository', () async {
    final counterRepository = CounterRepositoryImpl();
    Counter subject = await counterRepository.incrementCounter();
    subject = await counterRepository.decrementCounter();
    expect(subject.value, 0);
  });
}