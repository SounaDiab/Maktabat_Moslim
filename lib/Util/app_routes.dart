import '../Util/app_imports.dart';

class AppRoutes {
  late Repository repository;
  late A3malLaylatAlkaderCubit a3malLaylatAlkaderCubit;
  AppRoutes() {
    repository = Repository(JsonService());
    a3malLaylatAlkaderCubit = A3malLaylatAlkaderCubit(repository);
  }
  static final Map<String, WidgetBuilder> routes = {
    WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
    FavoritesScreen.screenRoute: (context) => FavoritesScreen(
          favoritePages: [],
        ),
    Books.screenRoute: (context) => Books(),
    HerzAlmoujahidinHomeScreen.screenRoute: (context) =>
        HerzAlmoujahidinHomeScreen(),
    MafatihAljinanHomeScreen.screenRoute: (context) =>
        MafatihAljinanHomeScreen(),
    MawakitAlsalat.screenRoute: (context) => MawakitAlsalat(),
    // ! Salat Layl
    SalatAllayl.screenRoute: (context) => SalatAllayl(),
    SawabahaWaFawa2idaha.screenRoute: (context) => SawabahaWaFawa2idaha(),
    WaktahaWakaifyatiha.screenRoute: (context) => WaktahaWakaifyatiha(),
    Dou3aaBa3dSalatAlwater.screenRoute: (context) => Dou3aaBa3dSalatAlwater(),
    Dou3aa7azin.screenRoute: (context) => Dou3aa7azin(),
    Dou3a2SahmAllail.screenRoute: (context) => Dou3a2SahmAllail(),
    NameListPage.screenRoute: (context) => NameListPage(),
    // !
    ImsakiyaScreen.screenRoute: (context) => ImsakiyaScreen(),
    QiblaSalat.screenRoute: (context) => QiblaSalat(),
    TakwimScreen.screenRoute: (context) => TakwimScreen(),
    AboutUs.screenRoute: (context) => AboutUs(),
    //! HERZ AL MOUJAHIDIN
    AyatLkorsiPage.screenRoute: (context) => AyatLkorsiPage(),
    AlkafirounPage.screenRoute: (context) => AlkafirounPage(),
    AlikhlasPage.screenRoute: (context) => AlikhlasPage(),
    AlfalakPage.screenRoute: (context) => AlfalakPage(),
    AlnasPage.screenRoute: (context) => AlnasPage(),
    AyatListekfaaPage.screenRoute: (context) => AyatListekfaaPage(),
    DouaaIkhdaaRikabAljababiraPage.screenRoute: (context) =>
        DouaaIkhdaaRikabAljababiraPage(),
    DouaaLidafeaKaidAladowWsharohPage.screenRoute: (context) =>
        DouaaLidafeaKaidAladowWsharohPage(),
    HerzMostakhrajMenKitabAllahPage.screenRoute: (context) =>
        HerzMostakhrajMenKitabAllahPage(),
    AlhayakelSabeaPage.screenRoute: (context) => AlhayakelSabeaPage(),
    RokaatAljaybLilimamAlridaAalaihAlsalamPage.screenRoute: (context) =>
        RokaatAljaybLilimamAlridaAalaihAlsalamPage(),
    RokaatAljaybLilimamAlridaAalaihAlsalamPage.screenRoute: (context) =>
        RokaatAljaybLilimamAlridaAalaihAlsalamPage(),
    AawzaYataawazBihaAalaAlaadaaPage.screenRoute: (context) =>
        AawzaYataawazBihaAalaAlaadaaPage(),
    DouaaLilkhalasMenAlkatlPage.screenRoute: (context) =>
        DouaaLilkhalasMenAlkatlPage(),
    HerzLietikaaSilahAlaadowPage.screenRoute: (context) =>
        HerzLietikaaSilahAlaadowPage(),
    AyatAlhefzMenSaifAlaadowPage.screenRoute: (context) =>
        AyatAlhefzMenSaifAlaadowPage(),
    HerzAlimamAljawadPage.screenRoute: (context) => HerzAlimamAljawadPage(),
    AawzatAlnabiYawmWadiAlkoraPage.screenRoute: (context) =>
        AawzatAlnabiYawmWadiAlkoraPage(),
    AyatAlikhtifaaMenAlaadowPage.screenRoute: (context) =>
        AyatAlikhtifaaMenAlaadowPage(),
    DouaaLilihtijabAanBasarAlaadaaPage.screenRoute: (context) =>
        DouaaLilihtijabAanBasarAlaadaaPage(),
    DouaaLilihtijabPage.screenRoute: (context) => DouaaLilihtijabPage(),
    HerzAltajPage.screenRoute: (context) => HerzAltajPage(),
    HerzAlrasoulWalAimmaPage.screenRoute: (context) =>
        HerzAlrasoulWalAimmaPage(),
    HerzRasoulAllahPage.screenRoute: (context) => HerzRasoulAllahPage(),
    HerzAlimamAliPage.screenRoute: (context) => HerzAlimamAliPage(),
    HerzFatimatAlzahraaPage.screenRoute: (context) => HerzFatimatAlzahraaPage(),
    HerzAlimamAlhassanAlmojtabaPage.screenRoute: (context) =>
        HerzAlimamAlhassanAlmojtabaPage(),
    HerzAlimamAlhusseinPage.screenRoute: (context) => HerzAlimamAlhusseinPage(),
    HerzAlimamZainAlaabidinPage.screenRoute: (context) =>
        HerzAlimamZainAlaabidinPage(),
    HerzAlimamAlbakerPage.screenRoute: (context) => HerzAlimamAlbakerPage(),
    HerzAlimamAlsadekPage.screenRoute: (context) => HerzAlimamAlsadekPage(),
    HerzAlimamAlkazemPage.screenRoute: (context) => HerzAlimamAlkazemPage(),
    HerzAlimamAlridaPage.screenRoute: (context) => HerzAlimamAlridaPage(),
    HerzAlimamMohamadAljawadPage.screenRoute: (context) =>
        HerzAlimamMohamadAljawadPage(),
    HerzAlimamAlhadiPage.screenRoute: (context) => HerzAlimamAlhadiPage(),
    HerzAlimamAlaaskariPage.screenRoute: (context) => HerzAlimamAlaaskariPage(),
    HerzAlimamAlmahdiPage.screenRoute: (context) => HerzAlimamAlmahdiPage(),
    DouaaNadiAalyanMozhiraAlaajaibPage.screenRoute: (context) =>
        DouaaNadiAalyanMozhiraAlaajaibPage(),
    TesbihPage.screenRoute: (context) => TesbihPage(),
    TesbihatAlzahra2Page.screenRoute: (context) => TesbihatAlzahra2Page(),
    //!AL2AD3IYA AL MASHHOURA
    Ad3iyaMashhoura.screenRoute: (context) => Ad3iyaMashhoura(),
    DouaaAlaahd.screenRoute: (context) => DouaaAlaahd(),
    DouaaAlihtijab.screenRoute: (context) => DouaaAlihtijab(),
    DouaaZamanAlghaiba.screenRoute: (context) => DouaaZamanAlghaiba(),
    DouaaNodba.screenRoute: (context) => DouaaNodba(),
    DouaaMakarimAlakhlak.screenRoute: (context) => DouaaMakarimAlakhlak(),
    DouaaAlfaraj.screenRoute: (context) => DouaaAlfaraj(),
    Douaa3alkama.screenRoute: (context) => Douaa3alkama(),
    DouaaAlsabah.screenRoute: (context) => DouaaAlsabah(),
    DouaaAltawasol.screenRoute: (context) => DouaaAltawasol(),
    DouaaKomail.screenRoute: (context) => DouaaKomail(),
    DouaaAl3asharat.screenRoute: (context) => DouaaAl3asharat(),
    DouaaAlsimat.screenRoute: (context) => DouaaAlsimat(),
    DouaaAlmashlol.screenRoute: (context) => DouaaAlmashlol(),
    DouaaYastashir.screenRoute: (context) => DouaaYastashir(),
    DouaaAlmojir.screenRoute: (context) => DouaaAlmojir(),
    DouaaAl3adila.screenRoute: (context) => DouaaAl3adila(),
    DouaaAljawshanAlkabir.screenRoute: (context) => DouaaAljawshanAlkabir(),
    DouaaAljawshanAlsa8ir.screenRoute: (context) => DouaaAljawshanAlsa8ir(),
    DouaaAlkamous.screenRoute: (context) => DouaaAlkamous(),
    DouaaAlhazin.screenRoute: (context) => DouaaAlhazin(),
    //! TA3KIBAT AL SALAT
    Ta3kibat.screenRoute: (context) => Ta3kibat(),
    Ta3kibat3ama.screenRoute: (context) => Ta3kibat3ama(),
    Ta3kibAlsabah.screenRoute: (context) => Ta3kibAlsabah(
          route: Ta3kibAlsabah.screenRoute,
        ),
    Ta3kibAldohr.screenRoute: (context) => Ta3kibAldohr(),
    Ta3kibAl3asr.screenRoute: (context) => Ta3kibAl3asr(),
    Ta3kibAlma8rib.screenRoute: (context) => Ta3kibAlma8rib(),
    Ta3kibAl3isha2.screenRoute: (context) => Ta3kibAl3isha2(),
    //! ZIYARAT AL 2OUSBOU3
    ZiaratAl2osbou3.screenRoute: (context) => ZiaratAl2osbou3(),
    ZiaratAl2a7ad.screenRoute: (context) => ZiaratAl2a7ad(),
    ZiaratAl2isnain.screenRoute: (context) => ZiaratAl2isnain(),
    ZiaratAlsoulasa2.screenRoute: (context) => ZiaratAlsoulasa2(),
    ZiaratAl2arbi3a2.screenRoute: (context) => ZiaratAl2arbi3a2(),
    ZiaratAl5amis.screenRoute: (context) => ZiaratAl5amis(),
    ZiaratAljom3a.screenRoute: (context) => ZiaratAljom3a(),
    ZiaratAlsabt.screenRoute: (context) => ZiaratAlsabt(),
    //! @AD3IYAT AL 2OUSBO3
    Ad3iyatAl2osbo3.screenRoute: (context) => Ad3iyatAl2osbo3(),
    Dou3a2Al2a7ad.screenRoute: (context) => Dou3a2Al2a7ad(),
    Dou3a2Al2isnain.screenRoute: (context) => Dou3a2Al2isnain(),
    Dou3a2Alsoulasa2.screenRoute: (context) => Dou3a2Alsoulasa2(),
    Dou3a2Al2arbi3a2.screenRoute: (context) => Dou3a2Al2arbi3a2(),
    Dou3a2Al5amis.screenRoute: (context) => Dou3a2Al5amis(),
    Dou3a2Aljom3a.screenRoute: (context) => Dou3a2Aljom3a(),
    Dou3a2Alsabt.screenRoute: (context) => Dou3a2Alsabt(),
    //! 2A3MAL LAILAT 2AL JOM3A
    LailatAljom3aWnaharahaW2a3malaha.screenRoute: (context) =>
        LailatAljom3aWnaharahaW2a3malaha(),
    A3malLailatAljom3a.screenRoute: (context) => A3malLailatAljom3a(),
    A3malNaharAljom3a.screenRoute: (context) => A3malNaharAljom3a(),
    SalatAlnabi.screenRoute: (context) => SalatAlnabi(),
    SalatAmirAmo2minin.screenRoute: (context) => SalatAmirAmo2minin(),
    SalatAlsaidaAlzahraa.screenRoute: (context) => SalatAlsaidaAlzahraa(),
    SalatAl2imamAlhassan.screenRoute: (context) => SalatAl2imamAlhassan(),
    SalatAl2imamAlhussein.screenRoute: (context) => SalatAl2imamAlhussein(),
    SalatAl2imamZainAl3abidin.screenRoute: (context) =>
        SalatAl2imamZainAl3abidin(),
    SalatAl2imamAlbaker.screenRoute: (context) => SalatAl2imamAlbaker(),
    SalatAl2imamAlsadek.screenRoute: (context) => SalatAl2imamAlsadek(),
    SalatAl2imamAlkazem.screenRoute: (context) => SalatAl2imamAlkazem(),
    SalatAl2imamAlrida.screenRoute: (context) => SalatAl2imamAlrida(),
    SalatAl2imamAljawad.screenRoute: (context) => SalatAl2imamAljawad(),
    SalatAl2imamAlhadi.screenRoute: (context) => SalatAl2imamAlhadi(),
    SalatAl2imamAl3askari.screenRoute: (context) => SalatAl2imamAl3askari(),
    Salat2imamAlmahdi.screenRoute: (context) => Salat2imamAlmahdi(),
    //! MONAJAT
    Almonajat.screenRoute: (context) => Almonajat(),
    AlmonajatBelsafar.screenRoute: (context) => AlmonajatBelsafar(),
    AlmonajatBikashfAlzolm.screenRoute: (context) => AlmonajatBikashfAlzolm(),
    AlmonajatAlsha3baneya.screenRoute: (context) => AlmonajatAlsha3baneya(),
    MonajatAlta2ibin.screenRoute: (context) => MonajatAlta2ibin(),
    MonajatAlshakin.screenRoute: (context) => MonajatAlshakin(),
    MonajatAl5a2ifin.screenRoute: (context) => MonajatAl5a2ifin(),
    MonajatAlrajin.screenRoute: (context) => MonajatAlrajin(),
    MonajatAlra8ibin.screenRoute: (context) => MonajatAlra8ibin(),
    MonajatAlshakirin.screenRoute: (context) => MonajatAlshakirin(),
    MonajatAlmoti3inLillah.screenRoute: (context) => MonajatAlmoti3inLillah(),
    MonajatAlmoridin.screenRoute: (context) => MonajatAlmoridin(),
    MonajatAlmo7ebin.screenRoute: (context) => MonajatAlmo7ebin(),
    MonajatAlmotawasilin.screenRoute: (context) => MonajatAlmotawasilin(),
    MonajatAlmoftakirin.screenRoute: (context) => MonajatAlmoftakirin(),
    MonajatAl3arifin.screenRoute: (context) => MonajatAl3arifin(),
    MonajatAlzakirin.screenRoute: (context) => MonajatAlzakirin(),
    MonajatAlmo3tasimin.screenRoute: (context) => MonajatAlmo3tasimin(),
    MonajatAlzahidin.screenRoute: (context) => MonajatAlzahidin(),
    MonajatL2amirAlmo2minin.screenRoute: (context) => MonajatL2amirAlmo2minin(),
    SalasKalimat3anAmirAlmo2minin.screenRoute: (context) =>
        SalasKalimat3anAmirAlmo2minin(),
    //todo: A3MAL ASHHOR ALSANA
    A3malAshhorAlsana.screenRoute: (context) => A3malAshhorAlsana(),
    //! MOHARAM
    Moharam.screenRoute: (context) => Moharam(),
    FiA3malShaherMoharam.screenRoute: (context) => FiA3malShaherMoharam(),
    AllaylaAl2oula.screenRoute: (context) => AllaylaAl2oula(),
    AlyawmAl2awal.screenRoute: (context) => AlyawmAl2awal(),
    AlyawmAlsalis.screenRoute: (context) => AlyawmAlsalis(),
    AlyawmAltase3.screenRoute: (context) => AlyawmAltase3(),
    AllaylaAl3ashira.screenRoute: (context) => AllaylaAl3ashira(),
    AlyawmAl3asher.screenRoute: (context) => AlyawmAl3asher(),
    AlyawmAl5amesWal3eshroun.screenRoute: (context) =>
        AlyawmAl5amesWal3eshroun(),
    //! RAJAB
    Rajab.screenRoute: (context) => Rajab(),
    Al2a3malAl5asaBrajab.screenRoute: (context) => Al2a3malAl5asaBrajab(),
    AlyawmAl2awalMenRajab.screenRoute: (context) => AlyawmAl2awalMenRajab(),
    AllaylaAlsalisa3ashara.screenRoute: (context) => AllaylaAlsalisa3ashara(),
    AlyawmAlsalis3ashar.screenRoute: (context) => AlyawmAlsalis3ashar(),
    LailatAlnisfMenRajab.screenRoute: (context) => LailatAlnisfMenRajab(),
    YawmAlnisfMenRajab.screenRoute: (context) => YawmAlnisfMenRajab(),
    AlyawmAl5amesWal3ishroun.screenRoute: (context) =>
        AlyawmAl5amesWal3ishroun(),
    AllaylaAlsabi3aWal3eshroun.screenRoute: (context) =>
        AllaylaAlsabi3aWal3eshroun(),
    AlyawmAlsabe3Wal3eshroun.screenRoute: (context) =>
        AlyawmAlsabe3Wal3eshroun(),
    AlyawmAl2a5irMenAlshaher.screenRoute: (context) =>
        AlyawmAl2a5irMenAlshaher(),
    //! SHA3BAN
    Sha3ban.screenRoute: (context) => Sha3ban(),
    FiFadlShaherSha3ban.screenRoute: (context) => FiFadlShaherSha3ban(),
    AllaylaAl2oulaSha3ban.screenRoute: (context) => AllaylaAl2oulaSha3ban(),
    AlyawmAl2awalSha3ban.screenRoute: (context) => AlyawmAl2awalSha3ban(),
    AlyawmAlsalisSha3ben.screenRoute: (context) => AlyawmAlsalisSha3ben(),
    AllaylaAlsalisa3asharaSha3ban.screenRoute: (context) =>
        AllaylaAlsalisa3asharaSha3ban(),
    LaylatAlnisfMenSha3ben.screenRoute: (context) => LaylatAlnisfMenSha3ben(),
    YawmAlnisfMenSha3ben.screenRoute: (context) => YawmAlnisfMenSha3ben(),
    A3malMaBakyaMenAlshaher.screenRoute: (context) => A3malMaBakyaMenAlshaher(),
    //! RAMADAN
    Ramadan.screenRoute: (context) => Ramadan(),
    Da3awatAyamShaherRamadan.screenRoute: (context) =>
        Da3awatAyamShaherRamadan(),
    FiFadelShaherRamadanWa2a3maloh.screenRoute: (context) =>
        FiFadelShaherRamadanWa2a3maloh(),
    MaYa3omAllayaliWal2ayam.screenRoute: (context) => MaYa3omAllayaliWal2ayam(),
    MaYosta7ab2itanohFiLayaliShaherRamadan.screenRoute: (context) =>
        MaYosta7ab2itanohFiLayaliShaherRamadan(),
    DouaaAl2iftita7.screenRoute: (context) => DouaaAl2iftita7(),
    Fi2a3mal2asharShaherRamadan.screenRoute: (context) =>
        Fi2a3mal2asharShaherRamadan(),
    DouaaAbi7amzaAlsamali.screenRoute: (context) => DouaaAbi7amzaAlsamali(),
    DouaaAlsa7ar.screenRoute: (context) => DouaaAlsa7ar(),
    Fi2a3mal2ayamShaherRamadan.screenRoute: (context) =>
        Fi2a3mal2ayamShaherRamadan(),
    Fi2a3malShaherRamadanAl5asa.screenRoute: (context) =>
        Fi2a3malShaherRamadanAl5asa(),
    SalawatAllayaliWada3awatAl2ayamaAlmashhoura.screenRoute: (context) =>
        SalawatAllayaliWada3awatAl2ayamaAlmashhoura(),
    AllaylaAl2oulaRamadan.screenRoute: (context) => AllaylaAl2oulaRamadan(),
    AlyawmAl2awalRamadan.screenRoute: (context) => AlyawmAl2awalRamadan(),
    AlyawmAlsadisRamadan.screenRoute: (context) => AlyawmAlsadisRamadan(),
    AllaylaAlsalisa3asharRamadan.screenRoute: (context) =>
        AllaylaAlsalisa3asharRamadan(),
    AllaylaAlrabi3a3asharRamadan.screenRoute: (context) =>
        AllaylaAlrabi3a3asharRamadan(),
    AllaylaAl5amisa3asharRamadan.screenRoute: (context) =>
        AllaylaAl5amisa3asharRamadan(),
    YawmAlnisfMenRamadan.screenRoute: (context) => YawmAlnisfMenRamadan(),
    AllaylaAlsabi3a3asharaRamadan.screenRoute: (context) =>
        AllaylaAlsabi3a3asharaRamadan(),
    A3malAllailaAltasi3a3asharaRamadan.screenRoute: (context) =>
        A3malAllailaAltasi3a3asharaRamadan(),
    AllaylaAlwa7idaWal3ishrounRamadan.screenRoute: (context) =>
        AllaylaAlwa7idaWal3ishrounRamadan(),
    AlyawmAlwa7idWal3ishrounRamadan.screenRoute: (context) =>
        AlyawmAlwa7idWal3ishrounRamadan(),
    DouaaAllaylaAlsaniaWal3ishrounRamadan.screenRoute: (context) =>
        DouaaAllaylaAlsaniaWal3ishrounRamadan(),
    AllaylaAlsalisaWal3ishrounRamadan.screenRoute: (context) =>
        AllaylaAlsalisaWal3ishrounRamadan(),
    Dou3aaAllaylaAlrabi3aWal3ishrounRamadan.screenRoute: (context) =>
        Dou3aaAllaylaAlrabi3aWal3ishrounRamadan(),
    Dou3aaAllaylaAl5amisaWal3ishrounRamadan.screenRoute: (context) =>
        Dou3aaAllaylaAl5amisaWal3ishrounRamadan(),
    Dou3aaAllaylaAlsadisaWal3ishrounRamadan.screenRoute: (context) =>
        Dou3aaAllaylaAlsadisaWal3ishrounRamadan(),
    Dou3aaAllaylaAlsabi3aWal3ishrounRamadan.screenRoute: (context) =>
        Dou3aaAllaylaAlsabi3aWal3ishrounRamadan(),
    AllaylaAlsabi3aWal3ishrounRamadan.screenRoute: (context) =>
        AllaylaAlsabi3aWal3ishrounRamadan(),
    Dou3aaAllaylaAlsaminaWal3ishrounRamadan.screenRoute: (context) =>
        Dou3aaAllaylaAlsaminaWal3ishrounRamadan(),
    Dou3aaAllaylaAltasi3aWal3ishrounRamadan.screenRoute: (context) =>
        Dou3aaAllaylaAltasi3aWal3ishrounRamadan(),
    Dou3aaAllaylaAlsalasinRamadan.screenRoute: (context) =>
        Dou3aaAllaylaAlsalasinRamadan(),
    AlyawmAlsalasinRamadan.screenRoute: (context) => AlyawmAlsalasinRamadan(),
    //! SHAWAL
    Shawal.screenRoute: (context) => Shawal(),
    AllaylaAl2oulaShawal.screenRoute: (context) => AllaylaAl2oulaShawal(),
    A3malYawm3idAlfitr.screenRoute: (context) => A3malYawm3idAlfitr(),
    //! ZILHOJA
    ZiLhoja.screenRoute: (context) => ZiLhoja(),
    ZiyaratAmirAlmo2mininYawmAl8adir.screenRoute: (context) =>
        ZiyaratAmirAlmo2mininYawmAl8adir(),
    FiA3malShaherZilhoja.screenRoute: (context) => FiA3malShaherZilhoja(),
    AlyawmAl2awalZilhoja.screenRoute: (context) => AlyawmAl2awalZilhoja(),
    AlyawmAlsabi3Zilhoja.screenRoute: (context) => AlyawmAlsabi3Zilhoja(),
    AlyawmAlsaminZilhoja.screenRoute: (context) => AlyawmAlsaminZilhoja(),
    AllaylaAltasi3aZilhoja.screenRoute: (context) => AllaylaAltasi3aZilhoja(),
    AlyawmAltasi3Zilhoja.screenRoute: (context) => AlyawmAltasi3Zilhoja(),
    AllaylaAl3ashiraZilhoja.screenRoute: (context) => AllaylaAl3ashiraZilhoja(),
    AlyawmAl3ashirZilhoja.screenRoute: (context) => AlyawmAl3ashirZilhoja(),
    AlyawmAl5amis3asharZilhoja.screenRoute: (context) =>
        AlyawmAl5amis3asharZilhoja(),
    AllaylaAlsamina3asharaZilhoja.screenRoute: (context) =>
        AllaylaAlsamina3asharaZilhoja(),
    AlyawmAlsamin3asharZilhoja.screenRoute: (context) =>
        AlyawmAlsamin3asharZilhoja(),
    KhotbatAmirAlmo2mininTawmAl8adir.screenRoute: (context) =>
        KhotbatAmirAlmo2mininTawmAl8adir(),
    AlyawmAlrabi3Wal3ishrounZilhoja.screenRoute: (context) =>
        AlyawmAlrabi3Wal3ishrounZilhoja(),
    AlyawmAl5amisWal3ishrounZilhoja.screenRoute: (context) =>
        AlyawmAl5amisWal3ishrounZilhoja(),
    AlyawmAl2a5irMenZilhoja.screenRoute: (context) => AlyawmAl2a5irMenZilhoja(),
    //! BAKI 2ASHHOR ALSANA
    BakiAlsana.screenRoute: (context) => BakiAlsana(),
    FiShaherZilko3da.screenRoute: (context) => FiShaherZilko3da(),
    FiShaherSafar.screenRoute: (context) => FiShaherSafar(),
    FiShaherRabi3Al2awal.screenRoute: (context) => FiShaherRabi3Al2awal(),
    FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira.screenRoute: (context) =>
        FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira(),
    Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya.screenRoute:
        (context) => Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya(),

    //todo: A3MAL ALMASAJED WALZIYARAT
    A3malAlmasajedWalziyarat.screenRoute: (context) =>
        A3malAlmasajedWalziyarat(),
    ////! ADAB ALZIYARAT
    AdabAlziyarat.screenRoute: (context) => AdabAlziyarat(),
    FiAdabAlziyarat.screenRoute: (context) => FiAdabAlziyarat(),
    FiZikrAl2isted3a2.screenRoute: (context) => FiZikrAl2isted3a2(),
    ////! ZIYARAT AL NABI WALA2EMA
    ZiyaratAlnabiWalzahraaWal2a2ima.screenRoute: (context) =>
        ZiyaratAlnabiWalzahraaWal2a2ima(),
    ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3.screenRoute: (context) =>
        ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3(),
    ZiyaratAlnabi.screenRoute: (context) => ZiyaratAlnabi(),
    Ziyarat2a2imatBelbaki3.screenRoute: (context) => Ziyarat2a2imatBelbaki3(),
    ZikrSa2irAlziyarat.screenRoute: (context) => ZikrSa2irAlziyarat(),
    ZiyaratFatimaBent2asad.screenRoute: (context) => ZiyaratFatimaBent2asad(),
    ZiyaratHamza.screenRoute: (context) => ZiyaratHamza(),
    ZiyaratKobourAlshohada2.screenRoute: (context) => ZiyaratKobourAlshohada2(),
    ZikrAlmasajedAlmo3azama.screenRoute: (context) => ZikrAlmasajedAlmo3azama(),
    Alwada3.screenRoute: (context) => Alwada3(),
    ////! ZIYARAT AMIR ALMO2MININ
    KaifyatWziyaratAmirAlmo2minin.screenRoute: (context) =>
        KaifyatWziyaratAmirAlmo2minin(),
    FiFadlZiyaratihi.screenRoute: (context) => FiFadlZiyaratihi(),
    FiKaifiyatZiyaratihi.screenRoute: (context) => FiKaifiyatZiyaratihi(),
    Wada3Al2amir.screenRoute: (context) => Wada3Al2amir(),
    AlsaniyaMenAlziyarat.screenRoute: (context) => AlsaniyaMenAlziyarat(),
    AlsalisaMenAlziyarat.screenRoute: (context) => AlsalisaMenAlziyarat(),
    ////! MASJID AL KOUFA
    FadlLakoufaWmasjidoha.screenRoute: (context) => FadlLakoufaWmasjidoha(),
    FiFadlAlkoufaWamasjidouha.screenRoute: (context) =>
        FiFadlAlkoufaWamasjidouha(),
    A3malJami3Alkoufa.screenRoute: (context) => A3malJami3Alkoufa(),
    A3malDikatAlkada2WbaitAltast.screenRoute: (context) =>
        A3malDikatAlkada2WbaitAltast(),
    A3malBaitAltast.screenRoute: (context) => A3malBaitAltast(),
    ZikrAlsalatWaldou3aaFiWasatAlmasjid.screenRoute: (context) =>
        ZikrAlsalatWaldou3aaFiWasatAlmasjid(),
    A3malAl2ostwanaAlsabi3a.screenRoute: (context) => A3malAl2ostwanaAlsabi3a(),
    A3malAl2ostwanaAl5amisa.screenRoute: (context) => A3malAl2ostwanaAl5amisa(),
    AamalAl2ostwanaAlsalisa.screenRoute: (context) => AamalAl2ostwanaAlsalisa(),
    A3malBabAlfaraj.screenRoute: (context) => A3malBabAlfaraj(),
    SifatSalat.screenRoute: (context) => SifatSalat(),
    SifatSalatLil7aja.screenRoute: (context) => SifatSalatLil7aja(),
    A3malMi7rabAmirAlmo2minin.screenRoute: (context) =>
        A3malMi7rabAmirAlmo2minin(),
    MounajatAmirAlmo2minin.screenRoute: (context) => MounajatAmirAlmo2minin(),
    ZiyaratMouslimBen3akil.screenRoute: (context) => ZiyaratMouslimBen3akil(),
    ZiyaratHaniBen3orwa.screenRoute: (context) => ZiyaratHaniBen3orwa(),
    ////! MASJID AL SAHLA
    A3malMasjidAlsahla.screenRoute: (context) => A3malMasjidAlsahla(),
    A3malMasjedAlsahla.screenRoute: (context) => A3malMasjedAlsahla(),
    FiFadlMasjedAlsahla.screenRoute: (context) => FiFadlMasjedAlsahla(),
    AlsalatWaldouaaFiMasjedZaid.screenRoute: (context) =>
        AlsalatWaldouaaFiMasjedZaid(),
    ////! ZIYARAT AL HOUSSEIN
    ZiyaratAlhousseinWa2adabiha.screenRoute: (context) =>
        ZiyaratAlhousseinWa2adabiha(),
    Ziyarat3ashoraa.screenRoute: (context) => Ziyarat3ashoraa(),
    FiFadlZiyaratAlhussein.screenRoute: (context) => FiFadlZiyaratAlhussein(),
    Fima3alaAlza2irMora3atoh.screenRoute: (context) =>
        Fima3alaAlza2irMora3atoh(),
    AlziyaratAlmotlakaAl2oula.screenRoute: (context) =>
        AlziyaratAlmotlakaAl2oula(),
    AlziyaratAlmotlakaAlsaniya.screenRoute: (context) =>
        AlziyaratAlmotlakaAlsaniya(),
    AlziyaratAlmotlakaAlsalisa.screenRoute: (context) =>
        AlziyaratAlmotlakaAlsalisa(),
    AlziyaratAlmotlakaAlrabi3a.screenRoute: (context) =>
        AlziyaratAlmotlakaAlrabi3a(),
    AlziyaratAlmotlakaAl5amisa.screenRoute: (context) =>
        AlziyaratAlmotlakaAl5amisa(),
    AlziyaratAlmotlakaAlsadisa.screenRoute: (context) =>
        AlziyaratAlmotlakaAlsadisa(),
    AlziyaratAlmotlakaAlsabi3a.screenRoute: (context) =>
        AlziyaratAlmotlakaAlsabi3a(),
    ZiyaratAl3abasBen3ali.screenRoute: (context) => ZiyaratAl3abasBen3ali(),
    Al2oulaAlmo5asasa.screenRoute: (context) => Al2oulaAlmo5asasa(),
    AlsaniaAlmo5asasa.screenRoute: (context) => AlsaniaAlmo5asasa(),
    AlsalisaAlmo5asasa.screenRoute: (context) => AlsalisaAlmo5asasa(),
    Alrbi3aAlmo5asasa.screenRoute: (context) => Alrbi3aAlmo5asasa(),
    Al5amisaAlmo5asasa.screenRoute: (context) => Al5amisaAlmo5asasa(),
    AlsadisaAlmo5asasa.screenRoute: (context) => AlsadisaAlmo5asasa(),
    Alsadbi3aAlmo5asasa.screenRoute: (context) => Alsadbi3aAlmo5asasa(),
    Alsadbi3aAlmo5asasaAlsania.screenRoute: (context) =>
        Alsadbi3aAlmo5asasaAlsania(),
    AlsaminaAlmo5asasa.screenRoute: (context) => AlsaminaAlmo5asasa(),
    AlziyaratAl2o5ra.screenRoute: (context) => AlziyaratAl2o5ra(),
    FadlTorbatAlhussein.screenRoute: (context) => FadlTorbatAlhussein(),
    ////! ZIYARAT AL KAZIMIN
    ZiyaratAlkazimin.screenRoute: (context) => ZiyaratAlkazimin(),
    FiFadlZiyaratLkazimin.screenRoute: (context) => FiFadlZiyaratLkazimin(),
    Ziyarat2o5raLmousa.screenRoute: (context) => Ziyarat2o5raLmousa(),
    Ziyarat2o5raLmohamadAltaki.screenRoute: (context) =>
        Ziyarat2o5raLmohamadAltaki(),
    Ziyarat2o5raLmohamadAltakiAlsaniya.screenRoute: (context) =>
        Ziyarat2o5raLmohamadAltakiAlsaniya(),
    AlmasjedAlsharif.screenRoute: (context) => AlmasjedAlsharif(),
    ZiyaratAlnowabAl2arba3a.screenRoute: (context) => ZiyaratAlnowabAl2arba3a(),
    ZiyaratSalman.screenRoute: (context) => ZiyaratSalman(),
    ////! ZIYARAT AL RIDA
    ZiyaratAlrida.screenRoute: (context) => ZiyaratAlrida(),
    ZiyaratAlimamAlridaAl2oula.screenRoute: (context) =>
        ZiyaratAlimamAlridaAl2oula(),
    ZiyaratAlimamAlridaAlsaniya.screenRoute: (context) =>
        ZiyaratAlimamAlridaAlsaniya(),
    ////! ZIYARAT 2A2IMAT SIR
    Ziyarat2a2imatSir.screenRoute: (context) => Ziyarat2a2imatSir(),
    AlmakamAl2awal.screenRoute: (context) => AlmakamAl2awal(),
    ZiyaratAlimamAl3askari.screenRoute: (context) => ZiyaratAlimamAl3askari(),
    AlmakamAlsani.screenRoute: (context) => AlmakamAlsani(),
    ZiyaratAl2imamAlmahdiAlmankoula.screenRoute: (context) =>
        ZiyaratAl2imamAlmahdiAlmankoula(),
    ZiyaratAl2imamAlmahdiAl2o5raAlsaniya.screenRoute: (context) =>
        ZiyaratAl2imamAlmahdiAl2o5raAlsaniya(),
    ZiyaratAl2imamAlmahdiAlsalat3alaih.screenRoute: (context) =>
        ZiyaratAl2imamAlmahdiAlsalat3alaih(),
    ZiyaratAl2imamAlmahdiAl2o5raAlsalisa.screenRoute: (context) =>
        ZiyaratAl2imamAlmahdiAl2o5raAlsalisa(),
    ////! ZIYARAT AL JAMI3A WAL SALAWAT
    AlziyaratAljami3aWalsalawat.screenRoute: (context) =>
        AlziyaratAljami3aWalsalawat(),
    Ziyarat2alYasin.screenRoute: (context) => Ziyarat2alYasin(),
    ZiyaratAlna7iyaAlmokadasa.screenRoute: (context) =>
        ZiyaratAlna7iyaAlmokadasa(),
    SalatJa3farAltayar.screenRoute: (context) => SalatJa3farAltayar(),
    ZiyaratAlsayidaZainab.screenRoute: (context) => ZiyaratAlsayidaZainab(),
    HadisAlkisa2.screenRoute: (context) => HadisAlkisa2(),
    FiZiyaratAlabna2Al3ozama2.screenRoute: (context) =>
        FiZiyaratAlabna2Al3ozama2(),
    FiZiyaratKobourLmo2minin.screenRoute: (context) =>
        FiZiyaratKobourLmo2minin(),
    FiZiyaratL2abiya2L3izam.screenRoute: (context) => FiZiyaratL2abiya2L3izam(),
    MaYozarKol2imam.screenRoute: (context) => MaYozarKol2imam(),
    AakibZiyaratAl2a2ima.screenRoute: (context) => AakibZiyaratAl2a2ima(),
    Alsalat3alaAlnabi.screenRoute: (context) => Alsalat3alaAlnabi(),
    Alsalat3alaAmirAlmo2minin.screenRoute: (context) =>
        Alsalat3alaAmirAlmo2minin(),
    Alsalat3alaAlsayidaFatima.screenRoute: (context) =>
        Alsalat3alaAlsayidaFatima(),
    Alsalat3alaLhassanWalhussein.screenRoute: (context) =>
        Alsalat3alaLhassanWalhussein(),
    Alsalat3alaAliBinLhussein.screenRoute: (context) =>
        Alsalat3alaAliBinLhussein(),
    Alsalat3alaMohamadBinAli.screenRoute: (context) =>
        Alsalat3alaMohamadBinAli(),
    Alsalat3alaJa3farBinMohamad.screenRoute: (context) =>
        Alsalat3alaJa3farBinMohamad(),
    Alsalat3alaMoussaBinJa3far.screenRoute: (context) =>
        Alsalat3alaMoussaBinJa3far(),
    Alsalat3alaAliBinMoussa.screenRoute: (context) => Alsalat3alaAliBinMoussa(),
    Alsalat3alaMohamadBinAliBinMoussa.screenRoute: (context) =>
        Alsalat3alaMohamadBinAliBinMoussa(),
    Alsalat3alaAliBinMohamad.screenRoute: (context) =>
        Alsalat3alaAliBinMohamad(),
    Alsalat3alaLhassanAl3askari.screenRoute: (context) =>
        Alsalat3alaLhassanAl3askari(),
    Alsalat3alaWaleyL2amer.screenRoute: (context) => Alsalat3alaWaleyL2amer(),
    //todo Kor2an HomeScreen
    QuranHomeScreen.screenRoute: (context) => QuranHomeScreen(),
    IndexScreen.screenRoute: (context) => IndexScreen(),
    JuzIndexScreen.screenRoute: (context) => JuzIndexScreen(),

    //todo A3mal Layali Kadr
    A3malLayaliKadrHomeScreen.screenRoute: (context) =>
        A3malLayaliKadrHomeScreen(),
    // !
    AlsowarAlkor2aneya.screenRoute: (context) => AlsowarAlkor2aneya(),
    SouratAl3ankabout.screenRoute: (context) => SouratAl3ankabout(),
    SouratAlroum.screenRoute: (context) => SouratAlroum(),
    SouratAldo5an.screenRoute: (context) => SouratAldo5an(),
    // !
    A3malLayalyAlkadr.screenRoute: (context) => A3malLayalyAlkadr(),
    Mawane3Alkoboul.screenRoute: (context) => Mawane3Alkoboul(),
    SawabAl2i7ya2.screenRoute: (context) => SawabAl2i7ya2(),
    Al2iste3dad.screenRoute: (context) => Al2iste3dad(),
    // !
    Al2a3malAl3ama.screenRoute: (context) => Al2a3malAl3ama(),
    Dou3a2L2iftitah.screenRoute: (context) => Dou3a2L2iftitah(),
    Dou3a2Alsalihin.screenRoute: (context) => Dou3a2Alsalihin(),
    Dou3a2Al2imamAlsadek.screenRoute: (context) => Dou3a2Al2imamAlsadek(),
    SalatRok3atain.screenRoute: (context) => SalatRok3atain(),
    Dou3a2AltawasolBelmis7af.screenRoute: (context) =>
        Dou3a2AltawasolBelmis7af(),
    ZiyaratAl2imamAlhussein.screenRoute: (context) => ZiyaratAl2imamAlhussein(),
    Ziyarat3aliBinAlhussein.screenRoute: (context) => Ziyarat3aliBinAlhussein(),
    ZiyaratAlshohada.screenRoute: (context) => ZiyaratAlshohada(),
    ZiyaratAbiAlfadl.screenRoute: (context) => ZiyaratAbiAlfadl(),
    SalatMi2atRok3a.screenRoute: (context) => SalatMi2atRok3a(),
    Dou3a2Allahoma2iniAmsayt.screenRoute: (context) =>
        Dou3a2Allahoma2iniAmsayt(),
    Dou3a2Altawba.screenRoute: (context) => Dou3a2Altawba(),
    Dou3a2AljawshanAlkabir.screenRoute: (context) => Dou3a2AljawshanAlkabir(),
    A3malAsharRamdan.screenRoute: (context) => A3malAsharRamdan(),
    Dou3aAlbaha2.screenRoute: (context) => Dou3aAlbaha2(),
    Dou3a2AbiHamzaAlsamali.screenRoute: (context) => Dou3a2AbiHamzaAlsamali(),
    Dou3a2Ya3odati.screenRoute: (context) => Dou3a2Ya3odati(),
    Dou3a2Idris.screenRoute: (context) => Dou3a2Idris(),
    Dou3a2YaMafza3i.screenRoute: (context) => Dou3a2YaMafza3i(),
    Altasbihat.screenRoute: (context) => Altasbihat(),
    Dou3a2MakarimAl2a5lak.screenRoute: (context) => Dou3a2MakarimAl2a5lak(),
    //!
    Al2a3malAl5asa.screenRoute: (context) => Al2a3malAl5asa(),
    A3malAllaylaLatasi3a3ashar.screenRoute: (context) =>
        A3malAllaylaLatasi3a3ashar(),
    A3malAllaylaAlwahidaWal3eshrin.screenRoute: (context) =>
        A3malAllaylaAlwahidaWal3eshrin(),
    Dou3a2AlimamAlsadek.screenRoute: (context) => Dou3a2AlimamAlsadek(),
    Dou3a2AllaylaAlwahidaWal3ishrin.screenRoute: (context) =>
        Dou3a2AllaylaAlwahidaWal3ishrin(),
    ZyaratAmirMo2minin.screenRoute: (context) => ZyaratAmirMo2minin(),
    A3malAllaylaAlsalisaWal3ishrin.screenRoute: (context) =>
        A3malAllaylaAlsalisaWal3ishrin(),
    ZyaratSa7ibAlzaman.screenRoute: (context) => ZyaratSa7ibAlzaman(),
    Dou3a2YaBatinan.screenRoute: (context) => Dou3a2YaBatinan(),
    SalatLayl.screenRoute: (context) => SalatLayl(),
    Dou3a2Ba3dSalatAlwater.screenRoute: (context) => Dou3a2Ba3dSalatAlwater(),
    Hadis2alkisa2.screenRoute: (context) => Hadis2alkisa2(),
    Dou3a22alhazin.screenRoute: (context) => Dou3a22alhazin(),
    //todo Al7akiba AlRamadaneya
    Al7akibaAlramadaneyaHomeScreen.screenRoute: (context) =>
        Al7akibaAlramadaneyaHomeScreen(),
    // !
    FimaYa3omAllayaliWal2ayam.screenRoute: (context) =>
        FimaYa3omAllayaliWal2ayam(),
    FiFadlShaherRamadan.screenRoute: (context) => FiFadlShaherRamadan(),
    MaYa3omAllayaliWalayam.screenRoute: (context) => MaYa3omAllayaliWalayam(),
    // !
    FimaYosta7ab2itanohFiRamadan.screenRoute: (context) =>
        FimaYosta7ab2itanohFiRamadan(),
    Dou3a2Al2iftita7.screenRoute: (context) => Dou3a2Al2iftita7(),
    MaYosta7ab2itanohFiLayaliRamadan.screenRoute: (context) =>
        MaYosta7ab2itanohFiLayaliRamadan(),
    // !
    FiA3malAsharRamadan.screenRoute: (context) => FiA3malAsharRamadan(),
    Fi2a3mal2as7arRamadan.screenRoute: (context) => Fi2a3mal2as7arRamadan(),
    Dou3a2Abi7amzaAlsamali.screenRoute: (context) => Dou3a2Abi7amzaAlsamali(),
    Dou3a2Alsa7ar.screenRoute: (context) => Dou3a2Alsa7ar(),
    // !
    A3malWa2ad3iyatAyamRamadan.screenRoute: (context) =>
        A3malWa2ad3iyatAyamRamadan(),
    Alyawm2al2awal.screenRoute: (context) => Alyawm2al2awal(),
    Alyawm2alsani.screenRoute: (context) => Alyawm2alsani(),
    Alyawm2alsalis.screenRoute: (context) => Alyawm2alsalis(),
    Alyawm2alrabi3.screenRoute: (context) => Alyawm2alrabi3(),
    Alyawm2al5amis.screenRoute: (context) => Alyawm2al5amis(),
    Alyawm2alsadis.screenRoute: (context) => Alyawm2alsadis(),
    Alyawm2alsabi3.screenRoute: (context) => Alyawm2alsabi3(),
    Alyawm2alsamen.screenRoute: (context) => Alyawm2alsamen(),
    Alyawm2altase3.screenRoute: (context) => Alyawm2altase3(),
    Alyawm2al3asher.screenRoute: (context) => Alyawm2al3asher(),
    Alyawm2al7adi3ashar.screenRoute: (context) => Alyawm2al7adi3ashar(),
    Alyawm2alsani3ashar.screenRoute: (context) => Alyawm2alsani3ashar(),
    Alyawm2alsalis3ashar.screenRoute: (context) => Alyawm2alsalis3ashar(),
    Alyawm2alrabi33ashar.screenRoute: (context) => Alyawm2alrabi33ashar(),
    Alyawm2al5amis3ashar.screenRoute: (context) => Alyawm2al5amis3ashar(),
    Alyawm2alsadis3ashar.screenRoute: (context) => Alyawm2alsadis3ashar(),
    Alyawm2alsabi33ashar.screenRoute: (context) => Alyawm2alsabi33ashar(),
    Alyawm2alsamin3ashar.screenRoute: (context) => Alyawm2alsamin3ashar(),
    Alyawm2altasi33ashar.screenRoute: (context) => Alyawm2altasi33ashar(),
    Alyawm2al3ishroun.screenRoute: (context) => Alyawm2al3ishroun(),
    Alyawm2al7adiWal3ishrin.screenRoute: (context) => Alyawm2al7adiWal3ishrin(),
    Alyawm2alsaniWal3ishrin.screenRoute: (context) => Alyawm2alsaniWal3ishrin(),
    Alyawm2alsalisWal3ishrin.screenRoute: (context) =>
        Alyawm2alsalisWal3ishrin(),
    Alyawm2alrabi3Wal3ishrin.screenRoute: (context) =>
        Alyawm2alrabi3Wal3ishrin(),
    Alyawm2al5amisWal3ishrin.screenRoute: (context) =>
        Alyawm2al5amisWal3ishrin(),
    Alyawm2alsadisWal3ishrin.screenRoute: (context) =>
        Alyawm2alsadisWal3ishrin(),
    Alyawm2alsabi3Wal3ishrin.screenRoute: (context) =>
        Alyawm2alsabi3Wal3ishrin(),
    Alyawm2alsaminWal3ishrin.screenRoute: (context) =>
        Alyawm2alsaminWal3ishrin(),
    Alyawm2altasi3Wal3ishrin.screenRoute: (context) =>
        Alyawm2altasi3Wal3ishrin(),
    Alyawm2alsalasin.screenRoute: (context) => Alyawm2alsalasin(),
    // !
    A3malW2ad3iyatLayaliRamadan.screenRoute: (context) =>
        A3malW2ad3iyatLayaliRamadan(),
    Allayla2al2oula.screenRoute: (context) => Allayla2al2oula(),
    Allayla2alsalisa3ashar.screenRoute: (context) => Allayla2alsalisa3ashar(),
    Allayla2alrabi3a3ashar.screenRoute: (context) => Allayla2alrabi3a3ashar(),
    Allayla2al5amisa3ashar.screenRoute: (context) => Allayla2al5amisa3ashar(),
    Allayla2alsabi3a3ashar.screenRoute: (context) => Allayla2alsabi3a3ashar(),
    Allayla2altasi3a3ashar.screenRoute: (context) => Allayla2altasi3a3ashar(),
    Allayla2al7adiyaWal3ishrin.screenRoute: (context) =>
        Allayla2al7adiyaWal3ishrin(),
    Allayla2alsaniyaWal3ishrin.screenRoute: (context) =>
        Allayla2alsaniyaWal3ishrin(),
    Allayla2alsalisaWal3ishrin.screenRoute: (context) =>
        Allayla2alsalisaWal3ishrin(),
    Allayla2alrabi3aWal3ishrin.screenRoute: (context) =>
        Allayla2alrabi3aWal3ishrin(),
    Allayla2al5amisaWal3ishrin.screenRoute: (context) =>
        Allayla2al5amisaWal3ishrin(),
    Allayla2alsadisaWal3ishrin.screenRoute: (context) =>
        Allayla2alsadisaWal3ishrin(),
    Allayla2alsabi3aWal3ishrin.screenRoute: (context) =>
        Allayla2alsabi3aWal3ishrin(),
    Allayla2alsaminaWal3ishrin.screenRoute: (context) =>
        Allayla2alsaminaWal3ishrin(),
    Allayla2altasi3aWal3ishrin.screenRoute: (context) =>
        Allayla2altasi3aWal3ishrin(),
    Allayla2alsalasin.screenRoute: (context) => Allayla2alsalasin(),

    //todo Albakiyat Alsali7at
    AlbakiyatAlsali7atHomeScreen.screenRoute: (context) =>
        AlbakiyatAlsali7atHomeScreen(),
    // !
    NozorMenA3malAllailWalnahar.screenRoute: (context) =>
        NozorMenA3malAllailWalnahar(),
    FimaYata3alakBel8odat.screenRoute: (context) => FimaYata3alakBel8odat(),
    Alta3kibatAl3amaa.screenRoute: (context) => Alta3kibatAl3amaa(),
    Alta3kibatAl5asaBfaridatAlsob7.screenRoute: (context) =>
        Alta3kibatAl5asaBfaridatAlsob7(),
    FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha.screenRoute:
        (context) => FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha(),
    FimaYo3malMen7inAl8ouroub2ela7inAlnawm.screenRoute: (context) =>
        FimaYo3malMen7inAl8ouroub2ela7inAlnawm(),
    FiL2intibahMenAlnawmWsalatAllayl.screenRoute: (context) =>
        FiL2intibahMenAlnawmWsalatAllayl(),
    FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute: (context) =>
        FiAzkarWda3awatTokra2Saba7anWamasa2an(),
    FimaYod3aBihiFikolSa3aMenSa3atAlyawm.screenRoute: (context) =>
        FimaYod3aBihiFikolSa3aMenSa3atAlyawm(),
    // !
    ZikrSalawatAyamAl2osbou3.screenRoute: (context) =>
        ZikrSalawatAyamAl2osbou3(),
    SalatYawmAlsabtt.screenRoute: (context) => SalatYawmAlsabtt(),
    SalatYawmAl2a7add.screenRoute: (context) => SalatYawmAl2a7add(),
    SalatYawmAl2isnainn.screenRoute: (context) => SalatYawmAl2isnainn(),
    SalatYawmAlsoulasaa2.screenRoute: (context) => SalatYawmAlsoulasaa2(),
    SalatYawmAl2arbi3aa2.screenRoute: (context) => SalatYawmAl2arbi3aa2(),
    SalatYawmAl5amiss.screenRoute: (context) => SalatYawmAl5amiss(),
    SalatYawmAljom3aa.screenRoute: (context) => SalatYawmAljom3aa(),
    // !
    Ba3dAlsalawatAlmandouba.screenRoute: (context) => Ba3dAlsalawatAlmandouba(),
    SalatAl2a3rabi.screenRoute: (context) => SalatAl2a3rabi(),
    SalatAlhadiya.screenRoute: (context) => SalatAlhadiya(),
    SalatLailatAldafn.screenRoute: (context) => SalatLailatAldafn(),
    SalatAlwaladLiwalidayh.screenRoute: (context) => SalatAlwaladLiwalidayh(),
    SalatAlja2i3.screenRoute: (context) => SalatAlja2i3(),
    SalatLi7adisAlnafs.screenRoute: (context) => SalatLi7adisAlnafs(),
    SalatAl2isti5araZatAlrka3.screenRoute: (context) =>
        SalatAl2isti5araZatAlrka3(),
    SalatLiddainWlkifayatZolmAlsoltan.screenRoute: (context) =>
        SalatLiddainWlkifayatZolmAlsoltan(),
    SalatAl7aja.screenRoute: (context) => SalatAl7aja(),
    SalatLilmohemat.screenRoute: (context) => SalatLilmohemat(),
    SalatAl3asra.screenRoute: (context) => SalatAl3asra(),
    SalatLziyadatAlrizk.screenRoute: (context) => SalatLziyadatAlrizk(),
    SalatAl7ajaAl2oula.screenRoute: (context) => SalatAl7ajaAl2oula(),
    SalatAl7ajaAlsaniya.screenRoute: (context) => SalatAl7ajaAlsaniya(),
    SalatAl7ajaAlsalisa.screenRoute: (context) => SalatAl7ajaAlsalisa(),
    SalatAl7ajaAlrabi3a.screenRoute: (context) => SalatAl7ajaAlrabi3a(),
    SalatAl7ajaAl5amisa.screenRoute: (context) => SalatAl7ajaAl5amisa(),
    SalatAlisti8asa.screenRoute: (context) => SalatAlisti8asa(),
    SalatAl7ojaFiJamkaran.screenRoute: (context) => SalatAl7ojaFiJamkaran(),
    SalatAl5awfMenAlzalim.screenRoute: (context) => SalatAl5awfMenAlzalim(),
    SalatLilzaka2WjoudatAlhofez.screenRoute: (context) =>
        SalatLilzaka2WjoudatAlhofez(),
    SalatLi8ofranAlzounoub.screenRoute: (context) => SalatLi8ofranAlzounoub(),
    SalatAlwasiya.screenRoute: (context) => SalatAlwasiya(),
    SalatAl3afo.screenRoute: (context) => SalatAl3afo(),
    // !
    Al2ad3iyaWal3awzatLil2alamWal2askam.screenRoute: (context) =>
        Al2ad3iyaWal3awzatLil2alamWal2askam(),
    Dou3a2Al3afiya.screenRoute: (context) => Dou3a2Al3afiya(),
    AwzatWadou3a2Lilamrad.screenRoute: (context) => AwzatWadou3a2Lilamrad(),
    Dou3a2Liwaja3Alra2sWalisoda3Walisomm.screenRoute: (context) =>
        Dou3a2Liwaja3Alra2sWalisoda3Walisomm(),
    Dou3a2Liwaja3Alfam.screenRoute: (context) => Dou3a2Liwaja3Alfam(),
    AwzaLiwaja3Alasnan.screenRoute: (context) => AwzaLiwaja3Alasnan(),
    Dou3a2Liwaja3AlbatenWalcolon.screenRoute: (context) =>
        Dou3a2Liwaja3AlbatenWalcolon(),
    Dou3a2Lilso2lolWlilawram.screenRoute: (context) =>
        Dou3a2Lilso2lolWlilawram(),
    Dou3a2Lita3asorAlwilada.screenRoute: (context) => Dou3a2Lita3asorAlwilada(),
    Dou3a2Li7alAlmarbout.screenRoute: (context) => Dou3a2Li7alAlmarbout(),
    AwzatAl7oma.screenRoute: (context) => AwzatAl7oma(),
    Dou3a2Lilza7ir.screenRoute: (context) => Dou3a2Lilza7ir(),
    Aldou3a2LikarakirAlbatn.screenRoute: (context) => Aldou3a2LikarakirAlbatn(),
    Aldou3a2Lilbaras.screenRoute: (context) => Aldou3a2Lilbaras(),
    AwzaLiwaja3Al3awra.screenRoute: (context) => AwzaLiwaja3Al3awra(),
    AwzaLiwaja3Alrokba.screenRoute: (context) => AwzaLiwaja3Alrokba(),
    AwzaLiwaja3Al3ain.screenRoute: (context) => AwzaLiwaja3Al3ain(),
    Al3awzaLibtalAlsi7r.screenRoute: (context) => Al3awzaLibtalAlsi7r(),
    Al7erzMenAl3ain.screenRoute: (context) => Al7erzMenAl3ain(),
    AwzaLidaf3WasawisAlshaitan.screenRoute: (context) =>
        AwzaLidaf3WasawisAlshaitan(),
    AwzaLil2amnMenAlsarik.screenRoute: (context) => AwzaLil2amnMenAlsarik(),
    AwzaLil3akrab.screenRoute: (context) => AwzaLil3akrab(),
    // !
    Da3awatMonta5abaMenKitabAlkafiAlsharif.screenRoute: (context) =>
        Da3awatMonta5abaMenKitabAlkafiAlsharif(),
    Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an.screenRoute: (context) =>
        Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an(),
    FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh.screenRoute: (context) =>
        FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh(),
    FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi.screenRoute:
        (context) => FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi(),
    FiDa3awatMa2souraKablSalatWfiAdbariha.screenRoute: (context) =>
        FiDa3awatMa2souraKablSalatWfiAdbariha(),
    FiAd3iyaMa2souraLilrizk.screenRoute: (context) => FiAd3iyaMa2souraLilrizk(),
    FiZikrDou3a2ainLildin.screenRoute: (context) => FiZikrDou3a2ainLildin(),
    FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha.screenRoute: (context) =>
        FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha(),
    FiAd3iyatAl3ilalWalmarad.screenRoute: (context) =>
        FiAd3iyatAl3ilalWalmarad(),
    FiBa3dAla7razWal3owaz.screenRoute: (context) => FiBa3dAla7razWal3owaz(),
    FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira.screenRoute: (context) =>
        FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira(),
    Dou3a2Al2i7tijabAmirAlmo2minin.screenRoute: (context) =>
        Dou3a2Al2i7tijabAmirAlmo2minin(),
    // !
    Ala7razWalad3iyaAlmoujaza.screenRoute: (context) =>
        Ala7razWalad3iyaAlmoujaza(),
    Dou3a2AlsajadFiZikrAltawba.screenRoute: (context) =>
        Dou3a2AlsajadFiZikrAltawba(),
    FiBa3dAla7razWalad3iyaAlmoujaza.screenRoute: (context) =>
        FiBa3dAla7razWalad3iyaAlmoujaza(),
    AlmonajatBelisti5araa.screenRoute: (context) => AlmonajatBelisti5araa(),
    AlmonajatBelistikala.screenRoute: (context) => AlmonajatBelistikala(),
    AlmonajatBelsafaar.screenRoute: (context) => AlmonajatBelsafaar(),
    AlmonajatBitalabAlrizk.screenRoute: (context) => AlmonajatBitalabAlrizk(),
    AlmonajatBilisti3aza.screenRoute: (context) => AlmonajatBilisti3aza(),
    AlmonajatBitalabAltawba.screenRoute: (context) => AlmonajatBitalabAltawba(),
    AlmonajatBitalabAl7aj.screenRoute: (context) => AlmonajatBitalabAl7aj(),
    AlmonajatLikashfAlzolm.screenRoute: (context) => AlmonajatLikashfAlzolm(),
    AlmonajatBishokrAllah.screenRoute: (context) => AlmonajatBishokrAllah(),
    AlmonajatBitalabAl7awa2ij.screenRoute: (context) =>
        AlmonajatBitalabAl7awa2ij(),
    FiAsarBa3dSowarWalayat.screenRoute: (context) => FiAsarBa3dSowarWalayat(),
    FiBa3dMaYata3alakBelmawt.screenRoute: (context) =>
        FiBa3dMaYata3alakBelmawt(),

    //todo Alsahifa AlSajjadiya
    Alsa7ifaAlsajadiyaHomeScreen.screenRoute: (context) =>
        Alsa7ifaAlsajadiyaHomeScreen(),
    // !
    Takdim.screenRoute: (context) => Takdim(),
    Takdimm.screenRoute: (context) => Takdimm(),
    Almokadima.screenRoute: (context) => Almokadima(),
    // !
    Alad3iya.screenRoute: (context) => Alad3iya(),
    Dou3a2Wa7ad.screenRoute: (context) => Dou3a2Wa7ad(),
    Dou3a2Isnain.screenRoute: (context) => Dou3a2Isnain(),
    Dou3a2Salasa.screenRoute: (context) => Dou3a2Salasa(),
    Dou3a2Arba3a.screenRoute: (context) => Dou3a2Arba3a(),
    Dou3a25amsa.screenRoute: (context) => Dou3a25amsa(),
    Dou3a2Sita.screenRoute: (context) => Dou3a2Sita(),
    Dou3a2Sab3a.screenRoute: (context) => Dou3a2Sab3a(),
    Dou3a2Samaniya.screenRoute: (context) => Dou3a2Samaniya(),
    Dou3a2Tes3a.screenRoute: (context) => Dou3a2Tes3a(),
    Dou3a23ashra.screenRoute: (context) => Dou3a23ashra(),
    Dou3a27da3esh.screenRoute: (context) => Dou3a27da3esh(),
    Dou3a2Tna3esh.screenRoute: (context) => Dou3a2Tna3esh(),
    Dou3a2Tlata3esh.screenRoute: (context) => Dou3a2Tlata3esh(),
    Dou3a2Arba3ta3esh.screenRoute: (context) => Dou3a2Arba3ta3esh(),
    Dou3a25amesta3esh.screenRoute: (context) => Dou3a25amesta3esh(),
    Dou3a2Seta3esh.screenRoute: (context) => Dou3a2Seta3esh(),
    Dou3a2Sabe3ta3esh.screenRoute: (context) => Dou3a2Sabe3ta3esh(),
    Dou3a2Tmanta3esh.screenRoute: (context) => Dou3a2Tmanta3esh(),
    Dou3a2Tese3ta3esh.screenRoute: (context) => Dou3a2Tese3ta3esh(),
    Dou3a23ishrin.screenRoute: (context) => Dou3a23ishrin(),
    Dou3a2Wa7edW3ishrin.screenRoute: (context) => Dou3a2Wa7edW3ishrin(),
    Dou3a2TnainaW3ishrin.screenRoute: (context) => Dou3a2TnainaW3ishrin(),
    Dou3a2TletaW3ishrin.screenRoute: (context) => Dou3a2TletaW3ishrin(),
    Dou3a2Arb3aW3ishrin.screenRoute: (context) => Dou3a2Arb3aW3ishrin(),
    Dou3a25amsaW3ishrin.screenRoute: (context) => Dou3a25amsaW3ishrin(),
    Dou3a2SitaW3ishrin.screenRoute: (context) => Dou3a2SitaW3ishrin(),
    Dou3a2Sab3aW3ishrin.screenRoute: (context) => Dou3a2Sab3aW3ishrin(),
    Dou3a2TmenaW3ishrin.screenRoute: (context) => Dou3a2TmenaW3ishrin(),
    Dou3a2Tes3aW3ishrin.screenRoute: (context) => Dou3a2Tes3aW3ishrin(),
    Dou3a2Tlatin.screenRoute: (context) => Dou3a2Tlatin(),
    Dou3a2We7daWtlatin.screenRoute: (context) => Dou3a2We7daWtlatin(),
    Dou3a2TnainaWtlatin.screenRoute: (context) => Dou3a2TnainaWtlatin(),
    Dou3a2TletaWtlatin.screenRoute: (context) => Dou3a2TletaWtlatin(),
    Dou3a2Arb3aWtlatin.screenRoute: (context) => Dou3a2Arb3aWtlatin(),
    Dou3a25amsaWtlatin.screenRoute: (context) => Dou3a25amsaWtlatin(),
    Dou3a2SitaWtlatin.screenRoute: (context) => Dou3a2SitaWtlatin(),
    Dou3a2Sab3aWtlatin.screenRoute: (context) => Dou3a2Sab3aWtlatin(),
    Dou3a2TmenaWtlatin.screenRoute: (context) => Dou3a2TmenaWtlatin(),
    Dou3a2Tes3aWtlatin.screenRoute: (context) => Dou3a2Tes3aWtlatin(),
    Dou3a2Arb3in.screenRoute: (context) => Dou3a2Arb3in(),
    Dou3a2We7daWarba3in.screenRoute: (context) => Dou3a2We7daWarba3in(),
    Dou3a2TnainaWarb3in.screenRoute: (context) => Dou3a2TnainaWarb3in(),
    Dou3a2TletaWarb3in.screenRoute: (context) => Dou3a2TletaWarb3in(),
    Dou3a2Arb3aWarb3in.screenRoute: (context) => Dou3a2Arb3aWarb3in(),
    Dou3a25amsaWarb3in.screenRoute: (context) => Dou3a25amsaWarb3in(),
    Dou3a2SitaWarb3in.screenRoute: (context) => Dou3a2SitaWarb3in(),
    Dou3a2Sab3aWarb3in.screenRoute: (context) => Dou3a2Sab3aWarb3in(),
    Dou3a2TmenaWarb3in.screenRoute: (context) => Dou3a2TmenaWarb3in(),
    Dou3a2Tes3aWarb3in.screenRoute: (context) => Dou3a2Tes3aWarb3in(),
    Dou3a25amsin.screenRoute: (context) => Dou3a25amsin(),
    Dou3a2We7daW5amsin.screenRoute: (context) => Dou3a2We7daW5amsin(),
    Dou3a2TnainaW5amsin.screenRoute: (context) => Dou3a2TnainaW5amsin(),
    Dou3a2TletaW5amsin.screenRoute: (context) => Dou3a2TletaW5amsin(),
    Dou3a2Arba3Wa5amin.screenRoute: (context) => Dou3a2Arba3Wa5amin(),
    // !
    Molhakat.screenRoute: (context) => Molhakat(),
    FiAltasbi7.screenRoute: (context) => FiAltasbi7(),
    Dou3a2WtamjidLah.screenRoute: (context) => Dou3a2WtamjidLah(),
    FiZikrAlMohamad.screenRoute: (context) => FiZikrAlMohamad(),
    FiAlsalat3alaAdam.screenRoute: (context) => FiAlsalat3alaAdam(),
    FiAlkarbWal2ikala.screenRoute: (context) => FiAlkarbWal2ikala(),
    MimaYa7zarohoWya5afoh.screenRoute: (context) => MimaYa7zarohoWya5afoh(),
    FiAltazalol.screenRoute: (context) => FiAltazalol(),
    // !
    A3iyatAlayam.screenRoute: (context) => A3iyatAlayam(),
    Sabt.screenRoute: (context) => Sabt(),
    A7ad.screenRoute: (context) => A7ad(),
    Tanain.screenRoute: (context) => Tanain(),
    Taleta.screenRoute: (context) => Taleta(),
    Orb3a.screenRoute: (context) => Orb3a(),
    Khamis.screenRoute: (context) => Khamis(),
    Jom3a.screenRoute: (context) => Jom3a(),
    // !
    AlmonajatAlkhamsat3ashar.screenRoute: (context) =>
        AlmonajatAlkhamsat3ashar(),
    Alta2ibin.screenRoute: (context) => Alta2ibin(),
    Alshakin.screenRoute: (context) => Alshakin(),
    Al5a2ifin.screenRoute: (context) => Al5a2ifin(),
    Alrajin.screenRoute: (context) => Alrajin(),
    Alra8ibin.screenRoute: (context) => Alra8ibin(),
    Alshakirin.screenRoute: (context) => Alshakirin(),
    Almoti3inLilah.screenRoute: (context) => Almoti3inLilah(),
    Almoridin.screenRoute: (context) => Almoridin(),
    Almo7ibin.screenRoute: (context) => Almo7ibin(),
    Almotawasilin.screenRoute: (context) => Almotawasilin(),
    Almoftakirin.screenRoute: (context) => Almoftakirin(),
    Al3arifin.screenRoute: (context) => Al3arifin(),
    Alzakirin.screenRoute: (context) => Alzakirin(),
    Almo3tasimin.screenRoute: (context) => Almo3tasimin(),
    Alzahidin.screenRoute: (context) => Alzahidin(),
    // !
    RisalatAlhokok.screenRoute: (context) => RisalatAlhokok(),
    HokokAllah.screenRoute: (context) => HokokAllah(),
    HokokAlaf3al.screenRoute: (context) => HokokAlaf3al(),
    HokokAl2a2ima.screenRoute: (context) => HokokAl2a2ima(),
    HokokAlra3iya.screenRoute: (context) => HokokAlra3iya(),
    HokokAlra7em.screenRoute: (context) => HokokAlra7em(),
    HokokAl2a5arin.screenRoute: (context) => HokokAl2a5arin(),
  };
}
