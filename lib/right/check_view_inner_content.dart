import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_scanner/right/check_view_bottom.dart';
import 'package:receipt_scanner/right/check_view_sold_items.dart';
import 'package:receipt_scanner/right/check_view_top.dart';
import '../left/bloc/check_f_bloc.dart';

class CheckViewInnerContent extends StatelessWidget {
  const CheckViewInnerContent({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckFBloc, CheckFState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            state.selectedCheck != null
                ? Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Jami to`langani: ${state.selectedCheck!.totalPrice}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : const SizedBox(width: 0, height: 0),
            const CheckViewTop(),
            state.selectedCheck != null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(color: Theme.of(context).dividerColor),
                      const CheckViewSoldItems(),
                      Divider(color: Theme.of(context).dividerColor),
                      const CheckViewBottom(),
                    ],
                  )
                : const SizedBox(width: 0, height: 0),
          ],
        );
      },
    );
  }
}
