enum MemberType { Premium, Gold, Silver, None }

// final Map<String, Map<MemberType, double>> DiscountRate = {
//   "Service": {
//     MemberType.Premium: 0.2,
//     MemberType.Gold: 0.15,
//     MemberType.Silver: 0.1
//   },
//   "Product": {
//     MemberType.Premium: 0.1,
//     MemberType.Gold: 0.1,
//     MemberType.Silver: 0.1
//   },
// };

class Customer {
  String? _name;
  bool _isMember = false;
  MemberType _memberType = MemberType.None;

  Customer(this._name);

  String? GetName() {
    return this._name;
  }

  bool get IsMember {
    return this._isMember;
  }

  void set IsMember(bool value) {
    this._isMember = value;
  }

  MemberType get GetMemberType {
    return this._memberType;
  }

  void set SetMemberType(MemberType value) {
    this._memberType = value;
    if (this._memberType != MemberType.None) {
      this._isMember = true;
    }
  }

  @override
  String toString() {
    return "Customer name: $_name, Member: ${_isMember ? "Yes" : "No"}, ${_memberType}";
  }
}

class Visit {
  Customer? _customer;
  String? _date;
  double _serviceExpense = 0.0;
  double _productExpense = 0.0;

  Visit(this._date);

  String? GetName() {
    return _customer?.GetName();
  }

  double GetServiceExpense() {
    return this._serviceExpense;
  }

  double GetProductExpense() {
    return this._productExpense;
  }

  void SetServiceExpense(double value) {
    this._serviceExpense = value;
  }

  void SetProductExpense(double value) {
    this._productExpense = value;
  }

  double GetTotalExpense() {
    return this._productExpense + this._serviceExpense;
  }

  @override
  String toString() {
    return "Visited Date: $_date, Total Expense: ${GetTotalExpense()}";
  }
}

class DiscountRate {
  double servicePremium = 0.2;
  double serviceGold = 0.15;
  double serviceSilver = 0.1;
}

void main(List<String> args) {
  // Custormers
  var cus1 = Customer("Ada");
  cus1.SetMemberType = MemberType.Premium;

  print(cus1.toString());
}
