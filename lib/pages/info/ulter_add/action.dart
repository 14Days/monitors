import 'package:fish_redux/fish_redux.dart';

enum FilterAddAction { action, onAddFilter }

class FilterAddActionCreator {
  static Action onAction() {
    return const Action(FilterAddAction.action);
  }
  static Action onAddFilter() {
    return const Action(FilterAddAction.onAddFilter);
  }
}
