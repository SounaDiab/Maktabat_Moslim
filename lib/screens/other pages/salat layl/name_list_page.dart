import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameListPage extends StatefulWidget {
  static String screenRoute = 'name_list_page_screen';
  const NameListPage({super.key});

  @override
  State<NameListPage> createState() => _NameListPageState();
}

class _NameListPageState extends State<NameListPage> {
  List<String> names = [];

  @override
  void initState() {
    super.initState();
    _loadNames();
  }

  Future<void> _loadNames() async {
    final prefs = await SharedPreferences.getInstance();
    final savedNames = prefs.getStringList('names') ?? [];
    setState(() {
      names = savedNames;
    });
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('names', names);
  }

  void _addName() {
    final nameController = TextEditingController();
    final positionController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('أدخل الاسم'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'الاسم'),
              ),
              TextField(
                controller: positionController,
                decoration:
                    const InputDecoration(labelText: 'الموقع (اختياري)'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final name = nameController.text.trim();
                final posText = positionController.text.trim();

                if (name.isNotEmpty) {
                  Navigator.of(ctx).pop(); // أغلق النافذة أولاً

                  int? position = int.tryParse(posText);
                  setState(() {
                    if (position != null &&
                        position > 0 &&
                        position <= names.length) {
                      names.insert(position - 1, name);
                    } else {
                      names.add(name);
                    }
                  });
                  _saveData(); // الحفظ بعد إغلاق النافذة
                }
              },
              child: const Text('إضافة'),
            ),
          ],
        );
      },
    );
  }

  void _removeName(int index) {
    setState(() {
      names.removeAt(index);
    });
    _saveData();
  }

  void _removeAllNames() {
    setState(() {
      names.clear();
    });
    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    double size = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isTablet ? 100 : 50,
        centerTitle: true,
        title: Text(
          'قائمة الأربعين مؤمن',
          style: TextStyle(
            fontSize: isTablet
                ? 40
                : size > 1.0
                    ? 20
                    : 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: Icon(
            Icons.arrow_back,
            size: isTablet ? 50 : 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _addName,
            icon: Icon(
              Icons.group_add_rounded,
              color: Colors.green,
              size: isTablet ? 50 : 25,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: isTablet ? 50 : 25,
            ),
            tooltip: 'مسح الكل',
            onPressed: () {
              if (names.isNotEmpty) {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('تأكيد'),
                    content: const Text('هل تريد حذف كل الأسماء؟'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('إلغاء'),
                      ),
                      TextButton(
                        onPressed: () {
                          _removeAllNames();
                          Navigator.pop(context);
                        },
                        child: const Text('نعم'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: names.isEmpty
          ? const Center(child: Text('لا توجد أسماء مضافة'))
          : ListView.builder(
              itemCount: names.length,
              itemBuilder: (_, i) => Card(
                color: Colors.white,
                margin: EdgeInsets.all(isTablet ? 5 : 2),
                child: ListTile(
                  leading: Text(
                    '${i + 1}',
                    style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.w800,
                      fontSize: isTablet ? 50 : 25,
                    ),
                  ),
                  title: Center(
                    child: Text(
                      '${names[i]}',
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                      size: isTablet ? 40 : 20,
                    ),
                    onPressed: () => _removeName(i),
                  ),
                ),
              ),
            ),
    );
  }
}
