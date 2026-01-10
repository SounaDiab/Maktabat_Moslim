import '../Util/app_imports.dart';


class Books extends StatefulWidget {
  static String screenRoute = 'books_screen';
  Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  Future<bool> _onWillPop() async {
    Navigator.of(context).pushReplacementNamed(WelcomeScreen.screenRoute);
    return false;
  }
  

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 70,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacementNamed(WelcomeScreen.screenRoute);
            },
            icon: Icon(
              Icons.arrow_back,
              size: isTablet ? 50 : 25,
            ),
          ),
          title: Text(
            'القرآن والأدعية',
            style: TextStyle(
              fontSize: isTablet ? 40 : 19,
              fontFamily: 'Tajawal',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
              ),
              itemCount: BooksItem.bookstitle.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(BooksItem.booksRoute[index]);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: isTablet ? 220 : 92,
                        height: isTablet ? 220 : 92,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(isTablet ? 30 : 15)),
                          border: Border.all(
                            color: Theme.of(context).iconTheme.color!,
                            width: isTablet ? 6 : 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                              Radius.circular(isTablet ? 24 : 12)),
                          child: Image(
                            image: AssetImage('${BooksItem.booksSrc[index]}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${BooksItem.bookstitle[index]}',
                        style: TextStyle(
                          fontSize: isTablet ? 24 : 9,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        bottomNavigationBar: AdBanner(
          adUnitId: 'ca-app-pub-9302649846832207/7118789062',
        ),
      ),
    );
  }
}
