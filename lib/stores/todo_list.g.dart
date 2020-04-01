// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoListStore on _TodoListBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$titleAtom = Atom(name: '_TodoListBase.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  final _$_TodoListBaseActionController =
      ActionController(name: '_TodoListBase');

  @override
  void addTitle(String value) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction();
    try {
      return super.addTitle(value);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo() {
    final _$actionInfo = _$_TodoListBaseActionController.startAction();
    try {
      return super.addTodo();
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(int index) {
    final _$actionInfo = _$_TodoListBaseActionController.startAction();
    try {
      return super.removeTodo(index);
    } finally {
      _$_TodoListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'title: ${title.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
