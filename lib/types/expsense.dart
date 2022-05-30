class Expense {
  String title;
  int price;
  String description;
  String date;

  Expense(
      {required this.title,
      required this.price,
      required this.description,
      required this.date});

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
        title: json['title'],
        price: int.parse(json['price']),
        description: json['description'],
        date: json['date']);
  }
}
