import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list/cubit/home_states.dart';
import 'package:to_do_list/modules/note.dart';

class HomeCubit extends Cubit<HomeViewStates>{
  HomeCubit() : super(IntialState());
  int counter = 0;
  static HomeCubit get(context) => BlocProvider.of(context);
   static  List<Note> notes =[] ;
  List<String> colors = [];
void deleteNote(Note note ) {
  notes.remove(note);
  
  saveData();
  emit(DeleteNoteState());
}

void saveData()async{
  counter = 0;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String> contants = [];
  
  for (int i =0 ; i<notes.length;i++){
   contants.add(notes[i].contant);
   
  }
  preferences.setStringList('contants', contants);
  preferences.setStringList('colors', colors);
 
  
  

  emit(SaveNoteState());
}
void loadData()async{
  emit(LoadingDataState());
  SharedPreferences preferences = await SharedPreferences.getInstance();
  List<String> contants = preferences.getStringList('contants')??[];
  List<String> Loadedcolors = preferences.getStringList('colors')??[];
  if (contants.isNotEmpty){
    for (int i =0 ; i<contants.length;i++){
      notes.add(Note(contant: contants[i],color:Color(int.parse(Loadedcolors[i]))));
    }
    emit(LoadNoteState());
  }
  else{
    emit(ErrorLoadNoteState());
  }

}
void addNote(String content , String color) async{
  Note newNote = Note(contant: content,color: Color(int.parse(color)));
  
    notes.add(newNote);
    colors.add(color);

  saveData();
  emit(AddNoteState());
}


  
}