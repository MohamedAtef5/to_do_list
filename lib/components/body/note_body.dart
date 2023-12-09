import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/constant.dart';
import 'package:to_do_list/cubit/cubit.dart';
import 'package:to_do_list/cubit/home_states.dart';
import 'package:to_do_list/modules/note.dart';

class NoteBody extends StatelessWidget {
  const NoteBody({super.key, required this.note});
  final Note note;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeViewStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              color: note.color,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    note.contant,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: backgroundColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: backgroundColor,
                      ),
                      onPressed: () {
                        HomeCubit.get(context).deleteNote(note);
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
