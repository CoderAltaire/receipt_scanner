import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipt_scanner/model/receipt_model_4.dart';
part 'check_f_event.dart';
part 'check_f_state.dart';

class CheckFBloc extends Bloc<CheckFEvent, CheckFState> {
  List<ReceiptModel4> checksList;
  List<ReceiptModel4> listt = [];
  String glPattern = '';
  int get pagesLength {
    if (total % limit == 0) {
      return total ~/ limit;
    }
    return total ~/ limit + 1;
  }

  int limit = 20;
  int total = 0;
  int currentPage = 1;
  ReceiptModel4? selectedCheck;
  List<ReceiptModel4> get getReceipts {
    listt.sort(((a, b) => b.date.compareTo(a.date)));
    return listt;
  }

  bool isOk = false;
  int selected = 0;
  CheckFBloc({required this.checksList})
      : selectedCheck = checksList.isEmpty ? null : checksList[0],
        listt = checksList,
        super(CheckFInitial(checksList.isEmpty ? null : checksList[0],
            selected: 0, checksList: checksList)) {
    on<CheckFSearchWhenOnChangeEvent>(_searchOnChanged);
    on<CheckFCallInitialEvent>(_callInitial);
    on<CheckFSelectCheckEvent>(_selectCheck);
    on<CheckFDateChangedEvent>(_dataChanged);
  }

  _selectCheck(CheckFSelectCheckEvent event, Emitter<CheckFState> emit) {
    selectedCheck = getReceipts[event.selected];
    selected = event.selected;
    emit(CheckFInitial(selectedCheck,
        selected: event.selected, checksList: getReceipts));
  }

  _callInitial(CheckFCallInitialEvent event, Emitter<CheckFState> emit) async {
    listt = checksList;
    currentPage = 1;
    total = 0;
    isOk = false;
    emit(CheckFInitial(checksList.isEmpty ? null : getReceipts[0],
        selected: 0, checksList: getReceipts));
  }

  _searchOnChanged(
      CheckFSearchWhenOnChangeEvent event, Emitter<CheckFState> emit) async {
    emit(CheckFLoadingState(CheckF.searching, selectedCheck));
    await Future.delayed(const Duration(milliseconds: 150));
    listt = [];
    listt = checksList
        .where((e) =>
            e.externalId.toLowerCase().contains(event.pattern.toLowerCase()))
        .toList();
    if (listt.isEmpty) {
      emit(ChecksFNotFoundState(selectedCheck));
      return;
    }
    selectedCheck = getReceipts[0];
    isOk = false;
    emit(CheckFInitial(getReceipts[0], selected: 0, checksList: getReceipts));
  }

  _dataChanged(CheckFDateChangedEvent event, Emitter<CheckFState> emit) {
    checksList = event.data;
    selected = 0;
    listt = checksList;
    selectedCheck = event.data.isEmpty ? null : getReceipts[0];
    isOk = false;
    emit(CheckFInitial(
      selectedCheck,
      selected: selected,
      checksList: getReceipts,
    ));
  }
}

enum CheckF { searching, other }
