import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Audio extends StatefulWidget {
  Audio({super.key, required this.music});
  String music;

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                      side: BorderSide(
                          color: isPlaying ? Colors.red : Colors.blue))),
              padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.all(isTablet ? 10 : 0),
              ),
            ),
            onPressed: () async {
              if (isPlaying) {
                await player.stop();
              } else {
                await player.play(UrlSource('${widget.music}'));
                print(widget.music);
                print('audio downloaded');
              }
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            child: Icon(
              isPlaying ? Icons.stop : Icons.play_arrow,
              color: isPlaying ? Colors.red : Colors.green,
              size: isTablet ? 80 : 30,
            ),
          ),
        ),
      ],
    );
  }
}

// class Audio extends StatefulWidget {
//   Audio({super.key, required this.music});
//   String music;

//   @override
//   State<Audio> createState() => _AudioState();
// }

// class _AudioState extends State<Audio> {
//   final AudioPlayer player = AudioPlayer();
//   bool isPlaying = false;

//   static const MethodChannel _channel = MethodChannel('audio_pad_channel');

//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }

//   Future<void> _handlePlayPADAudio(String filename) async {
//     try {
//       final String filePath =
//           await _channel.invokeMethod('loadAsset', {'filename': filename});
//       await player.play(DeviceFileSource(filePath));
//     } catch (e) {
//       print('Error playing PAD audio: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth >= 600;

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//           child: ElevatedButton(
//             style: ButtonStyle(
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                   side: BorderSide(color: isPlaying ? Colors.red : Colors.blue),
//                 ),
//               ),
//               padding: MaterialStateProperty.all<EdgeInsets>(
//                 EdgeInsets.all(isTablet ? 10 : 0),
//               ),
//             ),
//             onPressed: () async {
//               if (isPlaying) {
//                 await player.stop();
//               } else {
//                 await _handlePlayPADAudio(widget.music); // تشغيل من PAD
//               }
//               setState(() {
//                 isPlaying = !isPlaying;
//               });
//             },
//             child: Icon(
//               isPlaying ? Icons.stop : Icons.play_arrow,
//               color: isPlaying ? Colors.red : Colors.green,
//               size: isTablet ? 80 : 30,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// class Audio extends StatefulWidget {
//   final String music; // استخدم 'final' لأنها لا تتغير بعد الإنشاء

//   Audio({super.key, required this.music});

//   @override
//   State<Audio> createState() => _AudioState();
// }

// class _AudioState extends State<Audio> {
//   final AudioPlayer player = AudioPlayer();
//   bool isPlaying = false;
//   bool isLoading = false; // حالة جديدة لتتبع التحميل
//   String? errorMessage; // لتخزين رسالة الخطأ وعرضها للمستخدم

//   @override
//   void initState() {
//     super.initState();
//     // الاستماع إلى تغييرات حالة المشغل
//     player.onPlayerStateChanged.listen((PlayerState state) {
//       setState(() {
//         isPlaying = state == PlayerState.playing;
//         // إذا انتهى الصوت، أعد تعيين حالة التحميل
//         if (state == PlayerState.completed ||
//             state == PlayerState.stopped ||
//             state == PlayerState.disposed) {
//           isLoading = false;
//           errorMessage = null; // مسح أي رسائل خطأ سابقة
//         }
//       });
//     });

//     // الاستماع إلى إكمال التشغيل
//     player.onPlayerComplete.listen((event) {
//       setState(() {
//         isPlaying = false;
//         isLoading = false;
//         errorMessage = null;
//       });
//     });

//     // تمت إزالة الاستماع إلى onPlayerError لأنه لم يعد متاحًا في الإصدارات الأحدث.
//     // يتم التعامل مع الأخطاء الآن بواسطة try-catch حول player.setSourceUrl و player.resume
//     // أو من خلال مراقبة حالة المشغل في onPlayerStateChanged.
//   }

//   @override
//   void dispose() {
//     player.dispose(); // تأكد من التخلص من المشغل عند إزالة الـ Widget
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth >= 600;

//     return Column(
//       // استخدم Column لعرض زر التشغيل ورسالة الخطأ
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(7),
//                       side: BorderSide(
//                         color: isPlaying ? Colors.red : Colors.blue,
//                         width: 2.0, // جعل الحدود أكثر وضوحاً
//                       ),
//                     ),
//                   ),
//                   padding: MaterialStateProperty.all<EdgeInsets>(
//                     EdgeInsets.all(isTablet ? 10 : 0),
//                   ),
//                   backgroundColor: MaterialStateProperty.resolveWith<Color>(
//                     (Set<MaterialState> states) {
//                       if (states.contains(MaterialState.pressed)) {
//                         return Colors.blue.shade700; // لون عند الضغط
//                       }
//                       return Colors.blue.shade500; // اللون الافتراضي
//                     },
//                   ),
//                   elevation: MaterialStateProperty.all<double>(5.0), // إضافة ظل
//                 ),
//                 onPressed: isLoading // تعطيل الزر أثناء التحميل
//                     ? null
//                     : () async {
//                         if (isPlaying) {
//                           await player.stop();
//                           setState(() {
//                             isPlaying = false;
//                             isLoading = false;
//                             errorMessage = null;
//                           });
//                         } else {
//                           setState(() {
//                             isLoading = true; // بدء التحميل
//                             errorMessage = null; // مسح رسالة الخطأ السابقة
//                           });
//                           try {
//                             // تعيين المصدر وتشغيله
//                             await player.setSourceUrl(widget.music);
//                             await player
//                                 .resume(); // استخدم resume بعد setSourceUrl
//                             print('Attempting to play: ${widget.music}');
//                             print(
//                                 'Audio source set successfully, attempting to play...');
//                           } catch (e) {
//                             setState(() {
//                               isLoading = false;
//                               isPlaying = false;
//                               errorMessage = 'فشل تشغيل الصوت: $e';
//                               print(
//                                   'Error setting source or playing audio: $e');
//                             });
//                           }
//                         }
//                       },
//                 child: isLoading
//                     ? const CircularProgressIndicator(
//                         // مؤشر تحميل
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                       )
//                     : Icon(
//                         isPlaying ? Icons.stop : Icons.play_arrow,
//                         color: isPlaying ? Colors.red : Colors.green,
//                         size: isTablet ? 80 : 30,
//                       ),
//               ),
//             ),
//           ],
//         ),
//         if (errorMessage != null) // عرض رسالة الخطأ إذا كانت موجودة
//           Padding(
//             padding: const EdgeInsets.only(top: 8.0),
//             child: Text(
//               errorMessage!,
//               style: const TextStyle(color: Colors.red, fontSize: 14),
//               textAlign: TextAlign.center,
//             ),
//           ),
//       ],
//     );
//   }
// }
