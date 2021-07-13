class User {
  final String imagePath;
  final String name;
  final String job;
  final String alamat;
  final String email;
  final String nomor;
  final String jenis;

  const User({
      this.imagePath,
      this.name,
      this.job,
      this.alamat,
      this.email,
      this.nomor,
      this.jenis,
  });

  User copy({
   String name,
   String job,
   String email,
   String imagePath,
   String alamat,
   String nomor,
   String jenis,
  }) =>
    User(
      imagePath: imagePath ?? this.imagePath,
      name:  this.name,
      job: this.job,
      email: this.email,
      alamat: alamat ?? this.alamat,
      nomor: nomor ?? this.nomor,
      jenis: jenis ?? this.jenis,
    );
  static User fromJson(Map<String, dynamic> json) => User(
    imagePath: json['imagePath'],
    name: json['name'],
    job: json['job'],
    email: json['email'],
    alamat: json['alamat'],
    nomor: json['nomor'],
    jenis: json['jenis'],
  );

  Map<String, dynamic> toJson() => {
    'imagePath': imagePath,
    'name': name,
    'job': job,
    'email': email,
    'alamat': alamat,
    'nomor': nomor,
    'jenis': jenis,
  };
}
