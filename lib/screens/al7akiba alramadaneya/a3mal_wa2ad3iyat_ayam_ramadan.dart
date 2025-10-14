import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/web service/json_service.dart';
import '../../business logic/cubit/alhakiba_alramadaneya_cubit.dart';
import '../al7akiba_alramadaneya_home_screen.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../widgets/line_from_index.dart';
import '../search_provider.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2al2awal.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2al3asher.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2al3ishroun.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2al5amis.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2al5amis_3ashar.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2al5amis_wal3ishrin.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2al7adi_3ashar.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2al7adi_wal3ishrin.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alrabi3.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alrabi3_3ashar.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alrabi3_wal3ishrin.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsabi3.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsabi3_3ashar.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsabi3_wal3ishrin.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsadis.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsadis_3ashar.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsadis_wal3ishrin.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsalasin.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsalis.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsalis_3ashar.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsalis_wal3ishrin.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsamen.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsamin_3ashar.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsamin_wal3ishrin.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsani.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsani_3ashar.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2alsani_wal3ishrin.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2altase3.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2altasi3_3ashar.dart';
import 'a3mal w2ad3iyat ayam ramadan/alyawm_2altasi3_wal3ishrin.dart';

class A3malWa2ad3iyatAyamRamadan extends StatefulWidget {
  static String screenRoute = 'a3mal_wa2ad3iyat_ayam_ramadan_screen';
  A3malWa2ad3iyatAyamRamadan({super.key});

  @override
  State<A3malWa2ad3iyatAyamRamadan> createState() =>
      _A3malWa2ad3iyatAyamRamadanState();
}

class _A3malWa2ad3iyatAyamRamadanState
    extends State<A3malWa2ad3iyatAyamRamadan> {
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
          (item) => item.title.contains('اعمال وادعية ايام رمضان'),
          orElse: () =>
              throw Exception('لم يتم العثور على اعمال وادعية ايام رمضان'),
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
    final searchProvider =
                  Provider.of<SearchProvider>(context, listen: false);
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
                Alyawm2al2awal.screenRoute,
                Alyawm2alsani.screenRoute,
                Alyawm2alsalis.screenRoute,
                Alyawm2alrabi3.screenRoute,
                Alyawm2al5amis.screenRoute,
                Alyawm2alsadis.screenRoute,
                Alyawm2alsabi3.screenRoute,
                Alyawm2alsamen.screenRoute,
                Alyawm2altase3.screenRoute,
                Alyawm2al3asher.screenRoute,
                Alyawm2al7adi3ashar.screenRoute,
                Alyawm2alsani3ashar.screenRoute,
                Alyawm2alsalis3ashar.screenRoute,
                Alyawm2alrabi33ashar.screenRoute,
                Alyawm2al5amis3ashar.screenRoute,
                Alyawm2alsadis3ashar.screenRoute,
                Alyawm2alsabi33ashar.screenRoute,
                Alyawm2alsamin3ashar.screenRoute,
                Alyawm2altasi33ashar.screenRoute,
                Alyawm2al3ishroun.screenRoute,
                Alyawm2al7adiWal3ishrin.screenRoute,
                Alyawm2alsaniWal3ishrin.screenRoute,
                Alyawm2alsalisWal3ishrin.screenRoute,
                Alyawm2alrabi3Wal3ishrin.screenRoute,
                Alyawm2al5amisWal3ishrin.screenRoute,
                Alyawm2alsadisWal3ishrin.screenRoute,
                Alyawm2alsabi3Wal3ishrin.screenRoute,
                Alyawm2alsaminWal3ishrin.screenRoute,
                Alyawm2altasi3Wal3ishrin.screenRoute,
                Alyawm2alsalasin.screenRoute,
              ];
              for (var item in alhakibaAlramadaneya) {
                if (item.title == 'اعمال وادعية ايام رمضان') {
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
