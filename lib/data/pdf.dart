@JS("window.pdf")
library pdf;

import 'dart:typed_data';

import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS("PDFSplitter")
class _PDFSplitter {
  external factory _PDFSplitter();
  external Object init(String filenamePrefix);
  external Object addPage(_PDFDocument document, int pageIndex, int rotation);
  external Object getZipUrl();
}

@JS("PDFDocument")
class _PDFDocument {
  external factory _PDFDocument();
  external Object init(ByteBuffer pdfBytes);
  external Object getPageImageUrl(int pageIndex, double scale);
  external int get pageCount;
}

@JS("PDFMerger")
class _PDFMerger {
  external factory _PDFMerger();
  external Object init();
  external Object addPages(_PDFDocument document, List<int> pages, int rotation);
  external Object getResultUrl();
}

class PDFSplitter {
  final _PDFSplitter _pdfSplitter;

  static Future<PDFSplitter> create(String filenamePrefix) async {
    PDFSplitter pdfSplitter = PDFSplitter._();
    await pdfSplitter._init(filenamePrefix);
    return pdfSplitter;
  }

  PDFSplitter._() : _pdfSplitter = _PDFSplitter();

  Future<void> _init(String filenamePrefix) =>
      promiseToFuture(_pdfSplitter.init(filenamePrefix));
  Future<void> addPage(PDFDocument doc, int pageIndex, int rotation) =>
      promiseToFuture(_pdfSplitter.addPage(doc._doc, pageIndex, rotation));
  Future<String> getZipUrl() => promiseToFuture(_pdfSplitter.getZipUrl());
}

class PDFDocument {
  final _PDFDocument _doc;

  static Future<PDFDocument> create(Uint8List pdfBytes) async {
    PDFDocument doc = PDFDocument._();
    await doc._init(pdfBytes);
    return doc;
  }

  PDFDocument._() : _doc = _PDFDocument();
  Future<void> _init(Uint8List pdfBytes) =>
      promiseToFuture(_doc.init(pdfBytes.buffer));
  Future<String> getPageImageUrl(int pageIndex, {double scale = 1}) =>
      promiseToFuture(_doc.getPageImageUrl(pageIndex, scale));
  int get pageCount => _doc.pageCount;
}

class PDFMerger {
  final _PDFMerger _merger;

  static Future<PDFMerger> create() async {
    PDFMerger merger = PDFMerger._();
    await merger._init();
    return merger;
  }

  PDFMerger._() : _merger = _PDFMerger();

  Future<void> _init() => promiseToFuture(_merger.init());

  /// add pages to the result pdf
  /// pages from 0 to n-1
  Future<void> addPages(PDFDocument doc, List<int> pages, int rotation) =>
      promiseToFuture(_merger.addPages(doc._doc, pages, rotation));

  Future<String> getResultUrl() => promiseToFuture(_merger.getResultUrl());
}
