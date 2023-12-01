import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/example_bloc.dart';

class ExamplePage2 extends StatefulWidget {
  static const route = '/example2';

  const ExamplePage2({Key? key}) : super(key: key);

  @override
  State<ExamplePage2> createState() => _ExamplePage2State();
}

class _ExamplePage2State extends State<ExamplePage2> {
  late ExampleBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = ExampleBloc(exampleUseCase: GetIt.instance())
      ..add(const ExampleInitEvent(id: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<ExampleBloc, ExampleState>(
          bloc: _bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if(state is ExampleFailedState) {
              return Text('Failed');
            } else if (state is ExampleLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            print('daidshas: ${state.data.exampleDto.toString()}');
            return Text('Berhasil');
          },
        ),
      ),
    );
  }
}