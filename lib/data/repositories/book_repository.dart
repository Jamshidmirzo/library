import 'package:lesson88_upload_download/data/models/book.dart';

class BookRepository {
  List<Book> books = [
    Book(
        title: 'Harry Potter',
        author: 'J.K.Rowling',
        price: 123,
        image:
            'https://musicart.xboxlive.com/7/5dbd5100-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080',
        rating: 4,
        description:
            'Id duis eiusmod voluptate anim consectetur nostrud amet Ea aliquip exercitation cillum occaecat irure labore.Pariatur dolore dolore laborum sunt.',
        janr: 'Fantacy',
        url: 'url',
        savePath: 'savePath',
        progress: 1,
        isLoading: false,
        isDownloaded: false),
    Book(
        title: 'O`tkan kunlar',
        author: 'Abdulla Qodiriy',
        price: 123,
        image: 'https://kitobxon.com/img_knigi/969.jpg',
        rating: 4,
        description:
            'Id duis eiusmod voluptate anim consectetur nostrud ametSint esse reprehenderit nulla cillum elit adipisicing.Anim irure do anim fugiat dolore culpa ullamco est cupidatat magna nisi esse.Enim aliquip mollit cillum sunt qui ea ipsum laboris adipisicing voluptate.',
        janr: 'Fantacy',
        url: 'url',
        savePath: 'savePath',
        progress: 1,
        isLoading: false,
        isDownloaded: false),
  ];
}
