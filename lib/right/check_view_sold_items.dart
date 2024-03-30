import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_scanner/edit/receipt_edit.dart';
import '../left/bloc/check_f_bloc.dart';

class CheckViewSoldItems extends StatelessWidget {
  const CheckViewSoldItems({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckFBloc, CheckFState>(
      builder: (context, state) {
        final orderedProducts = state.selectedCheck!.soldItemList;
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: orderedProducts.length,
          itemBuilder: (context, index) {
            final item = orderedProducts[index];

            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ReceiptEditPages(item: item);
                    },
                  ),
                );
              },
              contentPadding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      item.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                '${item.value % 1 == 0 ? item.value.toStringAsFixed(0) : item.value.toString()} * ${(item.price)}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              trailing: Text(
                (item.value * item.price).toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            );
          },
        );
      },
    );
  }
}
