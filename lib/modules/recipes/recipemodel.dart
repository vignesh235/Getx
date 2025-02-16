class Dish {
  final String name;
  final String image;
  final double rating;
  final String description;
  final String hotelName;
  final bool isVeg;
  final String desc;

  Dish(
      {required this.name,
      required this.image,
      required this.rating,
      required this.description,
      required this.hotelName,
      required this.isVeg,
      required this.desc});

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
        name: json["name"],
        image: json["image"],
        rating: (json["rating"] as num).toDouble(),
        description: json["desc"],
        hotelName: json["hotelName"],
        isVeg: json["isVeg"] ?? false,
        desc: json["desc"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "image": image,
      "rating": rating,
      "description": description,
      "hotelName": hotelName,
      "isVeg": isVeg,
      "desc": desc
    };
  }
}
