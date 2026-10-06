import '../../Util/app_imports.dart';

class RamadanSchedulePage extends StatelessWidget {
  static String screenRoute = 'ramadan_schedule_page';
  const RamadanSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BlocBuilder<RamadanCubit, RamadanState>(builder: (context, state) {
        if (state is RamadanLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is RamadanLoaded) {
          return Column(
            children: [
              _Header(),
              _TableHeader(),
              Expanded(
                child: _TableBody(),
              ),
            ],
          );
        } else if (state is RamadanError) {
          return Center(
            child: Text(state.message),
          );
        }
        return const SizedBox();
      }),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).primaryColor, Theme.of(context).cardColor],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 30),
          Text(
            "رمضان كريم",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "إمساكية شهر رمضان المبارك لسنة 1447 هجرية - 2026 ميلادية لمنطقة بيروت",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: const [
          _HeaderCell("اليوم", flex: 2),
          _HeaderCell("الإمساك", flex: 2),
          _HeaderCell("الفجر", flex: 2),
          _HeaderCell("الشروق", flex: 2),
          _HeaderCell("الظهر", flex: 2),
          // _HeaderCell("العصر", flex: 2),
          _HeaderCell("المغرب", flex: 2),
          // _HeaderCell("العشاء", flex: 2),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String title;
  final int flex;
  const _HeaderCell(this.title, {this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).indicatorColor,
          fontWeight: FontWeight.w900,
          fontSize: 10,
        ),
      ),
    );
  }
}

class _TableBody extends StatefulWidget {
  @override
  State<_TableBody> createState() => _TableBodyState();
}

class _TableBodyState extends State<_TableBody> {
  int? selectedIndex;

  void _onLongPress(int index) {
    setState(() {
      selectedIndex = selectedIndex == index ? null : index;
    });

    if (selectedIndex == index) {
      final day =
          (context.read<RamadanCubit>().state as RamadanLoaded).days[index];
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'تم تحديد ${day.weekday} - ${day.hijriDate} رمضان',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Theme.of(context).iconTheme.color,
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RamadanCubit, RamadanState>(
      builder: (context, state) {
        if (state is RamadanLoaded) {
          return ListView.builder(
            itemCount: state.days.length,
            itemBuilder: (context, index) {
              final day = state.days[index];
              final isFriday = day.weekday == "الجمعة";
              final isSelected = selectedIndex == index;

              return GestureDetector(
                onLongPress: () => _onLongPress(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).iconTheme.color
                        : (isFriday
                            ? Theme.of(context).canvasColor
                            : Theme.of(context).cardColor),
                    border: isSelected
                        ? Border.all(
                            color: Theme.of(context).iconTheme.color!, width: 2)
                        : Border(
                            top: BorderSide(
                                color: Theme.of(context).canvasColor,
                                width: 1)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          _DateCell(
                            weekday: day.weekday,
                            gregorianDate: day.gregorianDate,
                            hijriDate: day.hijriDate,
                            isSelected: isSelected,
                          ),
                          _Cell(day.imsak, isSelected: isSelected),
                          _Cell(day.fajr, isSelected: isSelected),
                          _Cell(day.sunrise, isSelected: isSelected),
                          _Cell(day.dhuhr, isSelected: isSelected),
                          // _Cell(day.asr, isSelected: isSelected),
                          _Cell(day.maghrib, isSelected: isSelected),
                          // _Cell(day.isha, isSelected: isSelected),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class _DateCell extends StatelessWidget {
  final String weekday;
  final String gregorianDate;
  final String hijriDate;
  final bool isSelected;

  const _DateCell({
    required this.weekday,
    required this.gregorianDate,
    required this.hijriDate,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Text(
            weekday,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w900,
              color: isSelected
                  ? Theme.of(context).cardColor
                  : Theme.of(context).indicatorColor,
            ),
          ),
          SizedBox(height: 2),
          Text(
            gregorianDate,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: isSelected
                  ? Theme.of(context).cardColor
                  : Theme.of(context).indicatorColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            hijriDate,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              color: isSelected
                  ? Theme.of(context).cardColor
                  : Theme.of(context).indicatorColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  final String text;
  final bool isSelected;

  const _Cell(this.text, {this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isSelected ? 13 : 12,
          color: isSelected
              ? Theme.of(context).cardColor
              : Theme.of(context).indicatorColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
