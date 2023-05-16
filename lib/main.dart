import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states/button_state.dart';
import 'blocs/button_bloc.dart';
import 'events/button_events.dart';

//  https://bloclibrary.dev/#/coreconcepts
//  https://itnext.io/flutter-blocs-at-scale-1-the-state-machine-fce5f086d7b9
//  https://pub.dev/packages/flutter_bloc/example

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ButtonBloc(ButtonState(ButtonStates.stop)),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button BLoC')),
      body: BlocBuilder<ButtonBloc, ButtonState>(
        builder: (context, state) {
          return Center(
            child: Text(
              'State:[${state.state().name}]',
              style: const TextStyle(fontSize: 24.0, color: Colors.deepPurpleAccent),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: BlocBuilder<ButtonBloc, ButtonState>(
                  builder: (context, state) {
                return Icon(
                    state.state().name == 'stop'
                        ? Icons.play_arrow_sharp
                        : Icons.pause_sharp,
                    size: 40,
                    color: Colors.white);
              }),
              onPressed: () => context.read<ButtonBloc>().add(Click()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              child: const Icon(Icons.refresh_sharp, size: 40,),
              onPressed: () => context.read<ButtonBloc>().add(Reset()),
            ),
          ),
        ],
      ),
    );
  }
}
