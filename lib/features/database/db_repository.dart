abstract class DatabaseRepository<R> {
  Future addNewItem(R item);
  Future deleteItem(R item);
  Future updateItem(R item);
  Future readItem(R item);
  Future<List> readItems();
}
