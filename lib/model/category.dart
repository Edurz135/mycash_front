class Category{
    int id;
    String name;
    String description;
    String icon_name;
    DateTime creationDate;
    DateTime modifiedDate;
    DateTime deletedDate;

    Category({
        required this.id,
        required this.name,
        required this.description,
        required this.icon_name,
        required this.creationDate,
        required this.modifiedDate,
        required this.deletedDate,
    });

    factory Category.fromJson(Map<String,dynamic> json){
        return Category(
            id: json['id'],
            name: json['name'],
            description: json['description'],
            icon_name: json['icon_name'],
            creationDate: DateTime.parse(json['creationDate']),
            modifiedDate: DateTime.parse(json['modifiedDate']),
            deletedDate: DateTime.parse(json['deletedDate']),
        );
    }
}