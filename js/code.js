const pdflib = require("pdf-lib")
const pdfjs = require("pdfjs-dist")
const JSZip = require("jszip")


class PDFSplitter {

    async init(filenamePrefix) {
        this.filenamePrefix = filenamePrefix
        this.fileCounter = 1
        this.resultZip = new JSZip()
    }

    async addPage(pdfDocument, pageIndex, rotation) {
        let page = await pdflib.PDFDocument.create()
        let doc = await pdflib.PDFDocument.load(pdfDocument.documentBytes)
        let [copiedPage] = await page.copyPages(doc, [pageIndex])
        if (rotation != 0) {
            copiedPage.setRotation(pdflib.degrees(copiedPage.getRotation() + rotation))
        }
        page.addPage(copiedPage)

        let pageData = await page.save()
        this.resultZip.file(this.filenamePrefix+this.fileCounter+".pdf", pageData, {binary : true})
        this.fileCounter++
    }

    async getZipUrl() {
        let blob = await this.resultZip.generateAsync({type: "blob"})
        let downloadUrl = URL.createObjectURL(blob)
        return downloadUrl
    }
}

class PDFMerger {
    async init() {
        this.resultPdf = await pdflib.PDFDocument.create()
    }

    async addPages(pdfDocument, pages, rotation) {
        let doc = await pdflib.PDFDocument.load(pdfDocument.documentBytes)
        let copiedPages = await this.resultPdf.copyPages(doc, pages)
        
        for (let i = 0; i < copiedPages.length; i++) {
            let copiedPage = copiedPages[i]
            if (rotation != 0) {
                copiedPage.setRotation(pdflib.degrees(copiedPage.getRotation() + rotation))
            }
            this.resultPdf.addPage(copiedPage)
        }
    }

    async getResultUrl() {
        let pdfData = await this.resultPdf.save()
        let blob = new Blob([pdfData], {type : "application/pdf"})
        let downloadUrl = URL.createObjectURL(blob)
        return downloadUrl
    }
}

class PDFDocument {
    
    async init(documentBytes) {
        this.documentBytes = documentBytes
        this.pdfjsDoc = await pdfjs.getDocument({data: documentBytes}).promise
        this.pageCount = this.pdfjsDoc.numPages
    }

    async getPageImageUrl(pageIndex, scale = 1) {
        let page = await this.pdfjsDoc.getPage(pageIndex)
        let viewport = page.getViewport({"scale" : scale})
        let canvas = document.createElement("canvas")
        canvas.height = viewport.height
        canvas.width = viewport.width
        await page.render({
            canvasContext : canvas.getContext("2d"),
            viewport : viewport
        }).promise

        return canvas.toDataURL()
    }

}

module.exports = {
    PDFDocument : PDFDocument,
    PDFMerger : PDFMerger,
    PDFSplitter : PDFSplitter
}