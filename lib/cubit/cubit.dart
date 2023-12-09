import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/cubit/home_states.dart';
import 'package:to_do_list/modules/note.dart';

class HomeCubit extends Cubit<HomeViewStates>{
  HomeCubit() : super(IntialState());
  static HomeCubit get(context) => BlocProvider.of(context);
   static  List<Note> notes =[] ;

void deleteNote(Note note ) {
  notes.remove(note);
  emit(DeleteNoteState());
}
void addNote(String content , String color) {
  
    notes.add(Note(contant: content,color: Color(int.parse(color))));
  
 
  emit(AddNoteState());
}


  
}