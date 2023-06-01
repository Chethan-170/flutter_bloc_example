import 'package:bloc_tutorial/cubics/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'other_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              "Learning BloC - ${context.select((CounterCubit c) => c.state.counter)}"),
        ),
        body: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.counter == 3) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text('counter is ${state.counter}'),
                  );
                },
              );
            } else if (state.counter == -1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return OtherPage();
                }),
              );
            }
          },
          listenWhen: (previous, current) {
            if (current.counter == 3) {
              return false;
            } else
              return true;
          },
          builder: (context, state) {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Text(
                    'The counter value is :: ${state.counter}',
                    style: TextStyle(fontSize: 32),
                  ))
                ]);
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).decrement();
              },
              child: const Icon(Icons.remove),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterCubit>(context).increment();
              },
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
