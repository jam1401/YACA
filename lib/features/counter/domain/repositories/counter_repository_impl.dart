import 'package:tdd_widgets/features/counter/domain/entities/counter.dart';
import 'package:tdd_widgets/features/counter/domain/repositories/counter_repository.dart';

class CounterRepositoryImpl implements CounterRepository {
  Counter _counter = Counter(value: 0);

  @override
  Future<Counter> decrementCounter() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulating async operation
    _counter = _counter.copyWith(value: _counter.value - 1);
    return _counter;
  }

  @override
  Future<Counter> incrementCounter() async {
    await Future.delayed(const Duration(seconds: 1));
    _counter = _counter.copyWith(value: _counter.value + 1);
    return _counter;
  }

}