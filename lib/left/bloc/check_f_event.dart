part of 'check_f_bloc.dart';

abstract class CheckFEvent {}

class CheckFSearchWhenOnChangeEvent extends CheckFEvent {
  final String pattern;
  CheckFSearchWhenOnChangeEvent(this.pattern);
}

class CheckFSelectCheckEvent extends CheckFEvent {
  final int selected;
  CheckFSelectCheckEvent(this.selected);
}



class CheckFDateChangedEvent extends CheckFEvent {
  final List<ReceiptModel4> data;
  final int unsents;
  CheckFDateChangedEvent(this.data, this.unsents);
}

class CheckFCallInitialEvent extends CheckFEvent {}
