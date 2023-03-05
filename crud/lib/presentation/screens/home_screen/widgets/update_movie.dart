import 'package:crud/business_logic/crud_bloc/crud_bloc.dart';
import 'package:crud/data/models/movies.dart';
import 'package:crud/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateMovie extends StatefulWidget {
  final Movie movie;
  const UpdateMovie({super.key, required this.movie});

  @override
  State<UpdateMovie> createState() => _UpdateMovieState();
}

class _UpdateMovieState extends State<UpdateMovie> {
  final _editMovieKey = GlobalKey<FormState>();
  final TextEditingController _titleField = TextEditingController();
  final TextEditingController _descField = TextEditingController();
  final TextFieldValidator _textFieldValidator = TextFieldValidator();
  @override
  void initState() {
    super.initState();
    _titleField.text = widget.movie.title;
    _descField.text = widget.movie.body;
  }

  @override
  Widget build(BuildContext context) {
    final crudBloc = Provider.of<CRUDBloc>(context);
    return Material(
        child: Form(
            key: _editMovieKey,
            child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          controller: _titleField,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            return _textFieldValidator
                                .movieFieldsValidator(value!);
                          },
                          maxLines: null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              hintText: "Movie Title",
                              prefixIcon: Icon(
                                CupertinoIcons.film,
                              ))),
                      const SizedBox(height: 20),
                      TextFormField(
                          maxLines: null,
                          controller: _descField,
                          keyboardType: TextInputType.multiline,
                          validator: (value) {
                            return _textFieldValidator
                                .movieFieldsValidator(value!);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              hintText: "Movie Description",
                              prefixIcon: Icon(CupertinoIcons.film_fill))),
                      const SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {
                            if (_editMovieKey.currentState!.validate()) {
                              crudBloc.add(UpdateMovieEvent(
                                  movieId: widget.movie.id,
                                  title: _titleField.text,
                                  description: _descField.text));
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Edit Movie")),
                      const SizedBox(height: 20),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"))
                    ]))));
  }
}
