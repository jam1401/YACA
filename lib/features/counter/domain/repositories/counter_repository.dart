import 'package:tdd_widgets/features/counter/domain/entities/counter.dart';

abstract class CounterRepository {
  Future<Counter> incrementCounter();
  Future<Counter> decrementCounter();
}