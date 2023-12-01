part of 'example_bloc.dart';

class ExampleStateData extends Equatable {
  final ExampleDto exampleDto;
  final ErrorDto? error;

  const ExampleStateData({
    this.exampleDto = const ExampleDto(),
    this.error
  });

  @override
  List<Object?> get props => [
    exampleDto,
    error
  ];

  ExampleStateData copyWith({
    ExampleDto? exampleDto,
    ErrorDto? error,
  }) {
    return ExampleStateData(
      exampleDto: exampleDto ?? this.exampleDto,
      error: error ?? this.error,
    );
  }
}

abstract class ExampleState extends Equatable {
  final ExampleStateData data;

  const ExampleState(this.data);

  @override
  List<Object> get props => [];
}

class ExampleInitialState extends ExampleState {
  const ExampleInitialState()
      : super(const ExampleStateData());
}

class ExampleLoadingState extends ExampleState {
  const ExampleLoadingState(super.data);
}

class ExampleFailedState extends ExampleState {
  const ExampleFailedState(super.data);
}

class ExampleSuccessState extends ExampleState {
  const ExampleSuccessState(super.data);
}