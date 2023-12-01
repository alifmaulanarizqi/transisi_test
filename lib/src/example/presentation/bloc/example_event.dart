part of 'example_bloc.dart';

abstract class ExampleEvent extends Equatable {
  const ExampleEvent();
}

class ExampleInitEvent extends ExampleEvent {
  final int id;

  const ExampleInitEvent({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}