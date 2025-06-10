import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/search_provider.dart';

class SearchWidget extends StatefulWidget {
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          setState(() {});
          Provider.of<SearchProvider>(context, listen: false).search(value);
        },
        onTapOutside: (value) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          labelText: "ابحث...",
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            size: isTablet ? 40 : 20,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _controller.clear();
                    Provider.of<SearchProvider>(context, listen: false)
                        .search('');
                    FocusScope.of(context).unfocus();
                    setState(() {});
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.clear,
                      size: isTablet ? 40 : 20,
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final List<Map<String, String>> items;

  DataSearch(this.items);

  @override
  List<Widget> buildActions(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          size: isTablet ? 40 : 20,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: isTablet ? 40 : 20,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, String>> results = items
        .where((item) =>
            item['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    if (results.isEmpty) {
      return Center(
        child: Text("لم يتم العثور على نتائج"),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]['title']!),
          onTap: () {
            Navigator.pushNamed(context, results[index]['route']!);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, String>> suggestions = items
        .where((item) =>
            item['title']!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]['title']!),
          onTap: () {
            query = suggestions[index]['title']!;
            showResults(context);
          },
          subtitle: SizedBox(
            height: 20,
            width: double.infinity,
            child: Divider(),
          ),
        );
      },
    );
  }
}
