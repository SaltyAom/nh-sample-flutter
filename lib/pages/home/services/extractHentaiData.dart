import '../../../models/hentai.dart';

class ExtractedHentaiData {
  final String title;
  final String coverImage;
  final double coverRatio;

  final List<HentaiPage> pages;

  const ExtractedHentaiData({
    required this.title,
    required this.coverImage,
    required this.coverRatio,
    required this.pages,
  });
}

ExtractedHentaiData extractHentaiData(Hentai hentai) {
  final h = hentai.data!;

  final title = h.title!.display!;
  final cover = h.images!.cover!;

  final coverImage = cover.link!;
  final coverRatio = cover.info!.width / cover.info!.height;

  final pages = h.images!.pages!;

  return ExtractedHentaiData(
    title: title,
    coverImage: coverImage,
    coverRatio: coverRatio,
    pages: pages,
  );
}
