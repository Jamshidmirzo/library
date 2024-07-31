import 'package:lesson88_upload_download/data/models/file_model.dart';

class FileRepository {
  List<FileModel> files = [
    FileModel(
      title: "Harry Potter Image",
      url:
          "https://cdn.i-scmp.com/sites/default/files/d8/images/canvas/2021/04/01/e252df62-7619-42c9-9a1b-419fae44ea74_98c54a39.jpg",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    FileModel(
      title: "Harry Potter PDF",
      url:
          "https://vidyaprabodhinicollege.edu.in/VPCCECM/ebooks/ENGLISH%20LITERATURE/Harry%20potter/(Book%207)%20Harry%20Potter%20And%20The%20Deathly%20Hallows.pdf",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
    FileModel(
      title: "Harry Potter Video",
      url:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      savePath: "",
      progress: 0,
      isLoading: false,
      isDownloaded: false,
    ),
  ];
}
