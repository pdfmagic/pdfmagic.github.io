#!/data/data/com.termux/files/usr/bin/python3
import urllib.request
import urllib.parse

# URL موقعك
url = "https://pdfmagic.github.io"

# إرسال طلب ping لـ Bing (لازال شغال)
print("📤 جاري إعلام Bing...")
bing_url = f"http://www.bing.com/ping?sitemap={urllib.parse.quote(url + '/sitemap-final.xml')}"
try:
    response = urllib.request.urlopen(bing_url)
    print("✅ Bing تم إعلام")
except:
    print("⚠️  Bing لم يستجب")

# إرسال طلب ping لـ Google (لكن مش هينفع)
print("\n📤 محاولة إعلام Google...")
google_url = f"http://www.google.com/ping?sitemap={urllib.parse.quote(url + '/sitemap-final.xml')}"
try:
    response = urllib.request.urlopen(google_url)
    print("✅ Google تم إعلام (لكن مش مؤكد)")
except Exception as e:
    print(f"❌ Google Ping مش شغال: {e}")

print("\n🎯 الخطوات اليدوية المطلوبة:")
print("1. اذهب: https://search.google.com/search-console")
print("2. أدخل: https://pdfmagic.github.io")
print("3. اختر: URL Inspection")
print("4. REQUEST INDEXING")
print("5. انتظر 24 ساعة")
