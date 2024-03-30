// ignore_for_file: dead_code
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_scanner/right/check_view_inner_content.dart';

import '../left/bloc/check_f_bloc.dart';

class CheckViewContent extends StatelessWidget {
  const CheckViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckFBloc, CheckFState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).dialogBackgroundColor,
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CheckViewInnerContent(),
            ],
          ),
        );
      },
    );
  }
}
