import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_scanner/left/build_list.dart';
import 'package:receipt_scanner/widget/default_button.dart';

import '../model/receipt_model_4.dart';
import 'bloc/check_f_bloc.dart';

class CheckListWidget extends StatelessWidget {
  final List<ReceiptModel4> receipts;
  final VoidCallback onOkButtonPressed;
  const CheckListWidget(
      {required this.onOkButtonPressed, required this.receipts, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckFBloc, CheckFState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CheckFLoadingState) {
          return const Center(
            child: Column(
              children: [
                CupertinoActivityIndicator(radius: 10),
                Text(
                  "Chek Qidirilmoqda...",
                ),
              ],
            ),
          );
        }
        if (state is CheckFErrorState) {
          return Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    setText("ERROR: ${state.error}", context),
                    _okButton(onPressed: onOkButtonPressed),
                  ],
                )),
          );
        }
        if (state is ChecksFNotFoundState) {
          return Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    setText("Ushbu raqamli chek topilmadi", context),
                    _okButton(onPressed: onOkButtonPressed),
                  ],
                )),
          );
        }

        if (state is CheckFNoIternetState) {
          return Column(
            children: [
              setText("Ulanish mavjud emas", context),
              // _okButton(
              //     onPressed: () => checkFBloc.add(CheckFSearchGlobalEvent(
              //         state.pattern,
              //         isRetry: true,
              //         page: checkFBloc.currentPage)),
              //     title: "Qayta urinish"),
            ],
          );
        }
        if (state is CheckFInitial) {
          return Expanded(
            child: BuildList(
              list: state.checksList,
              selectedIndex: state.selected,
            ),
          );
        }
        if (state is CheckFNoChekYetState) {
          return Expanded(
            child: Center(
              child: setText("Hozircha cheklar mavjud emas", context),
            ),
          );
        }
        return Expanded(
          child: BuildList(list: receipts, selectedIndex: 0),
        );
      },
    );
  }

  _okButton({required VoidCallback onPressed, String title = "Ok"}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          DefaultButton(
            text: title,
            isButtonEnabled: true,
            onPress: onPressed,
            height: 6,
          )
        ],
      ),
    );
  }

  setText(String v, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        v,
        textAlign: TextAlign.center,
      ),
    );
  }
}
