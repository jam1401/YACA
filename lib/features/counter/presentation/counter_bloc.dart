import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_widgets/features/counter/data/events/counter_event.dart';
import 'package:tdd_widgets/features/counter/data/events/decrement_event.dart';
import 'package:tdd_widgets/features/counter/data/events/increment_event.dart';
import 'package:tdd_widgets/features/counter/data/states/counter_error.dart';
import 'package:tdd_widgets/features/counter/data/states/counter_loaded.dart';
import 'package:tdd_widgets/features/counter/data/states/counter_state.dart';
import 'package:tdd_widgets/features/counter/domain/entities/counter.dart';
import 'package:tdd_widgets/features/counter/domain/repositories/counter_repository.dart';


class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterRepository counterRepository;

  CounterBloc(this.counterRepository) : super(CounterLoaded(const Counter(value: 0))) {
    on<IncrementEvent>((event, emit) async {
      try {
        final updatedCounter = await counterRepository.incrementCounter();
        emit(CounterLoaded(updatedCounter));
      } catch (e) {
        emit(CounterError(e.toString()));
      }
    });

    on<DecrementEvent>((event, emit) async {
      try {
        final updatedCounter = await counterRepository.decrementCounter();
        emit(CounterLoaded(updatedCounter));
      } catch (e) {
        emit(CounterError(e.toString()));
      }
    });
  }



}