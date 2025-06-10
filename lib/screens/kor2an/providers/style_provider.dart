// // قم بإنشاء style_provider.dart أو تعديل مزود موجود
// import 'package:flutter/material.dart';

// class StyleProvider with ChangeNotifier {
//   int _style = 1; // البداية بالنمط 1

//   int get style => _style;

//   void toggleStyle() {
//     // التبديل بين النمط 1 و 2
//     _style++;
//     if (_style > 4) {
//       _style = 1; // إذا كان النمط أكبر من 4، عد إلى 1
//     }
//     notifyListeners();
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StyleProvider with ChangeNotifier {
//   static const String STYLE_KEY = 'quran_style_key';
//   int _style = 1; // البداية بالنمط 1
//   bool _isInitialized = false;

//   StyleProvider() {
//     // تحميل النمط المحفوظ عند إنشاء المزود
//     loadSavedStyle();
//   }

//   int get style => _style;
//   bool get isInitialized => _isInitialized;

//   // تحميل النمط المحفوظ من التخزين المحلي
//   Future<void> loadSavedStyle() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final savedStyle = prefs.getInt(STYLE_KEY);

//       if (savedStyle != null && savedStyle >= 1 && savedStyle <= 4) {
//         _style = savedStyle;
//       }

//       _isInitialized = true;
//       notifyListeners();
//     } catch (e) {
//       print('خطأ في تحميل النمط المحفوظ: $e');
//       _isInitialized = true;
//       notifyListeners();
//     }
//   }

//   // حفظ النمط الحالي في التخزين المحلي
//   Future<void> _saveStyle() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setInt(STYLE_KEY, _style);
//     } catch (e) {
//       print('خطأ في حفظ النمط: $e');
//     }
//   }

//   // التبديل بين الأنماط
//   void toggleStyle() {
//     _style++;
//     if (_style > 4) {
//       _style = 1; // إذا كان النمط أكبر من 4، عد إلى 1
//     }
//     _saveStyle(); // حفظ النمط بعد التغيير
//     notifyListeners();
//   }

//   // تعيين نمط محدد
//   void setStyle(int newStyle) {
//     if (newStyle >= 1 && newStyle <= 4) {
//       _style = newStyle;
//       _saveStyle(); // حفظ النمط بعد التغيير
//       notifyListeners();
//     }
//   }

//   // الحصول على وصف النمط الحالي
//   String getStyleName() {
//     switch (_style) {
//       case 1:
//         return "النمط 1";
//       case 2:
//         return "النمط 2";
//       case 3:
//         return "النمط 3";
//       case 4:
//         return "النمط 4";
//       default:
//         return "النمط 1";
//     }
//   }
// }
