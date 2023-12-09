import 'package:flutter/material.dart';
import 'package:to_do_list/constant.dart';
import 'package:to_do_list/cubit/cubit.dart';

class AddNoteBody extends StatelessWidget {
  const AddNoteBody({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    
      TextEditingController contentController = TextEditingController();
  TextEditingController colorController = TextEditingController();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
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
                      foregroundColor: Colors.black
                    ),
                    onPressed: () {
                      HomeCubit.get(context)
                          .addNote(contentController.text, getColor(colorController.text));
                      Navigator.pop(context);
                    },
                    child: const Text('Add Note',style: TextStyle(color: backgroundColor),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  String getColor(String value){
    if (value==''){
      return '0xffbc6c25';
    }
    else{
      return value;
    }
  }
}
