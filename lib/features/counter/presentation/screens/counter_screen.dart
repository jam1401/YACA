import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_widgets/features/counter/data/events/decrement_event.dart';
import 'package:tdd_widgets/features/counter/data/events/increment_event.dart';
import 'package:tdd_widgets/features/counter/data/states/counter_loaded.dart';
import 'package:tdd_widgets/features/counter/data/states/counter_state.dart';
import 'package:tdd_widgets/features/counter/presentation/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (BuildContext context, CounterState state) {
          if (state is CounterLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Counter Value: ${state.counter.value}',
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementEvent());
                        },
                        child: const Text('Increment'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementEvent());
                        },
                        child: const Text('Decrement'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },)
    );
  }
}