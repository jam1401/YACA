import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_widgets/features/counter/domain/repositories/counter_repository.dart';
import 'package:tdd_widgets/features/counter/domain/repositories/counter_repository_impl.dart';
import 'package:tdd_widgets/features/counter/presentation/counter_bloc.dart';
import 'package:tdd_widgets/main.dart';


void main() {
  setUpAll(() async {
    getIt.registerLazySingleton<CounterRepository>(() => CounterRepositoryImpl());
    getIt.registerFactory<CounterBloc>(() => CounterBloc(getIt<CounterRepository>()));
  });

  testWidgets('CounterScreen has a title and buttons for increment and decrement', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('Counter App'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsExactly(2));
    expect(find.text('Counter Value: 0'), findsOneWidget);

  });


  testWidgets('CounterScreen changes the counter value when increment/decrement button is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byType(ElevatedButton).first);
      //await Future.delayed(const Duration(seconds: 1));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await expectLater(find.text('Counter Value: 1'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton).last);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await expectLater(find.text('Counter Value: 0'), findsOneWidget);
  });


}
