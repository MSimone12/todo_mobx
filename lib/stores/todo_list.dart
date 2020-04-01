import 'package:mobx/mobx.dart';
import 'package:todo_mobx/stores/todo.dart';

part 'todo_list.g.dart';


class TodoListStore = _TodoListBase with _$TodoListStore;

abstract class _TodoListBase with Store {

  @observable
  String title = '';

  @action
  void addTitle(String value) => title = value;

  @action
  void addTodo(){
    todos.insert(todos.length, Todo(title));
    title = '';
  }

  ObservableList<Todo> todos = ObservableList<Todo>();

  @action
  void removeTodo(int index){
    todos.removeAt(index);
  }

  @computed
  bool get isValid => title.isNotEmpty;

}