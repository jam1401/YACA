import 'package:tdd_widgets/features/counter/data/states/counter_state.dart';
import 'package:tdd_widgets/features/counter/domain/entities/counter.dart';

class CounterLoaded extends CounterState {
  final Counter counter;

  CounterLoaded(this.counter);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterLoaded &&
        other.counter == counter;
  }



}