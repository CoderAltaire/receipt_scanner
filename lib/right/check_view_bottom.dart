import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../left/bloc/check_f_bloc.dart';
import '../model/receipt_model_4.dart';

class CheckViewBottom extends StatelessWidget {
  const CheckViewBottom({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckFBloc, CheckFState>(
      builder: (context, state) {
        ReceiptModel4? selectedCheck = state.selectedCheck;
        final paymentList = selectedCheck!.payment;
        return Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: 20,
            top: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Jami",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    selectedCheck.totalPrice.toString(),
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: paymentList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final payment = paymentList[index];
                  double? cashPayment;
                  if (payment.name == 'cash') {
                    cashPayment = payment.value + selectedCheck.sdacha;
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _getPaymentNamee(payment.name),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        cashPayment == null
                            ? (payment.value).toString()
                            : (cashPayment).toString(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.9),
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                },
              ),
              selectedCheck.sdacha == 0
                  ? const SizedBox(width: 0, height: 0)
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Qaytim",
                        ),
                        Text(
                          selectedCheck.sdacha.toString(),
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}

String _getPaymentNamee(String name) {
  switch (name) {
    case 'cash':
      {
        return "Naqt pulda";
      }
    case 'card':
      {
        return "Karta orqali";
      }
    case 'gift':
      {
        return "Sovg`a";
      }
    case 'debt':
      {
        return "Qarz";
      }
    case 'cashback':
      {
        return "Cashback";
      }
    case 'qr_code':
      {
        return 'QR Code';
      }
    case 'humo':
      {
        return 'HUMO';
      }

    default:
      {
        return 'NFC';
      }
  }
}
