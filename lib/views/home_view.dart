import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:to_do_list/components/body/homeview_body.dart';
import 'package:to_do_list/constant.dart';
import 'package:to_do_list/cubit/cubit.dart';
import 'package:to_do_list/cubit/home_states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeViewStates>(
      builder: (context, state) {
        if (state is IntialState) {
          HomeCubit.get(context).loadData();
        }
        else if (state is LoadingDataState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: appColor,
            title: const Text(
              "My Day",
              style: TextStyle(
                color: backgroundColor,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  HomeCubit.get(context).saveData();
                },
                icon: const Icon(
                  Icons.check,
                ),
              ),
            ],
          ),
          body: const HomeViewBody(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: appColor,
            foregroundColor: backgroundColor,
            onPressed: () {
              //  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNoteBody()),);

              ShowDialog(context);
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> ShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        TextEditingController contentController = TextEditingController();
        TextEditingController colorController = TextEditingController();
        return Dialog(
          backgroundColor: backgroundColor,
          child: Material(
            borderRadius: BorderRadius.circular(32),
            child: Container(
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(32)),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add a New Note',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: contentController,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextFormField(
                    controller: colorController,
                    decoration: const InputDecoration(
                      labelText: 'Color',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appColor,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          HomeCubit.get(context).addNote(
                            contentController.text,
                            getColor(colorController.text),
                          );
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Add Note',
                          style: TextStyle(color: backgroundColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String getColor(String value) {
    if (value == '') {
      return '0xffbc6c25';
    } else {
      return value;
    }
  }
}
