import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdfmagic/data/pdf.dart';

part 'types.freezed.dart';

@freezed
class Document with _$Document {
  const factory Document({
    required PDFDocument pdf,
    required String thumbnailUrl,
    required int rotation
  }
  ) = _Document;
}

@freezed
class Page with _$Page {
  const factory Page({
    required PDFDocument pdf,
    required int page,
    required String? thumbnailUrl,
    required int rotation
  }
  ) = _Page;
}

@Freezed(makeCollectionsUnmodifiable: false)
class AppState with _$AppState {
  const factory AppState({
    required bool documentMode,
    required List<Document> documents,
    required List<Page> pages
  }
  ) = _AppState;

}