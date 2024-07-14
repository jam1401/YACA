import 'package:equatable/equatable.dart';

class Counter extends Equatable{
  final int value;

  const Counter({required this.value});

  Counter copyWith({int? value}) {
    return Counter(value: value ?? this.value);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Counter &&
      other.value == value;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [value];
}