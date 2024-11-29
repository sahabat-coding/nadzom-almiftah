import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Import package audio player

class Nadzom extends StatelessWidget {
  const Nadzom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'mp3 Al-Miftah',
            style: TextStyle(
              color: Colors.white, // Set warna teks menjadi putih
            ),
          ),
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(
              icon: const Icon(Icons.home,
                  color: Colors.white), // Ikon rumah putih
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
            ),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: const [
                _TextWithBorderAndDottedLine(
                  text: '1. FIIL MURAB DAN MABNI ',
                  audioUrl: 'mp3/flmb.mp3',
                ),
                SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '2. ISIM MAKRIFAT ',
                  audioUrl: 'mp3/im.mp3',
                ),
                SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '3. MARFUATUL ASMAA ',
                  audioUrl: 'mp3/ma.mp3',
                ),
                SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '4. RUKUN RUKUN KALAM ',
                  audioUrl: 'mp3/rk.mp3',
                ),
                SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '5. AFALUL KHAMSAH ',
                  audioUrl: 'mp3/ak.mp3',
                ),
                SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '6. ISIM MUROB DAN MABNI ',
                  audioUrl: 'mp3/imdm.mp3',
                ),
                SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '7. ISIM-ISIM NASAB ',
                  audioUrl: 'mp3/iin.mp3',
                ),
                SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '8. SHILAH dan AID ',
                  audioUrl: 'mp3/sda.mp3',
                ),
                SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: ' 9.AMIL NASAB UNTUK FIIL MUDLORIK ',
                  audioUrl: 'mp3/anufm.mp3',
                ),
                SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '10. ARTI ISIM MUROB ',
                  audioUrl: 'mp3/aim.mp3',
                ),
                SizedBox(height: 8),

                // Tambahkan lebih banyak item jika diperlukan
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextWithBorderAndDottedLine extends StatefulWidget {
  final String text;
  final String audioUrl;

  const _TextWithBorderAndDottedLine({
    required this.text,
    required this.audioUrl,
  });

  @override
  _TextWithBorderAndDottedLineState createState() =>
      _TextWithBorderAndDottedLineState();
}

class _TextWithBorderAndDottedLineState
    extends State<_TextWithBorderAndDottedLine> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isStopped = false; // Menandakan apakah audio sudah berhenti

  @override
  void initState() {
    super.initState();

    // Mendengarkan saat audio selesai diputar
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _isPlaying = false;
        _isStopped = true; // Menandakan audio selesai diputar
      });
    });
  }

  // Fungsi untuk menambah atau menghentikan audio
  void _togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
        // ignore: avoid_print
        print("Audio dijeda");
      } else if (_isStopped) {
        // Jika audio sudah berhenti, mulai ulang dari awal
        await _audioPlayer.play(AssetSource(widget.audioUrl));
        // ignore: avoid_print
        print("Audio mulai diputar");
        setState(() {
          _isPlaying = true;
          _isStopped = false;
        });
      } else {
        await _audioPlayer.play(AssetSource(widget.audioUrl));
        // ignore: avoid_print
        print("Audio mulai diputar");
      }

      setState(() {
        _isPlaying = !_isPlaying;
      });
    } catch (e) {
      // ignore: avoid_print
      print("Error saat memutar audio: $e");
    }
  }

  // Fungsi untuk menghentikan audio
  void _stopAudio() async {
    await _audioPlayer.stop();
    // ignore: avoid_print
    print("Audio dihentikan");
    setState(() {
      _isPlaying = false;
      _isStopped = true;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment:
                MainAxisAlignment.end, // Mengubah alignment tombol ke kanan
            children: [
              // Teks di sebelah kiri
              Expanded(
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 18,
                    color: Colors.indigo,
                  ),
                ),
              ),
              // Tombol di sebelah kanan
              Tooltip(
                message: _isPlaying
                    ? 'Pause Audio'
                    : _isStopped
                        ? 'Restart Audio'
                        : 'Play Audio', // Tooltip kustom
                child: IconButton(
                  icon: Icon(
                    _isStopped
                        ? Icons.replay // Ikon replay jika audio selesai
                        : _isPlaying
                            ? Icons
                                .pause // Ikon pause jika audio sedang diputar
                            : Icons.play_arrow, // Ikon play jika audio dijeda
                    color: Colors.indigo,
                    size: 30, // Ukuran lebih besar untuk ikon
                  ),
                  onPressed: _isStopped
                      ? _stopAudio
                      : _togglePlayPause, // Hentikan atau Putar/Pause berdasarkan status
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Divider(
              color: Colors.indigo,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
