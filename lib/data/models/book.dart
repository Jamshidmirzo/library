// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Book {
  String title;
  String author;
  int price;
  String image;
  int rating;
  String description;
  String janr;
  final String url;
  String savePath;
  double progress;
  bool isLoading;
  bool isDownloaded;
  Book({
    required this.title,
    required this.author,
    required this.price,
    required this.image,
    required this.rating,
    required this.description,
    required this.janr,
    required this.url,
    required this.savePath,
    required this.progress,
    required this.isLoading,
    required this.isDownloaded,
  });

  Book copyWith({
    String? title,
    String? author,
    int? price,
    String? image,
    int? rating,
    String? description,
    String? janr,
    String? url,
    String? savePath,
    double? progress,
    bool? isLoading,
    bool? isDownloaded,
  }) {
    return Book(
      title: title ?? this.title,
      author: author ?? this.author,
      price: price ?? this.price,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      janr: janr ?? this.janr,
      url: url ?? this.url,
      savePath: savePath ?? this.savePath,
      progress: progress ?? this.progress,
      isLoading: isLoading ?? this.isLoading,
      isDownloaded: isDownloaded ?? this.isDownloaded,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'price': price,
      'image': image,
      'rating': rating,
      'description': description,
      'janr': janr,
      'url': url,
      'savePath': savePath,
      'progress': progress,
      'isLoading': isLoading,
      'isDownloaded': isDownloaded,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      title: map['title'] as String,
      author: map['author'] as String,
      price: map['price'] as int,
      image: map['image'] as String,
      rating: map['rating'] as int,
      description: map['description'] as String,
      janr: map['janr'] as String,
      url: map['url'] as String,
      savePath: map['savePath'] as String,
      progress: map['progress'] as double,
      isLoading: map['isLoading'] as bool,
      isDownloaded: map['isDownloaded'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(title: $title, author: $author, price: $price, image: $image, rating: $rating, description: $description, janr: $janr, url: $url, savePath: $savePath, progress: $progress, isLoading: $isLoading, isDownloaded: $isDownloaded)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.author == author &&
      other.price == price &&
      other.image == image &&
      other.rating == rating &&
      other.description == description &&
      other.janr == janr &&
      other.url == url &&
      other.savePath == savePath &&
      other.progress == progress &&
      other.isLoading == isLoading &&
      other.isDownloaded == isDownloaded;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      author.hashCode ^
      price.hashCode ^
      image.hashCode ^
      rating.hashCode ^
      description.hashCode ^
      janr.hashCode ^
      url.hashCode ^
      savePath.hashCode ^
      progress.hashCode ^
      isLoading.hashCode ^
      isDownloaded.hashCode;
  }
}
