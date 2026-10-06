import '../../Util/app_imports.dart';

class DataSearch extends SearchDelegate<String> {
  final List<Map<String, dynamic>> items;

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
        FocusScope.of(context).unfocus();
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Map<String, dynamic>> results = items
        .where((item) => normalize(item['title']!.toLowerCase())
            .contains(normalize(query.toLowerCase())))
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
            final route = results[index]['route'];
            print('result tapped: $route');
            close(context, '');
            Future.delayed(Duration(milliseconds: 200), () {
              Navigator.pushNamed(context, route);
            });
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Map<String, dynamic>> suggestions = items
        .where((item) => normalize(item['title']!.toLowerCase())
            .contains(normalize(query.toLowerCase())))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]['title']!),
          onTap: () {
            query = suggestions[index]['title']!;
            showResults(context);
            print('query: $query');
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
