import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/components/body/add_note_body.dart';
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

        return Scaffold(
          backgroundColor:backgroundColor ,
          appBar: AppBar(
            backgroundColor: appColor,
            title: const Text(
              "My Day",
              style: TextStyle(
                color: backgroundColor,
              ),
            ),
            centerTitle: true,
            actions: const [Icon(Icons.arrow_back_ios)],
          ),
          body: const HomeViewBody(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: appColor,
            foregroundColor: backgroundColor,
            onPressed: () {
              
                   Navigator.push(context, MaterialPageRoute(builder: (context) => AddNoteBody()),);
               
            
            },
            child: const Icon(
              Icons.add,
            ),
          ),
        );
      },
    );
  }
}
