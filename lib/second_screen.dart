import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement_proj/bloc/counter_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (contextBloc, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              'SECOND PAGE',
            ),
          ),
          body: Center(
            child: Text(
              state.number.toString(),
              style: TextStyle(fontSize: 26),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton.small(
                backgroundColor: Colors.blue,
                shape: CircleBorder(),
                onPressed: () {
                  contextBloc.read<CounterBloc>().add(DecrementEvent());
                },
                child: Icon(Icons.remove),
              ),
              FloatingActionButton.small(
                backgroundColor: Colors.blue,
                shape: CircleBorder(),
                onPressed: () {
                  contextBloc.read<CounterBloc>().add(IncrementEvent());
                },
                child: Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }
}
