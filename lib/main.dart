import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tdd_widgets/features/counter/domain/repositories/counter_repository.dart';
import 'package:tdd_widgets/features/counter/domain/repositories/counter_repository_impl.dart';
import 'package:tdd_widgets/features/counter/presentation/counter_bloc.dart';
import 'package:tdd_widgets/features/counter/presentation/screens/counter_screen.dart';

import 'main.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<CounterRepository>(() => CounterRepositoryImpl());
  getIt.registerFactory<CounterBloc>(() => CounterBloc(getIt<CounterRepository>()));
}

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Clean Architecture Example with TDD',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => getIt<CounterBloc>(),
        child: CounterScreen(),
      ),
    );
  }
}

