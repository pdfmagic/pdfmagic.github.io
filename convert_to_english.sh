#!/bin/bash

echo "🚀 بدء تحويل الملفات إلى الإنجليزية..."

FILES=("about.html" "contact.html" "blog.html" "privacy-policy.html" "terms.html")

for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        echo "📝 معالجة: $file"
        sed -i 's/<html lang="ar" dir="rtl">/<html lang="en" dir="ltr">/g' "$file"
        sed -i 's/الصفحة الرئيسية/Home/g' "$file"
        sed -i 's/من نحن/About Us/g' "$file"
        sed -i 's/اتصل بنا/Contact Us/g' "$file"
        sed -i 's/مقالات/Blog/g' "$file"
        sed -i 's/سياسة الخصوصية/Privacy Policy/g' "$file"
        sed -i 's/شروط الخدمة/Terms of Service/g' "$file"
        echo "✅ تم معالجة $file"
    fi
done

echo "✨ تم الانتهاء!"
