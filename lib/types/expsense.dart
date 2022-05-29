class Expense {
  final int id;
  String title;
  int price;
  String description;
  String date;

  Expense(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.date});

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        date: json['date']);
  }
}
