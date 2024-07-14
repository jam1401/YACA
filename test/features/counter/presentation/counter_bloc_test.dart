import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:tdd_widgets/features/counter/data/events/decrement_event.dart';
import 'package:tdd_widgets/features/counter/data/events/increment_event.dart';
import 'package:tdd_widgets/features/counter/data/states/counter_error.dart';
import 'package:tdd_widgets/features/counter/data/states/counter_loaded.dart';
import 'package:tdd_widgets/features/counter/domain/entities/counter.dart';
import 'package:tdd_widgets/features/counter/domain/repositories/counter_repository_impl.dart';
import 'package:tdd_widgets/features/counter/presentation/counter_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';



@GenerateNiceMocks([MockSpec<CounterRepositoryImpl>()])
import 'counter_bloc_test.mocks.dart';


void main() {
  group('CounterBloc', () {

    CounterRepositoryImpl mock = MockCounterRepositoryImpl();

    when(mock.decrementCounter()).thenThrow(UnimplementedError());
    when(mock.incrementCounter()).thenThrow(UnimplementedError());

    blocTest('emits [] when nothing is added', build: () => CounterBloc(CounterRepositoryImpl()),
    expect: () => [],);

   blocTest(
     'emits [CounterLoaded] when increment is added',
    build: () => CounterBloc(CounterRepositoryImpl()),
    act: (CounterBloc bloc) => bloc.add(IncrementEvent()),
     wait: const Duration(milliseconds: 2000),
    expect: () => [isA<CounterLoaded>()],
   );

    blocTest(
      'emits [CounterLoaded with Counter] when increment is added',
      build: () => CounterBloc(CounterRepositoryImpl()),
      act: (CounterBloc bloc) => bloc.add(IncrementEvent()),
      wait: const Duration(milliseconds: 2000),
      expect: () => [CounterLoaded(const Counter(value: 1))],
    );

    blocTest(
      'emits [CounterLoaded with Counter = 0] when increment followed by decrement is added',
      build: () => CounterBloc(CounterRepositoryImpl()),
      act: (CounterBloc bloc) => bloc..add(IncrementEvent())..add(DecrementEvent()),
      wait: const Duration(milliseconds: 2000),
      skip: 1,
      expect: () => [CounterLoaded(const Counter(value: 0))],
    );

    blocTest(
      'emits [Throws the error state on decrement error',
      build: () => CounterBloc(MockCounterRepositoryImpl()),
      act: (CounterBloc bloc) => bloc.add(DecrementEvent()),
      wait: const Duration(milliseconds: 2000),
      expect: () => [isA<CounterError>()..having((e0) => e0.message, "message", 'foo')],
    );

    blocTest(
      'emits [Throws the error state on increment error',
      build: () => CounterBloc(MockCounterRepositoryImpl()),
      act: (CounterBloc bloc) => bloc.add(IncrementEvent()),
      wait: const Duration(milliseconds: 2000),
      expect: () => [isA<CounterError>()..having((e0) => e0.message, "message", 'foo')],
    );

  });
}