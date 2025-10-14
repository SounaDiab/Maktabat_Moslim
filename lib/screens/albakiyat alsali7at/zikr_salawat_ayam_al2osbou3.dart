import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/web service/json_service.dart';
import '../../business logic/cubit/albakiyat_alsalihat_cubit.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';
import '../../widgets/line_from_index.dart';
import '../albakiyat_alsali7at_home_screen.dart';
import '../search_provider.dart';
import 'zikr salawat ayam al2ousbou3/salat_yawm_al2a7add.dart';
import 'zikr salawat ayam al2ousbou3/salat_yawm_alsabtt.dart';
import 'zikr salawat ayam al2ousbou3/salat_yawm_al2isnainn.dart';
import 'zikr salawat ayam al2ousbou3/salat_yawm_alsoulasaa2.dart';
import 'zikr salawat ayam al2ousbou3/salat_yawm_al2arbi3aa2.dart';
import 'zikr salawat ayam al2ousbou3/salat_yawm_al5amiss.dart';
import 'zikr salawat ayam al2ousbou3/salat_yawm_aljom3aa.dart';

class ZikrSalawatAyamAl2osbou3 extends StatefulWidget {
  static String screenRoute = 'zikr_salawat_ayam_al2osbou3_screen';
  ZikrSalawatAyamAl2osbou3({super.key});

  @override
  State<ZikrSalawatAyamAl2osbou3> createState() =>
      _ZikrSalawatAyamAl2osbou3State();
}

class _ZikrSalawatAyamAl2osbou3State extends State<ZikrSalawatAyamAl2osbou3> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final searchProvider =
          Provider.of<SearchProvider>(context, listen: false);
      final jsonService = JsonService();

      final albakiyatList = await jsonService.getAlbakiyatAlsalihat();

      final albakiyatSection = albakiyatList.firstWhere(
        (item) => item.title.contains('ذكر صلوات ايام الاسبوع'),
        orElse: () =>
            throw Exception('لم يتم العثور على ذكر صلوات ايام الاسبوع'),
      );

      // نتأكد أن فيه فهرس داخلي (index أو subSections)
      final List<Map<String, dynamic>> mappedList = [];

      if (albakiyatSection.index.isNotEmpty) {
        for (var sub in albakiyatSection.index) {
          mappedList.add({
            'id': sub.id,
            'title': sub.title,
          });
        }
      }
      // تمرير الفهرس إلى SearchProvider
      searchProvider.setItems(mappedList);
    });
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(AlbakiyatAlsali7atHomeScreen.screenRoute);
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
        body: BlocBuilder<AlbakiyatAlsalihatCubit, AlbakiyatAlsalihatState>(
          builder: (context, state) {
            if (state is AlbakiyatAlsalihatLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlbakiyatAlsalihatLoaded) {
              final albakiyatAlsalihat = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                SalatYawmAlsabtt.screenRoute,
                SalatYawmAl2a7add.screenRoute,
                SalatYawmAl2isnainn.screenRoute,
                SalatYawmAlsoulasaa2.screenRoute,
                SalatYawmAl2arbi3aa2.screenRoute,
                SalatYawmAl5amiss.screenRoute,
                SalatYawmAljom3aa.screenRoute,
              ];
              for (var item in albakiyatAlsalihat) {
                if (item.title == 'ذكر صلوات ايام الاسبوع') {
                  for (var subItem in item.index) {
                    allTitles.add({
                      'title': subItem.title,
                      'route': allRoutes.map((e) => e).toList()[subItem.id - 1],
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
            } else if (state is AlbakiyatAlsalihatError) {
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
