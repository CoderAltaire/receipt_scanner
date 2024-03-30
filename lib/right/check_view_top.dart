import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../left/bloc/check_f_bloc.dart';
import '../model/receipt_model_4.dart';

class CheckViewTop extends StatelessWidget {
  const CheckViewTop({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckFBloc, CheckFState>(
      builder: (context, state) {
        ReceiptModel4? selectedCheck = state.selectedCheck;
        final cashierName =
            selectedCheck != null ? selectedCheck.cashierName : '';
        final posName = selectedCheck != null ? selectedCheck.posName : '';
        final checkNo = selectedCheck != null ? selectedCheck.externalId : '';
        final date =
            selectedCheck != null ? _getDateString(selectedCheck.date) : '';
        String clientName = '';
        if (selectedCheck != null) {
          clientName = selectedCheck.clientName;
        }
        return Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _textInRow("Kassir", cashierName, context),
              _textInRow("Pos", posName, context),
              _textInRow("Mijoz", clientName, context),
              _textInRow("Chek raqami", checkNo, context),
              _textInRow("Yaratilgan sanasi", date, context),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Row _textInRow(String text, String text1, BuildContext con) {
    return Row(
      children: [
        Text(
          '$text:  ',
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Text(
          text1,
          style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

String _getDateString(int millisecondsSinceEpoch) {
  final d = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  String t = '';
  t += d.day < 10 ? '0${d.day}' : d.day.toString();
  t += '.';
  t += d.month < 10 ? '0${d.month}' : d.month.toString();
  t += '.';
  t += d.year.toString();
  t += ' ';
  t += d.hour < 10 ? '0${d.hour}' : d.hour.toString();
  t += ':';
  t += d.minute < 10 ? '0${d.minute}' : d.minute.toString();
  return t;
}
