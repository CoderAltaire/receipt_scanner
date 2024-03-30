import 'package:flutter/material.dart';

import '../model/receipt_model_4.dart';

class BuildListItem extends StatelessWidget {
  const BuildListItem({
    super.key,
    required this.receiptModel4,
    required this.onPressed,
    required this.isSelected,
  });

  final ReceiptModel4 receiptModel4;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isUploaded = receiptModel4.uploaded;
    final isRefund = receiptModel4.isRefund;
    String paymentName = receiptModel4.payment.length > 2
        ? "mix"
        : (receiptModel4.payment.isEmpty
            ? "empty"
            : receiptModel4.payment.first.name);

    IconData iconData = Icons.money;
    if (paymentName == 'cash') {
      iconData = Icons.money;
    } else if (paymentName == 'mix') {
      iconData = Icons.blender;
    } else if (paymentName == 'gift') {
      iconData = Icons.card_giftcard;
    } else {
      iconData = Icons.credit_card;
    }
    final dateTime = DateTime.fromMillisecondsSinceEpoch(receiptModel4.date);
    final time = _storeTimeString(dateTime);
    return Column(
      children: [
        ListTile(
          onTap: onPressed,
          selected: isSelected,
          selectedTileColor: Theme.of(context).primaryColor.withOpacity(.3),
          hoverColor: Theme.of(context).primaryColor.withOpacity(.3),
          leading: Icon(
            iconData,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            receiptModel4.totalPrice.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            time,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          trailing: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isUploaded
                      ? const SizedBox(width: 0, height: 0)
                      : Icon(
                          Icons.error_outline,
                          color: Colors.red.shade900.withOpacity(.8),
                          size: 30,
                        ),
                  const SizedBox(width: 10),
                  Text(
                    receiptModel4.externalId,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              isRefund
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Refunt",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        receiptModel4.returnForCheck != ""
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  receiptModel4.returnForCheck,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              )
                            : const SizedBox(width: 0, height: 0),
                      ],
                    )
                  : const SizedBox(height: 0, width: 0),
            ],
          ),
        ),
        const Divider(height: 1)
      ],
    );
  }
}

String _storeTimeString(DateTime dateTime) {
  String t = '';
  if (dateTime.hour.toString().length != 1) {
    t += dateTime.hour.toString();
  } else {
    t += '0${dateTime.hour}';
  }
  t += ':';
  if (dateTime.minute.toString().length != 1) {
    t += dateTime.minute.toString();
  } else {
    t += '0${dateTime.minute}';
  }
  t += '   ';
  if (dateTime.day.toString().length != 1) {
    t += dateTime.day.toString();
  } else {
    t += '0${dateTime.day}';
  }
  t += '.';
  if (dateTime.month.toString().length != 1) {
    t += dateTime.month.toString();
  } else {
    t += '0${dateTime.month}';
  }
  t += '.${dateTime.year}';

  return t;
}
