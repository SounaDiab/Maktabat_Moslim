import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/web service/json_service.dart';
import '../../business logic/cubit/alhakiba_alramadaneya_cubit.dart';
import '../al7akiba_alramadaneya_home_screen.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../widgets/line_from_index.dart';
import '../search_provider.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2al2oula.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2al5amisa_3ashar.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2al5amisa_wal3ishrin.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2al7adiya_wal3ishrin.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alrabi3a_3ashar.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alrabi3a_wal3ishrin.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alsabi3a_3ashar.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alsabi3a_wal3ishrin.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alsadisa_wal3ishrin.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alsalasin.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alsalisa_3ashar.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alsalisa_wal3ishrin.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alsamina_wal3ishrin.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2alsaniya_wal3ishrin.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2altasi3a_3ashar.dart';
import 'a3mal w2ad3iyat layali ramadan/allayla_2altasi3a_wal3ishrin.dart';

class A3malW2ad3iyatLayaliRamadan extends StatefulWidget {
  static String screenRoute = 'a3mal_wa2ad3iyat_layali_ramadan_screen';
  A3malW2ad3iyatLayaliRamadan({super.key});

  @override
  State<A3malW2ad3iyatLayaliRamadan> createState() =>
      _A3malW2ad3iyatLayaliRamadanState();
}

class _A3malW2ad3iyatLayaliRamadanState
    extends State<A3malW2ad3iyatLayaliRamadan> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();

        final hakibaList = await jsonService.getAlhakibaAlramadaneya();

        final hakibaSection = hakibaList.firstWhere(
          (item) => item.title.contains('اعمال وادعية ليالي رمضان'),
          orElse: () =>
              throw Exception('لم يتم العثور على اعمال وادعية ليالي رمضان'),
        );

        // نتأكد أن فيه فهرس داخلي (index أو subSections)
        final List<Map<String, dynamic>> mappedList = [];

        if (hakibaSection.index.isNotEmpty) {
          for (var sub in hakibaSection.index) {
            mappedList.add({
              'id': sub.id,
              'title': sub.title,
            });
          }
        }
        // تمرير الفهرس إلى SearchProvider
        searchProvider.setItems(mappedList);
      },
    );
    context.read<AlhakibaAlramadaneyaCubit>().getAlhakibaAlramadaneya();
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(Al7akibaAlramadaneyaHomeScreen.screenRoute);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: _onWillPop,
            icon: Icon(
              Icons.arrow_back,
              size: isTablet ? 50 : 25,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DataSearch(searchProvider.filteredItems),
                );
              },
              icon: Icon(
                Icons.search,
                size: isTablet ? 40 : 20,
              ),
            ),
          ],
        ),
        body: BlocBuilder<AlhakibaAlramadaneyaCubit, AlhakibaAlramadaneyaState>(
          builder: (context, state) {
            if (state is AlhakibaAlramadaneyaLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlhakibaAlramadaneyaLoaded) {
              final alhakibaAlramadaneya = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                Allayla2al2oula.screenRoute,
                Allayla2alsalisa3ashar.screenRoute,
                Allayla2alrabi3a3ashar.screenRoute,
                Allayla2al5amisa3ashar.screenRoute,
                Allayla2alsabi3a3ashar.screenRoute,
                Allayla2altasi3a3ashar.screenRoute,
                Allayla2al7adiyaWal3ishrin.screenRoute,
                Allayla2alsaniyaWal3ishrin.screenRoute,
                Allayla2alsalisaWal3ishrin.screenRoute,
                Allayla2alrabi3aWal3ishrin.screenRoute,
                Allayla2al5amisaWal3ishrin.screenRoute,
                Allayla2alsadisaWal3ishrin.screenRoute,
                Allayla2alsabi3aWal3ishrin.screenRoute,
                Allayla2alsaminaWal3ishrin.screenRoute,
                Allayla2altasi3aWal3ishrin.screenRoute,
                Allayla2alsalasin.screenRoute,
              ];
              for (var item in alhakibaAlramadaneya) {
                if (item.title == 'اعمال وادعية ليالي رمضان') {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': allRoutes
                          .map((e) => e)
                          .toList()[subItem.id - 1], // أو أي قيمة route مناسبة
                    });
                  }
                }
              }
              return SafeArea(
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allTitles.length,
                      itemBuilder: (context, i) {
                        final title = allTitles[i]['title'];
                        final route = allTitles[i]['route'];

                        return ListTile(
                          title: LineFromIndex(
                            text: title,
                            route: route,
                          ),
                        );
                      }),
                ),
              );
            } else if (state is AlhakibaAlramadaneyaError) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
