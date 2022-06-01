class Expense {
  String id;
  String title;
  String price;
  String category;
  String description;
  String date;
  String timestamp;

  Expense(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.date,
      required this.timestamp});

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
        id: json['id'],
        title: json['data']['title'],
        price: json['data']['price'],
        category: json['data']['category'],
        description: json['data']['description'],
        date: json['data']['date'],
        timestamp: json['data']['timestamp'].toString());
  }
}
