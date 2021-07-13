class Post {
  final String imagePath;
  final String name;
  final String place;
  final String ket;
  final String jenis;

  const Post({
      this.imagePath,
      this.name,
      this.place,
      this.ket,
      this.jenis,
  });

  Post copy({
   String name,
   String imagePath,
   String place,
   String ket,
   String jenis,
  }) =>
    Post(
      imagePath: imagePath ?? this.imagePath,
      name:  name ?? this.name,
      place: place ?? this.place,
      ket: ket ?? this.ket,
      jenis: jenis ?? this.jenis,
    );
  static Post fromJson(Map<String, dynamic> json) => Post(
    imagePath: json['imagePath'],
    name: json['name'],
    place: json['place'],
    ket: json['ket'],
    jenis: json['jenis'],
  );

  Map<String, dynamic> toJson() => {
    'imagePath': imagePath,
    'name': name,
    'place': place,
    'ket': ket,
    'jenis': jenis,
  };
}
