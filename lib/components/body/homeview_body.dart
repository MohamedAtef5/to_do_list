import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/components/body/note_body.dart';
import 'package:to_do_list/cubit/cubit.dart';
import 'package:to_do_list/cubit/home_states.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeViewStates>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: HomeCubit.notes.map((e) => NoteBody(note: e)).toList(),
          ),
        );
      },
    );
  }
}
