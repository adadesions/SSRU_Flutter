class Book {
  String? _name;
  Author? _author;
  double? _price;
  int _qtyInStock = 0;

  // Constructors
  Book(this._name, this._author, this._price);
  Book.stock(this._name, this._author, this._price, this._qtyInStock);

  // Properties
  String? get Name {
    return _name;
  }

  void set Name(String? value) {
    _name = value;
    _name ??= "Unnamed";
  }

  Author? get BookAuthor {
    return _author;
  }

  void set BookAuthor(Author? value) {
    _author = value;
  }

  double? get Price {
    return _price;
  }

  void set Price(double? value) {
    _price = value;
  }

  int get QtyInStock {
    return _qtyInStock;
  }

  void set QtyInStock(int value) {
    _qtyInStock = value;
  }
}

class Author {
  String? _name;
  String? _email;
  Gender? _gender;

  Author(this._name, this._email, this._gender);
}

enum Gender { male, female }

void main(List<String> args) {
  var jk = Author("J.K Rolling", "jk@gmail.com", Gender.female);
  var book1 = Book.stock("Harry Pottor", jk, 350, 300);

  print(book1.Name);
}
