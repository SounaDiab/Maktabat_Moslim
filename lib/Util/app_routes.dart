import 'package:flutter/material.dart';
import '../api/web%20service/json_service.dart';

import '../api/repository/repository.dart';
import '../business logic/cubit/a3mal_laylat_alkader_cubit.dart';
import '../screens/a3mal layali kadr/a3mal layaly alkadr/al2iste3dad.dart';
import '../screens/a3mal layali kadr/a3mal layaly alkadr/mawane3_alkoboul.dart';
import '../screens/a3mal layali kadr/a3mal layaly alkadr/sawab_al2i7ya2.dart';
import '../screens/a3mal layali kadr/a3mal_layaly_alkadr.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/a3mal_ashar_ramdan.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/altasbihat.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_abi_hamza_alsamali.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_al2imam_alsadek.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_aljawshan_alkabir.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_allahoma_2ini_amsayt.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_alsalihin.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_altawasol_belmis7af.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_altawba.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_idris.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_l2iftitah.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_makarim_al2a5lak.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_ya_3odati.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a2_ya_mafza3i.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/dou3a_albaha2.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/salat_mi2at_rok3a.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/salat_rok3atain.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/ziyarat_3ali_bin_alhussein.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/ziyarat_abi_alfadl.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/ziyarat_al2imam_alhussein.dart';
import '../screens/a3mal layali kadr/al2a3mal al3ama/ziyarat_alshohada.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/a3mal_allayla_alsalisa_wal3ishrin.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/a3mal_allayla_alwahida_wal3eshrin.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/a3mal_allayla_latasi3a_3ashar.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/dou3a2_2alhazin.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/dou3a2_alimam_alsadek.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/dou3a2_allayla_alwahida_wal3ishrin.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/dou3a2_ba3d_salat_alwater.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/dou3a2_ya_batinan.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/hadis_2alkisa2.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/salat_layl.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/zyarat_amir_mo2minin.dart';
import '../screens/a3mal layali kadr/al2a3mal al5asa/zyarat_sa7ib_alzaman.dart';
import '../screens/a3mal layali kadr/al2a3mal_al3ama.dart';
import '../screens/a3mal layali kadr/al2a3mal_al5asa.dart';
import '../screens/a3mal layali kadr/alsowar_alkor2aneya.dart';
import '../screens/a3mal layali kadr/sowar kor2aneya/sourat_al3ankabout.dart';
import '../screens/a3mal layali kadr/sowar kor2aneya/sourat_aldo5an.dart';
import '../screens/a3mal layali kadr/sowar kor2aneya/sourat_alroum.dart';
import '../screens/a3mal_layali_kadr_home_screen.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2al2awal.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2al3asher.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2al3ishroun.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2al5amis.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2al5amis_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2al5amis_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2al7adi_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2al7adi_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alrabi3.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alrabi3_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alrabi3_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsabi3.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsabi3_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsabi3_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsadis.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsadis_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsadis_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsalasin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsalis.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsalis_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsalis_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsamen.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsamin_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsamin_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsani.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsani_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2alsani_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2altase3.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2altasi3_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat ayam ramadan/alyawm_2altasi3_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2al2oula.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2al5amisa_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2al5amisa_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2al7adiya_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alrabi3a_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alrabi3a_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alsabi3a_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alsabi3a_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alsadisa_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alsalasin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alsalisa_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alsalisa_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alsamina_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2alsaniya_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2altasi3a_3ashar.dart';
import '../screens/al7akiba alramadaneya/a3mal w2ad3iyat layali ramadan/allayla_2altasi3a_wal3ishrin.dart';
import '../screens/al7akiba alramadaneya/a3mal_w2ad3iyat_layali_ramadan.dart';
import '../screens/al7akiba alramadaneya/a3mal_wa2ad3iyat_ayam_ramadan.dart';
import '../screens/al7akiba alramadaneya/fi a3mal ashar ramadan/dou3a2_abi_7amza_alsamali.dart';
import '../screens/al7akiba alramadaneya/fi a3mal ashar ramadan/dou3a2_alsa7ar.dart';
import '../screens/al7akiba alramadaneya/fi a3mal ashar ramadan/fi_2a3mal_2as7ar_ramadan.dart';
import '../screens/al7akiba alramadaneya/fi ma yosta7ab 2itanoh fi ramadan/dou3a2_al2iftita7.dart';
import '../screens/al7akiba alramadaneya/fi ma yosta7ab 2itanoh fi ramadan/ma_yosta7ab_2itanoh_fi_layali_ramadan.dart';
import '../screens/al7akiba alramadaneya/fi_a3mal_ashar_ramadan.dart';
import '../screens/al7akiba alramadaneya/fima ya3om allayali wal2ayam/fi_fadl_shaher_ramadan.dart';
import '../screens/al7akiba alramadaneya/fima ya3om allayali wal2ayam/ma_ya3om_allayali_walayam.dart';
import '../screens/al7akiba alramadaneya/fima_ya3om_allayali_wal2ayam.dart';
import '../screens/al7akiba alramadaneya/fima_yosta7ab_2itanoh_fi_ramadan.dart';
import '../screens/al7akiba_alramadaneya_home_screen.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/al3awza_libtal_alsi7r.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/al7erz_men_al3ain.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/aldou3a2_likarakir_albatn.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/aldou3a2_lilbaras.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/awza_lidaf3_wasawis_alshaitan.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/awza_lil2amn_men_alsarik.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/awza_lil3akrab.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/awza_liwaja3_al3ain.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/awza_liwaja3_al3awra.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/awza_liwaja3_alasnan.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/awza_liwaja3_alrokba.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/awzat_al7oma.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/awzat_wadou3a2_lilamrad.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_al3afiya.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_li7al_almarbout.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_lilso2lol_wlilawram.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_lilza7ir.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_lita3asor_alwilada.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_liwaja3_albaten_walcolon.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_liwaja3_alfam.dart';
import '../screens/albakiyat alsali7at/al2ad3iya wal3awzat lil2alam wal2askam/dou3a2_liwaja3_alra2s_walisoda3_walisomm.dart';
import '../screens/albakiyat alsali7at/al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_belisti5araa.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_belistikala.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_belsafaar.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_bilisti3aza.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_bishokr_allah.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_bitalab_al7aj.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_bitalab_al7awa2ij.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_bitalab_alrizk.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_bitalab_altawba.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/almonajat_likashf_alzolm.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/dou3a2_alsajad_fi_zikr_altawba.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/fi_asar_ba3d_sowar_walayat.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/fi_ba3d_ala7raz_walad3iya_almoujaza.dart';
import '../screens/albakiyat alsali7at/ala7raz walad3iya almoujaza/fi_ba3d_ma_yata3alak_belmawt.dart';
import '../screens/albakiyat alsali7at/ala7raz_walad3iya_almoujaza.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al2a3rabi.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al2isti5ara_zat_alrka3.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al3afo.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al3asra.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al5awf_men_alzalim.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al7aja.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al7aja_al2oula.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al7aja_al5amisa.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al7aja_alrabi3a.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al7aja_alsalisa.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al7aja_alsaniya.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_al7oja_fi_jamkaran.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_alhadiya.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_alisti8asa.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_alja2i3.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_alwalad_liwalidayh.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_alwasiya.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_lailat_aldafn.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_li7adis_alnafs.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_li8ofran_alzounoub.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_liddain_wlkifayat_zolm_alsoltan.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_lilmohemat.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_lilzaka2_wjoudat_alhofez.dart';
import '../screens/albakiyat alsali7at/ba3d alsalawat almandouba/salat_lziyadat_alrizk.dart';
import '../screens/albakiyat alsali7at/ba3d_alsalawat_almandouba.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/dou3a2_al2i7tijab_amir_almo2minin.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_3ida_men_al2ad3iya_allati_yod3a_biha_saba7an_wmasa2an.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_ad3iya_ma2soura_lilrizk.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_ad3iyat_al3ilal_walmarad.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_ba3d_ala7raz_wal3owaz.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_da3awat_ma2soura_kabl_salat_wfi_adbariha.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_da3awat_mojzat_ljami3_7wa2ej_aldonia_wal2a5ira.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_zikr_3idat_da3awat_yod3a_bha_2iza_5araj_l2insan_men_manzlhi.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba men kitab alkafi alsharif/fi_zikr_dou3a2ain_lildin.dart';
import '../screens/albakiyat alsali7at/da3awat_monta5aba_men_kitab_alkafi_alsharif.dart';
import '../screens/albakiyat alsali7at/nozor men a3mal allail walnahar/alta3kibat_al3amaa.dart';
import '../screens/albakiyat alsali7at/nozor men a3mal allail walnahar/alta3kibat_al5asa_bfaridat_alsob7.dart';
import '../screens/albakiyat alsali7at/nozor men a3mal allail walnahar/fi_azkar_wda3awat_tokra2_saba7an_wamasa2an.dart';
import '../screens/albakiyat alsali7at/nozor men a3mal allail walnahar/fi_l2intibah_men_alnawm_wsalat_allayl.dart';
import '../screens/albakiyat alsali7at/nozor men a3mal allail walnahar/fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha.dart';
import '../screens/albakiyat alsali7at/nozor men a3mal allail walnahar/fima_yata3alak_bel8odat.dart';
import '../screens/albakiyat alsali7at/nozor men a3mal allail walnahar/fima_yo3mal_men_7in_al8ouroub_2ela_7in_alnawm.dart';
import '../screens/albakiyat alsali7at/nozor men a3mal allail walnahar/fima_yod3a_bihi_fikol_sa3a_men_sa3at_alyawm.dart';
import '../screens/albakiyat alsali7at/nozor_men_a3mal_allail_walnahar.dart';
import '../screens/albakiyat alsali7at/zikr salawat ayam al2ousbou3/salat_yawm_al2a7add.dart';
import '../screens/albakiyat alsali7at/zikr salawat ayam al2ousbou3/salat_yawm_al2arbi3aa2.dart';
import '../screens/albakiyat alsali7at/zikr salawat ayam al2ousbou3/salat_yawm_al2isnainn.dart';
import '../screens/albakiyat alsali7at/zikr salawat ayam al2ousbou3/salat_yawm_al5amiss.dart';
import '../screens/albakiyat alsali7at/zikr salawat ayam al2ousbou3/salat_yawm_aljom3aa.dart';
import '../screens/albakiyat alsali7at/zikr salawat ayam al2ousbou3/salat_yawm_alsabtt.dart';
import '../screens/albakiyat alsali7at/zikr salawat ayam al2ousbou3/salat_yawm_alsoulasaa2.dart';
import '../screens/albakiyat alsali7at/zikr_salawat_ayam_al2osbou3.dart';
import '../screens/albakiyat_alsali7at_home_screen.dart';
import '../screens/alsa7ifa_alsajadiya_home_screen.dart';
import '../screens/kor2an/screens/index_screen.dart';
import '../screens/kor2an/screens/juz_index_screen.dart';
import '../screens/other pages/counter_screen.dart';
import '../screens/other pages/imsakiya_screen.dart';
import '../screens/other pages/salat layl/dou3aa_7azin.dart';
import '../screens/other pages/salat layl/dou3aa_ba3d_salat_alwater.dart';
import '../screens/other pages/salat layl/name_list_page.dart';
import '../screens/other pages/salat layl/sawabaha_wa_fawa2idaha.dart';
import '../screens/other pages/salat layl/waktaha_wakaifyatiha.dart';
import '../screens/other pages/salat_allayl.dart';
import '../screens/other pages/takwim_screen.dart';
import '../screens/quran_home_screen.dart';
import '../screens/about/about_us.dart';
import '../screens/books.dart';
import '../screens/other pages/counter page/tesbiha_page.dart';
import '../screens/other pages/counter page/tesbihat_alzahra2_page.dart';
import '../screens/other_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/herz_almoujahidin_home_screen.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/a3mal_masjid_alsahla.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/adab alziyarat/fi_adab_alziyarat.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/adab alziyarat/fi_zikr_al2isted3a2.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/adab_alziyarat.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/aakib_ziyarat_al2a2ima.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_ali_bin_lhussein.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_ali_bin_mohamad.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_ali_bin_moussa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_alnabi.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_alsayida_fatima.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_amir_almo2minin.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_ja3far_bin_mohamad.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_lhassan_al3askari.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_lhassan_walhussein.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_mohamad_bin_ali.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_mohamad_bin_ali_bin_moussa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_moussa_bin_ja3far.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/alsalat_3ala_waley_l2amer.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/fi_ziyarat_alabna2_al3ozama2.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/fi_ziyarat_kobour_lmo2minin.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/fi_ziyarat_l2abiya2_l3izam.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/hadis_alkisa2.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/ma_yozar_kol_2imam.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/salat_ja3far_altayar.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/ziyarat_2al_yasin.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/ziyarat_alna7iya_almokadasa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat aljami3a wal salawat/ziyarat_alsayida_zainab.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/alziyarat_aljami3a_walsalawat.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/fadl_lakoufa_wmasjidoha.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/kaifyat_wziyarat_amir_almo2minin.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/a3mal_al2ostwana_al5amisa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/a3mal_al2ostwana_alsabi3a.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/a3mal_bab_alfaraj.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/a3mal_bait_altast.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/a3mal_dikat_alkada2_wbait_altast.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/a3mal_jami3_alkoufa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/a3mal_mi7rab_amir_almo2minin.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/aamal_al2ostwana_alsalisa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/fi_fadl_alkoufa_wamasjidouha.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/mounajat_amir_almo2minin.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/sifat_salat.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/sifat_salat_lil7aja.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/zikr_alsalat_waldou3aa_fi_wasat_almasjid.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/ziyarat_hani_ben_3orwa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alkoufa/ziyarat_mouslim_ben_3akil.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alsahla/a3mal_masjed_alsahla.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alsahla/alsalat_waldouaa_fi_masjed_zaid.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/masjid alsahla/fi_fadl_masjed_alsahla.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat 2a2imat sir/almakam_al2awal.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat 2a2imat sir/almakam_alsani.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat 2a2imat sir/ziyarat_al2imam_almahdi_al2o5ra_alsalisa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat 2a2imat sir/ziyarat_al2imam_almahdi_al2o5ra_alsaniya.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat 2a2imat sir/ziyarat_al2imam_almahdi_almankoula.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat 2a2imat sir/ziyarat_al2imam_almahdi_alsalat_3alaih.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat 2a2imat sir/ziyarat_alimam_al3askari.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/al2oula_almo5asasa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/al5amisa_almo5asasa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alrbi3a_almo5asasa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alsadbi3a_almo5asasa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alsadbi3a_almo5asasa_alsania.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alsadisa_almo5asasa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alsalisa_almo5asasa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alsamina_almo5asasa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alsania_almo5asasa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alziyarat_al2o5ra.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alziyarat_almotlaka_al2oula.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alziyarat_almotlaka_al5amisa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alziyarat_almotlaka_alrabi3a.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alziyarat_almotlaka_alsabi3a.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alziyarat_almotlaka_alsadisa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alziyarat_almotlaka_alsalisa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/alziyarat_almotlaka_alsaniya.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/fadl_torbat_alhussein.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/fi_fadl_ziyarat_alhussein.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/fima_3ala_alza2ir_mora3atoh.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/ziyarat_3ashoraa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alhussein/ziyarat_al3abas_ben_3ali.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alkazimin/almasjed_alsharif.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alkazimin/fi_fadl_ziyarat_lkazimin.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alkazimin/ziyarat_2o5ra_lmohamad_altaki.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alkazimin/ziyarat_2o5ra_lmohamad_altaki_alsaniya.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alkazimin/ziyarat_2o5ra_lmousa.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alkazimin/ziyarat_alnowab_al2arba3a.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alkazimin/ziyarat_salman.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alnabi wal zahraa wal 2a2ima/alwada3.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alnabi wal zahraa wal 2a2ima/zikr_almasajed_almo3azama.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alnabi wal zahraa wal 2a2ima/zikr_sa2ir_alziyarat.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_2a2imat_belbaki3.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_alnabi.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_alnabi_walzahraa_wal2a2ima_belbaki3.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_fatima_bent_2asad.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_hamza.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alnabi wal zahraa wal 2a2ima/ziyarat_kobour_alshohada2.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alrida/ziyarat_alimam_alrida_al2oula.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat alrida/ziyarat_alimam_alrida_alsaniya.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat amir almo2minin/alsalisa_men_alziyarat.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat amir almo2minin/alsaniya_men_alziyarat.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat amir almo2minin/fi_fadl_ziyaratihi.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat amir almo2minin/fi_kaifiyat_ziyaratihi.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat amir almo2minin/wada3_al2amir.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat_2a2imat_sir.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat_alhoussein_wa2adabiha.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat_alkazimin.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat_alnabi_walzahraa_wal2a2ima.dart';
import '../screens/mafatih aljinan pages/a3mal almasajed wal ziyarat/ziyarat_alrida.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/baki al sana/fi_2a3mal_3ama_wa2a3mal_alnayrouz_wa2a3mal_al2ashhor_alromiya.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/baki al sana/fi_shaher_rabi3_al2awal.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/baki al sana/fi_shaher_rabi3_alsani_waljamada_al2oula_wal2a5ira.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/baki al sana/fi_shaher_safar.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/baki al sana/fi_shaher_zilko3da.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/baki_alsana.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/moharam.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/moharam/allayla_al2oula.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/moharam/allayla_al3ashira.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/moharam/alyawm_al2awal.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/moharam/alyawm_al3asher.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/moharam/alyawm_al5ames_wal_3eshroun.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/moharam/alyawm_alsalis.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/moharam/alyawm_altase3.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/moharam/fi_a3mal_shaher_moharam.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/al2a3mal_al5asa_brajab.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/allayla_alsabi3a_wal3eshroun.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/allayla_alsalisa_3ashara.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/alyawm_al2a5ir_men_alshaher.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/alyawm_al2awal_men_rajab.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/alyawm_al5ames_wal3ishroun.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/alyawm_alsabe3_wal3eshroun.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/alyawm_alsalis_3ashar.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/lailat_alnisf_men_rajab.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/rajab/yawm_alnisf_men_rajab.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/a3mal_allaila_altasi3a_3ashara_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/allayla_al2oula_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/allayla_al5amisa_3ashar_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/allayla_alrabi3a_3ashar_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/allayla_alsabi3a_3ashara_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/allayla_alsabi3a_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/allayla_alsalisa_3ashar_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/allayla_alsalisa_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/allayla_alwa7ida_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/alyawm_al2awal_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/alyawm_alsadis_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/alyawm_alsalasin_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/alyawm_alwa7id_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/da3awat_ayam_shaher_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/dou3aa_allayla_al5amisa_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/dou3aa_allayla_alrabi3a_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/dou3aa_allayla_alsabi3a_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/dou3aa_allayla_alsadisa_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/dou3aa_allayla_alsalasin_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/dou3aa_allayla_alsamina_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/dou3aa_allayla_altasi3a_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/douaa_abi_7amza_alsamali.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/douaa_al2iftita7.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/douaa_allayla_alsania_wal3ishroun_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/douaa_alsa7ar.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/fi_2a3mal_2ashar_shaher_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/fi_2a3mal_2ayam_shaher_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/fi_2a3mal_shaher_ramadan_al5asa.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/fi_fadel_shaher_ramadan_wa2a3maloh.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/ma_ya3om_allayali_wal2ayam.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/ma_yosta7ab_2itanoh_fi_layali_shaher_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/salawat_allayali_wada3awat_al2ayama_almashhoura.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/ramadan/yawm_alnisf_men_ramadan.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/sha3ban.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/sha3ban/a3mal_ma_bakya_men_alshaher.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/sha3ban/allayla_al2oula_sha3ban.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/sha3ban/allayla_alsalisa_3ashara_sha3ban.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/sha3ban/alyawm_al2awal_sha3ban.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/sha3ban/alyawm_alsalis_sha3ben.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/sha3ban/fi_fadl_shaher_sha3ban.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/sha3ban/laylat_alnisf_men_sha3ben.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/sha3ban/yawm_alnisf_men_sha3ben.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/shawal.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/shawal/a3mal_yawm_3id_alfitr.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/shawal/allayla_al2oula_shawal.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/allayla_al3ashira_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/allayla_alsamina_3ashara_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/allayla_altasi3a_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_al2a5ir_men_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_al2awal_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_al3ashir_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_al5amis_3ashar_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_al5amis_wal3ishroun_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_alrabi3_wal3ishroun_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_alsabi3_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_alsamin_3ashar_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_alsamin_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/alyawm_altasi3_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/fi_a3mal_shaher_zilhoja.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/khotbat_amir_almo2minin_tawm_al8adir.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi lhoja/ziyarat_amir_almo2minin_yawm_al8adir.dart';
import '../screens/mafatih aljinan pages/a3mal ashor alsana/zi_lhoja.dart';
import '../screens/mafatih aljinan pages/a3mal_almasajed_walziyarat.dart';
import '../screens/mafatih aljinan pages/a3mal_ashhor_alsana.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/Douaa_alsabah.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_3alkama.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_al3adila.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_al3asharat.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_alaahd.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_alfaraj.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_alhazin.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_alihtijab.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_aljawshan_alkabir.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_aljawshan_alsa8ir.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_alkamous.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_almashlol.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_almojir.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_alsimat.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_altawasol.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_komail.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_makarim_alakhlak.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_nodba.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_yastashir.dart';
import '../screens/mafatih aljinan pages/ad3iya mashhoura/douaa_zaman_alghaiba.dart';
import '../screens/mafatih aljinan pages/ad3iya_mashhoura.dart';
import '../screens/mafatih aljinan pages/ad3iyat al2osbo3/dou3a2_al2a7ad.dart';
import '../screens/mafatih aljinan pages/ad3iyat al2osbo3/dou3a2_al2arbi3a2.dart';
import '../screens/mafatih aljinan pages/ad3iyat al2osbo3/dou3a2_al2isnain.dart';
import '../screens/mafatih aljinan pages/ad3iyat al2osbo3/dou3a2_al5amis.dart';
import '../screens/mafatih aljinan pages/ad3iyat al2osbo3/dou3a2_aljom3a.dart';
import '../screens/mafatih aljinan pages/ad3iyat al2osbo3/dou3a2_alsabt.dart';
import '../screens/mafatih aljinan pages/ad3iyat al2osbo3/dou3a2_alsoulasa2.dart';
import '../screens/mafatih aljinan pages/ad3iyat_al2osbo3.dart';
import '../screens/mafatih aljinan pages/almonajat.dart';
import '../screens/mafatih aljinan pages/almonajat/almonajat_alsha3baneya.dart';
import '../screens/mafatih aljinan pages/almonajat/almonajat_belsafar.dart';
import '../screens/mafatih aljinan pages/almonajat/almonajat_bikashf_alzolm.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_al3arifin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_al5a2ifin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_almo3tasimin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_almo7ebin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_almoftakirin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_almoridin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_almotawasilin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_almoti3in_lillah.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_alra8ibin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_alrajin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_alshakin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_alshakirin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_alta2ibin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_alzahidin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_alzakirin.dart';
import '../screens/mafatih aljinan pages/almonajat/monajat_l2amir_almo2minin.dart';
import '../screens/mafatih aljinan pages/almonajat/salas_kalimat_3an_amir_almo2minin.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/a3mal_lailat_aljom3a.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/a3mal_nahar_aljom3a.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_2imam_almahdi.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_al3askari.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_albaker.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alhadi.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alhassan.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alhussein.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_aljawad.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alkazem.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alrida.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_alsadek.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_al2imam_zain_al3abidin.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_alnabi.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_alsaida_alzahraa.dart';
import '../screens/mafatih aljinan pages/lailat aljom3a wnaharaha w2a3malaha/salat_amir_amo2minin.dart';
import '../screens/mafatih aljinan pages/lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import '../screens/mafatih aljinan pages/ta3kibat.dart';
import '../screens/mafatih aljinan pages/ta3kibat/ta3kib_al3asr.dart';
import '../screens/mafatih aljinan pages/ta3kibat/ta3kib_al3isha2.dart';
import '../screens/mafatih aljinan pages/ta3kibat/ta3kib_aldohr.dart';
import '../screens/mafatih aljinan pages/ta3kibat/ta3kib_alma8rib.dart';
import '../screens/mafatih aljinan pages/ta3kibat/ta3kib_alsabah.dart';
import '../screens/mafatih aljinan pages/ta3kibat/ta3kibat_3ama.dart';
import '../screens/mafatih aljinan pages/ziarat al2osbo3/ziarat_al2a7ad.dart';
import '../screens/mafatih aljinan pages/ziarat al2osbo3/ziarat_al2arbi3a2.dart';
import '../screens/mafatih aljinan pages/ziarat al2osbo3/ziarat_al2isnain.dart';
import '../screens/mafatih aljinan pages/ziarat al2osbo3/ziarat_al5amis.dart';
import '../screens/mafatih aljinan pages/ziarat al2osbo3/ziarat_aljom3a.dart';
import '../screens/mafatih aljinan pages/ziarat al2osbo3/ziarat_alsabt.dart';
import '../screens/mafatih aljinan pages/ziarat al2osbo3/ziarat_alsoulasa2.dart';
import '../screens/mafatih aljinan pages/ziarat_al2osbou3.dart';
import '../screens/mafatih_aljinan_home_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/herz lmoujahidin/aawza_yataawaz_biha_aala_alaadaa_page.dart';
import '../screens/herz lmoujahidin/aawzat_alnabi_yawm_wadi_alkora_page.dart';
import '../screens/herz lmoujahidin/alfalak_page.dart';
import '../screens/herz lmoujahidin/alhayakel_sabea_page.dart';
import '../screens/herz lmoujahidin/alikhlas_page.dart';
import '../screens/herz lmoujahidin/alkafiroun_page.dart';
import '../screens/herz lmoujahidin/alnas_page.dart';
import '../screens/herz lmoujahidin/ayat_alhefz_men_saif_alaadow_page.dart';
import '../screens/herz lmoujahidin/ayat_alikhtifaa_men_alaadow_page.dart';
import '../screens/herz lmoujahidin/ayat_listekfaa_page.dart';
import '../screens/herz lmoujahidin/ayat_lkorsi_page.dart';
import '../screens/herz lmoujahidin/douaa_ikhdaa_rikab_aljababira_page.dart';
import '../screens/herz lmoujahidin/douaa_lidafea_kaid_aladow_wsharoh_page.dart';
import '../screens/herz lmoujahidin/douaa_lilihtijab_aan_basar_alaadaa_page.dart';
import '../screens/herz lmoujahidin/douaa_lilihtijab_page.dart';
import '../screens/herz lmoujahidin/douaa_lilkhalas_men_alkatl_page.dart';
import '../screens/herz lmoujahidin/douaa_nadi_aalyan_mozhira_alaajaib_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_alaaskari_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_albaker_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_alhadi_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_alhassan_almojtaba_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_alhussein_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_ali_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_aljawad_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_alkazem_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_almahdi_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_alrida_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_alsadek_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_mohamad_aljawad_page.dart';
import '../screens/herz lmoujahidin/herz_alimam_zain_alaabidin_page.dart';
import '../screens/herz lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import '../screens/herz lmoujahidin/herz_altaj_page.dart';
import '../screens/herz lmoujahidin/herz_fatimat_alzahraa_page.dart';
import '../screens/herz lmoujahidin/herz_lietikaa_silah_alaadow_page.dart';
import '../screens/herz lmoujahidin/herz_mostakhraj_men_kitab_allah_page.dart';
import '../screens/herz lmoujahidin/herz_rasoul_allah_page.dart';
import '../screens/herz lmoujahidin/rokaat_aljayb_lilimam_alrida_aalaih_alsalam_page.dart';

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
    OtherScreen.screenRoute: (context) => OtherScreen(),
    // ! Salat Layl
    SalatAllayl.screenRoute: (context) => SalatAllayl(),
    SawabahaWaFawa2idaha.screenRoute: (context) => SawabahaWaFawa2idaha(),
    WaktahaWakaifyatiha.screenRoute: (context) => WaktahaWakaifyatiha(),
    Dou3aaBa3dSalatAlwater.screenRoute: (context) => Dou3aaBa3dSalatAlwater(),
    Dou3aa7azin.screenRoute: (context) => Dou3aa7azin(),
    NameListPage.screenRoute: (context) => NameListPage(),
    // !
    CounterScreen.screenRoute: (context) => CounterScreen(),
    ImsakiyaScreen.screenRoute: (context) => ImsakiyaScreen(),
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
  };
}
