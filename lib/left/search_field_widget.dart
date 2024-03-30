import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/check_f_bloc.dart';

class ChecksSearchFieldWidgett extends StatelessWidget {
  final TextEditingController controller;
  const ChecksSearchFieldWidgett({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    CheckFBloc checkFBloc = BlocProvider.of(context);
    return BlocBuilder<CheckFBloc, CheckFState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            height: 80,
            child: TextField(
              controller: controller,
              style: TextStyle(color: Theme.of(context).canvasColor),
              onChanged: (v) =>
                  checkFBloc.add(CheckFSearchWhenOnChangeEvent(v)),
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.background,
                prefixIcon:
                    Icon(Icons.search, color: Theme.of(context).primaryColor),
                errorBorder: _border(),
                enabledBorder: _border(),
                focusedBorder: _border(),
                disabledBorder: _border(),
                border: _border(),
                hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                hintText: "Chek Raqamini kiriting",
              ),
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder _border() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color.fromARGB(255, 8, 84, 146)));
}
