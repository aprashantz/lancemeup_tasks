import 'package:crud/business_logic/crud_bloc/crud_bloc.dart';
import 'package:crud/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostMovie extends StatefulWidget {
  const PostMovie({super.key});

  @override
  State<PostMovie> createState() => _PostMovieState();
}

class _PostMovieState extends State<PostMovie> {
  final _addMovieKey = GlobalKey<FormState>();
  final TextEditingController _titleField = TextEditingController();
  final TextEditingController _descField = TextEditingController();
  final TextFieldValidator _textFieldValidator = TextFieldValidator();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addMovieKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _titleField,
              keyboardType: TextInputType.text,
              validator: (value) {
                return _textFieldValidator.movieFieldsValidator(value!);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  hintText: "Movie Title",
                  prefixIcon: Icon(
                    CupertinoIcons.film,
                  )),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _descField,
              keyboardType: TextInputType.text,
              validator: (value) {
                return _textFieldValidator.movieFieldsValidator(value!);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                  hintText: "Movie Description",
                  prefixIcon: Icon(
                    CupertinoIcons.film_fill,
                  )),
            ),
            const SizedBox(height: 20),
            BlocBuilder<CRUDBloc, CRUDState>(builder: (context, state) {
              if (state is OperationLoading) {
                return const CircularProgressIndicator();
              } else if (state is OperationFailure) {
                Fluttertoast.showToast(msg: state.msg!);
              } else if (state is OperationSuccess) {
                Fluttertoast.showToast(
                    msg:
                        "Movie with title: ${state.postedMovie.title} and description: ${state.postedMovie.body} added to system.");
              }
              return ElevatedButton(
                  onPressed: () {
                    if (_addMovieKey.currentState!.validate()) {
                      context.read<CRUDBloc>().add(AddMovieEvent(
                          title: _titleField.text,
                          description: _descField.text));
                    }
                  },
                  child: const Text("Add Movie"));
            }),
          ],
        ),
      ),
    );
  }
}
