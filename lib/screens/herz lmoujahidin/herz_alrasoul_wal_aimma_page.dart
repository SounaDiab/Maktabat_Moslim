import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/web service/json_service.dart';
import '../../business logic/cubit/herz_almoujahidin_cubit.dart';
import '../herz_almoujahidin_home_screen.dart';
import '../../widgets/search_widget.dart';
import 'package:provider/provider.dart';

import '../../widgets/line_from_index.dart';
import '../search_provider.dart';
import 'herz_alimam_alaaskari_page.dart';
import 'herz_alimam_albaker_page.dart';
import 'herz_alimam_alhadi_page.dart';
import 'herz_alimam_alhassan_almojtaba_page.dart';
import 'herz_alimam_alhussein_page.dart';
import 'herz_alimam_ali_page.dart';
import 'herz_alimam_alkazem_page.dart';
import 'herz_alimam_almahdi_page.dart';
import 'herz_alimam_alrida_page.dart';
import 'herz_alimam_alsadek_page.dart';
import 'herz_alimam_mohamad_aljawad_page.dart';
import 'herz_alimam_zain_alaabidin_page.dart';
import 'herz_fatimat_alzahraa_page.dart';
import 'herz_rasoul_allah_page.dart';

class HerzAlrasoulWalAimmaPage extends StatefulWidget {
  static String screenRoute = 'herzalrasoulwalaimma_screen';
  const HerzAlrasoulWalAimmaPage({super.key});

  @override
  State<HerzAlrasoulWalAimmaPage> createState() =>
      _HerzAlrasoulWalAimmaPageState();
}

class _HerzAlrasoulWalAimmaPageState extends State<HerzAlrasoulWalAimmaPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final searchProvider =
          Provider.of<SearchProvider>(context, listen: false);
      final jsonService = JsonService();

      // تحميل كل بيانات حرز المجاهدين من الملف المضغوط
      final herzList = await jsonService.getHerzAlmoujahidin();

      // نبحث عن القسم الذي عنوانه "حرز الرسول ص والائمة ع"
      final rasoulSection = herzList.firstWhere(
        (item) => item.title.contains('حرز الرسول'),
        orElse: () =>
            throw Exception('لم يتم العثور على حرز الرسول ص والائمة ع'),
      );

      // نتأكد أن فيه فهرس داخلي (index أو subSections)
      final List<Map<String, dynamic>> mappedList = [];

      if (rasoulSection.index.isNotEmpty) {
        for (var sub in rasoulSection.index) {
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
        .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // double size = MediaQuery.of(context).textScaleFactor;
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
        body: BlocBuilder<HerzAlmoujahidinCubit, HerzAlmoujahidinState>(
          builder: (context, state) {
            if (state is HerzAlmoujahidinLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HerzAlmoujahidinLoaded) {
              final herzAlmoujahidin = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                HerzRasoulAllahPage.screenRoute,
                HerzAlimamAliPage.screenRoute,
                HerzFatimatAlzahraaPage.screenRoute,
                HerzAlimamAlhassanAlmojtabaPage.screenRoute,
                HerzAlimamAlhusseinPage.screenRoute,
                HerzAlimamZainAlaabidinPage.screenRoute,
                HerzAlimamAlbakerPage.screenRoute,
                HerzAlimamAlsadekPage.screenRoute,
                HerzAlimamAlkazemPage.screenRoute,
                HerzAlimamAlridaPage.screenRoute,
                HerzAlimamMohamadAljawadPage.screenRoute,
                HerzAlimamAlhadiPage.screenRoute,
                HerzAlimamAlaaskariPage.screenRoute,
                HerzAlimamAlmahdiPage.screenRoute,
              ];
              for (var item in herzAlmoujahidin) {
                for (var subItem in item.index) {
                  allTitles.add({
                    'title': subItem.title,
                    'route': allRoutes
                        .map((e) => e)
                        .toList()[subItem.id - 1], // أو أي قيمة route مناسبة
                  });
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
            } else if (state is HerzAlmoujahidinError) {
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
