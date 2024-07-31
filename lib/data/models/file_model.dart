class FileModel {
  final String title;
  final String url;
  String savePath;
  double progress;
  bool isLoading;
  bool isDownloaded;

  FileModel({
    required this.title,
    required this.url,
    required this.savePath,
    required this.progress,
    required this.isLoading,
    required this.isDownloaded,
  });
}
