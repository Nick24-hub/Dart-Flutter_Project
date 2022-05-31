class Expense {
  String title;
  String price;
  String category;
  String description;
  String date;

  Expense(
      {required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.date});

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
        title: json['title'],
        price: json['price'],
        category: json['category'],
        description: json['description'],
        date: json['date']);
  }
}
