import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_scanner/left/build_list_item.dart';
import '../model/receipt_model_4.dart';
import 'bloc/check_f_bloc.dart';

class BuildList extends StatefulWidget {
  final List<ReceiptModel4> list;
  final int selectedIndex;
  const BuildList({super.key, required this.list, required this.selectedIndex});

  @override
  State<BuildList> createState() => _BuildListState();
}

class _BuildListState extends State<BuildList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    CheckFBloc checkFBloc = BlocProvider.of(context);
    return widget.list.isEmpty
        ? const Center(
            child: Text('No Checks yet!'),
          )
        : ListView.builder(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.list.length + 1,
            itemBuilder: (context, index) {
              if (widget.list.length == index) {
                if (checkFBloc.pagesLength > checkFBloc.currentPage) {
                  return const CupertinoActivityIndicator(radius: 12);
                }
                return const SizedBox(height: 20);
              }
              final item = widget.list[index];
              return BuildListItem(
                receiptModel4: item,
                onPressed: () => checkFBloc.add(CheckFSelectCheckEvent(index)),
                isSelected: widget.selectedIndex == index,
              );
            },
          );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
