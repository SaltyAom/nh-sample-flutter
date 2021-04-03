import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';

@immutable
class Hentai {
  final bool? success;
  final String? info;
  final HentaiData? data;

  const Hentai({
    this.success,
    this.info,
    this.data,
  });

  factory Hentai.fromJson(Map<String, dynamic> json) => Hentai(
        success: json['success'],
        info: json['info'],
        data: json['data'] != null ? HentaiData.fromJson(json['data']) : null,
      );
}

@immutable
class HentaiData {
  final int? id;
  final HentaiTitle? title;
  final HentaiInfo? info;
  final HentaiMetadata? metadata;
  final HentaiImages? images;

  const HentaiData({
    this.id,
    this.title,
    this.info,
    this.metadata,
    this.images,
  });

  factory HentaiData.fromJson(Map<String, dynamic> json) => HentaiData(
        id: json['id'],
        title:
            json['title'] != null ? HentaiTitle.fromJson(json['title']) : null,
        info: json['info'] != null ? HentaiInfo.fromJson(json['info']) : null,
        metadata: json['metadata'] != null
            ? HentaiMetadata.fromJson(json['metadata'])
            : null,
        images: json['images'] != null
            ? HentaiImages.fromJson(json['images'])
            : null,
      );
}

@immutable
class HentaiTitle {
  final String? display;
  final String? english;
  final String? japanese;

  const HentaiTitle({
    this.display,
    this.english,
    this.japanese,
  });

  factory HentaiTitle.fromJson(Map<String, dynamic> json) => HentaiTitle(
        display: json['display'],
        english: json['english'],
        japanese: json['japanese'],
      );
}

@immutable
class HentaiInfo {
  final int? amount;
  final int? favorite;
  final HentaiUpload? upload;

  const HentaiInfo({
    this.amount,
    this.favorite,
    this.upload,
  });

  factory HentaiInfo.fromJson(Map<String, dynamic> json) => HentaiInfo(
        amount: json['amount'],
        favorite: json['favorite'],
        upload: json['upload'] != null
            ? HentaiUpload.fromJson(json['upload'])
            : null,
      );
}

@immutable
class HentaiUpload {
  final int? original;
  final String? parsed;

  const HentaiUpload({
    this.original,
    this.parsed,
  });

  factory HentaiUpload.fromJson(Map<String, dynamic> json) => HentaiUpload(
        original: json['original'],
        parsed: json['parsed'],
      );
}

@immutable
class HentaiMetadata {
  final HentaiTag? artist;
  final String? language;
  final List<HentaiTag>? tags;

  const HentaiMetadata({
    this.artist,
    this.language,
    this.tags,
  });

  factory HentaiMetadata.fromJson(Map<String, dynamic> json) => HentaiMetadata(
        artist:
            json['artist'] != null ? HentaiTag.fromJson(json['artist']) : null,
        language: json['language'],
        tags: json['tags'] is List<dynamic>
            ? json['tags']
                .map<HentaiTag>((tag) => HentaiTag.fromJson(tag))
                .toList()
            : null,
      );
}

@immutable
class HentaiTag {
  final String? name;
  final int? count;

  const HentaiTag({
    this.name,
    this.count,
  });

  factory HentaiTag.fromJson(Map<String, dynamic> json) => HentaiTag(
        name: json['name'],
        count: json['count'],
      );
}

@immutable
class HentaiImages {
  final HentaiPage? cover;
  final List<HentaiPage>? pages;

  const HentaiImages({
    this.cover,
    this.pages,
  });

  factory HentaiImages.fromJson(Map<String, dynamic> json) {
    return HentaiImages(
      cover: json['cover'] != null ? HentaiPage.fromJson(json['cover']) : null,
      pages: json['pages'] is List<dynamic>
          ? json['pages']
              .map<HentaiPage>((page) => HentaiPage.fromJson(page))
              .toList()
          : null,
    );
  }
}

@immutable
class HentaiPage {
  final String? link;
  final HentaiPageInfo? info;

  const HentaiPage({
    this.link,
    this.info,
  });

  factory HentaiPage.fromJson(Map<String, dynamic> json) => HentaiPage(
        link: json['link'],
        info:
            json['info'] != null ? HentaiPageInfo.fromJson(json['info']) : null,
      );
}

@immutable
class HentaiPageInfo {
  final String type;
  final int width;
  final int height;

  const HentaiPageInfo({
    required this.type,
    required this.width,
    required this.height,
  });

  factory HentaiPageInfo.fromJson(Map<String, dynamic> json) => HentaiPageInfo(
        type: json['type'],
        width: json['width'],
        height: json['height'],
      );
}
