import re

# قراءة الملف
with open('index.html', 'r', encoding='utf-8') as f:
    content = f.read()

# 1. إضافة رابط السايت ماب
if 'sitemap-final.xml' not in content:
    content = content.replace(
        '<meta charset="UTF-8">',
        '<meta charset="UTF-8">\n  <link rel="sitemap" type="application/xml" href="https://pdfmagic.github.io/sitemap-final.xml">'
    )

# 2. تحديث العنوان
content = re.sub(
    r'<title>.*?</title>',
    '<title>PDFMagic | بي دي اف ماجيك - تحويل PDF مجاني أونلاين | Free PDF Converter Online</title>',
    content
)

# 3. تحديث الوصف
content = re.sub(
    r'<meta name="description" content="[^"]*">',
    '<meta name="description" content="بي دي اف ماجيك - موقع تحويل PDF مجاني أونلاين. حوّل ملفات PDF إلى Word، Excel، JPG والعكس. دمج وتقسيم PDF بدون تسجيل. PDFMagic - Free online PDF converter. Convert PDF to Word, Excel, JPG and vice versa. Merge, split PDF without registration.">',
    content
)

# 4. تحديث og:title
content = re.sub(
    r'<meta property="og:title" content="[^"]*">',
    '<meta property="og:title" content="PDFMagic | بي دي اف ماجيك - تحويل PDF مجاني أونلاين">',
    content
)

# 5. تحديث og:description
content = re.sub(
    r'<meta property="og:description" content="[^"]*">',
    '<meta property="og:description" content="بي دي اف ماجيك - موقع تحويل PDF مجاني أونلاين. حوّل ملفات PDF إلى Word، Excel، JPG والعكس. دمج وتقسيم PDF بدون تسجيل.">',
    content
)

# 6. تحديث og:site_name
content = re.sub(
    r'<meta property="og:site_name" content="[^"]*">',
    '<meta property="og:site_name" content="PDFMagic">',
    content
)

# 7. تحديث twitter:title
content = re.sub(
    r'<meta name="twitter:title" content="[^"]*">',
    '<meta name="twitter:title" content="PDFMagic | بي دي اف ماجيك - تحويل PDF مجاني">',
    content
)

# 8. تحديث twitter:description
content = re.sub(
    r'<meta name="twitter:description" content="[^"]*">',
    '<meta name="twitter:description" content="بي دي اف ماجيك - موقع تحويل PDF مجاني أونلاين. حوّل ملفات PDF إلى Word، Excel، JPG والعكس. دمج وتقسيم PDF بدون تسجيل.">',
    content
)

# 9. تحديث author
content = re.sub(
    r'<meta name="author" content="[^"]*">',
    '<meta name="author" content="PDFMagic">',
    content
)

# 10. تحديث JSON-LD
content = content.replace('"name": "PDF Magic"', '"name": "PDFMagic | بي دي اف ماجيك"')

# حفظ الملف
with open('index.html', 'w', encoding='utf-8') as f:
    f.write(content)

print("✅ تم تحديث الميتاداتا بنجاح!")
