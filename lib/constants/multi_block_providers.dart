import '../../Util/app_imports.dart';

class MultiBlocProviders {
  late Widget child;
  late BuildContext context;
  MultiBlocProviders({required this.child, required this.context});
  MultiBlocProvider get MultiBloc {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (BuildContext context) =>
              A3malLaylatAlkaderCubit(Repository(JsonService()))
                ..getA3malLaylatAlkader(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) =>
              HerzAlmoujahidinCubit(Repository(JsonService()))
                ..getHerzAlmoujahidin(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) =>
              AlhakibaAlramadaneyaCubit(Repository(JsonService()))
                ..getAlhakibaAlramadaneya(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) =>
              MafatihAljinanCubit(Repository(JsonService()))
                ..getMafatihAljinan(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) =>
              AlbakiyatAlsalihatCubit(Repository(JsonService()))
                ..getAlbakiyatAlsalihat(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) =>
              Alsa7ifaAlsajadiyaCubit(Repository(JsonService()))
                ..getAlsa7ifaAlsajadiya(),
        ),
        BlocProvider(
          lazy: false,
          create: (BuildContext context) =>
              SalatLailCubit(Repository(JsonService()))..getSalatLail(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => HijriOffsetCubit(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) => RamadanCubit()..loadRamadan(),
        ),
        BlocProvider(
          lazy: false,
          create: (_) =>
              DailyContentCubit(Repository(JsonService()))..loadDailyContent(),
        ),
      ],
      child: child,
    );
  }
}
