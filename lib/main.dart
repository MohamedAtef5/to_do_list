import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/cubit.dart';
import 'package:to_do_list/cubit/home_states.dart';
import 'package:to_do_list/views/home_view.dart';

void main() {
  runApp(const ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeViewStates>(
        builder: (context, state) {
          return const MaterialApp(
            home: HomeView(),
            debugShowCheckedModeBanner: false,
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
