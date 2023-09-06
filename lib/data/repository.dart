import 'package:file_picker/file_picker.dart';
import 'package:pdfmagic/data/pdf.dart';
import 'package:pdfmagic/data/types.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Repository {
  Future<List<PDFDocument>> addDocuments() async {
    FilePickerResult? selection = await FilePicker.platform.pickFiles(dialogTitle: "Dateien auswählen", withData: true, allowMultiple: true, 
    type: FileType.custom,
    allowedExtensions: ["pdf"]);
    if (selection == null || selection.files.isEmpty) return [];

    List<PDFDocument> documents = [];
    for (PlatformFile file in selection.files) {
      documents.add(await PDFDocument.create(file.bytes!));
    }

    return documents;
  }

  Future<void> mergeDocuments(List<Document> documents) async {
    PDFMerger merger = await PDFMerger.create();
    for (Document document in documents) {
      await merger.addPages(document.pdf, List.generate(document.pdf.pageCount, (index) => index), document.rotation);
    }
    String downloadUrl = await merger.getResultUrl();
    launchUrlString(downloadUrl);
  }

  Future<void> mergePages(List<Page> pages) async {
    PDFMerger merger = await PDFMerger.create();
    for (Page page in pages) {
      await merger.addPages(page.pdf, [page.page], page.rotation);
    }
    String downloadUrl = await merger.getResultUrl();
    launchUrlString(downloadUrl);
  }

  Future<void> zipDocumentsPages(List<Document> documents, {String prefix = "seite-"}) async {
    PDFSplitter pdfSplitter = await PDFSplitter.create(prefix);
    
    for(Document document in documents) {
      for (int i = 0; i < document.pdf.pageCount; i++) {
        await pdfSplitter.addPage(document.pdf, i, document.rotation);
      }
    }
    
    String downloadUrl = await pdfSplitter.getZipUrl();
    launchUrlString(downloadUrl);
  }

  Future<void> zipPages(List<Page> pages, {String prefix = "seite-"}) async {
    PDFSplitter pdfSplitter = await PDFSplitter.create(prefix);
    
    for(Page page in pages) {
      await pdfSplitter.addPage(page.pdf, page.page, page.rotation);
    
    }
    String downloadUrl = await pdfSplitter.getZipUrl();
    launchUrlString(downloadUrl);
  }
}