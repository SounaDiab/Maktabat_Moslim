import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../api/web service/json_service.dart';
import '../a3mal_layali_kadr_home_screen.dart';
import 'package:provider/provider.dart';

import '../../business logic/cubit/a3mal_laylat_alkader_cubit.dart';
import '../../widgets/line_from_index.dart';
import '../../widgets/search_widget.dart';
import '../search_provider.dart';
import 'a3mal layaly alkadr/al2iste3dad.dart';
import 'a3mal layaly alkadr/mawane3_alkoboul.dart';
import 'a3mal layaly alkadr/sawab_al2i7ya2.dart';

class A3malLayalyAlkadr extends StatefulWidget {
  static String screenRoute = 'a3mal_layaly_alkadr_screen';
  const A3malLayalyAlkadr({super.key});

  @override
  State<A3malLayalyAlkadr> createState() => _A3malLayalyAlkadrState();
}

class _A3malLayalyAlkadrState extends State<A3malLayalyAlkadr> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        final searchProvider =
            Provider.of<SearchProvider>(context, listen: false);
        final jsonService = JsonService();

        final kaderList = await jsonService.getA3malLaylatAlkader();

        final kaderSection = kaderList.firstWhere(
          (item) => item.title.contains('اعمال ليلة القدر'),
          orElse: () => throw Exception('لم يتم العثور على اعمال ليلة القدر'),
        );

        // نتأكد أن فيه فهرس داخلي (index أو subSections)
        final List<Map<String, dynamic>> mappedList = [];

        if (kaderSection.index.isNotEmpty) {
          for (var sub in kaderSection.index) {
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
    context.read<A3malLaylatAlkaderCubit>().getA3malLaylatAlkader();
  }

  Future<bool> _onWillPop() async {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.clearSearch();
    Navigator.of(context)
        .pushReplacementNamed(A3malLayaliKadrHomeScreen.screenRoute);
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
        body: BlocBuilder<A3malLaylatAlkaderCubit, A3malLaylatAlkaderState>(
          builder: (context, state) {
            if (state is A3malLaylatAlkaderLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is A3malLaylatAlkaderLoaded) {
              final a3malLaylatAlkader = state.items;
              final allTitles = <Map<String, dynamic>>[];
              final allRoutes = [
                Mawane3Alkoboul.screenRoute,
                SawabAl2i7ya2.screenRoute,
                Al2iste3dad.screenRoute
              ];
              for (var item in a3malLaylatAlkader) {
                if (item.title == "اعمال ليلة القدر") {
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
                      // final item = searchProvider.filteredItems[index];
                      final title = allTitles[i]['title'];
                      final route = allTitles[i]['route'];
                      return LineFromIndex(
                        text: title,
                        route: route,
                      );
                    },
                  ),
                ),
              );
            } else if (state is A3malLaylatAlkaderError) {
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
