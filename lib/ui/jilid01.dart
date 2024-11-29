import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Jilid01 extends StatefulWidget {
  const Jilid01({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Jilid01State createState() => _Jilid01State();
}

class _Jilid01State extends State<Jilid01> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentPlayingAudio; // Menyimpan audio yang sedang diputar

  @override
  void initState() {
    super.initState();

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _currentPlayingAudio = null; // Menandakan tidak ada audio yang diputar
      });
    });
  }

  // Fungsi untuk mengontrol pemutaran audio
  void _togglePlayPause(String audioUrl) async {
    if (_currentPlayingAudio != null && _currentPlayingAudio != audioUrl) {
      // Jika ada audio yang sedang diputar, hentikan terlebih dahulu
      await _audioPlayer.stop();
      setState(() {
        _currentPlayingAudio = null; // Hentikan audio yang sedang diputar
      });
    }

    if (_currentPlayingAudio == audioUrl) {
      // Jika audio yang sama diputar, berhenti atau pause
      await _audioPlayer.pause();
      setState(() {
        _currentPlayingAudio = null;
      });
    } else {
      // Mulai audio baru
      await _audioPlayer.play(AssetSource(audioUrl));
      setState(() {
        _currentPlayingAudio = audioUrl;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Nadzom Jilid 01',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.indigo,
          actions: [
            IconButton(
              icon: const Icon(Icons.home, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                _TextWithBorderAndDottedLine(
                  text: '1. ARTI ISIM MUROB ',
                  audioUrl: 'Jilid1/ArtiIsimMurob.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid1/ArtiIsimMurob.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '2. ISIM-ISIM YANG LIMA ',
                  audioUrl: 'Jilid1/Isimisimyanglima.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid1/Isimisimyanglima.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '3. MACAM-MACAM ILLAT ',
                  audioUrl: 'Jilid1/Macam-macamIllat.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid1/Macam-macamIllat.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '4. MUROB MABNI ',
                  audioUrl: 'Jilid1/MurobMabni.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid1/MurobMabni.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '5. RUKUN KALAM & TANDA ISIM & FIIL ',
                  audioUrl: 'Jilid1/RukunKalamdanTandaisimdanFiil.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying: _currentPlayingAudio ==
                      'Jilid1/RukunKalamdanTandaisimdanFiil.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '6. TANDA I_ROB ISIM ',
                  audioUrl: 'Jilid1/TandaI_robIsim.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid1/TandaI_robIsim.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '7. WAZAN ISIM GHOIRU MUNSHORIF ',
                  audioUrl: 'Jilid1/WazanIsimGhoiruMunshorif.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying: _currentPlayingAudio ==
                      'Jilid1/WazanIsimGhoiruMunshorif.mp3',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextWithBorderAndDottedLine extends StatelessWidget {
  final String text;
  final String audioUrl;
  final void Function(String) onPlayPause;
  final bool isCurrentPlaying;

  const _TextWithBorderAndDottedLine({
    required this.text,
    required this.audioUrl,
    required this.onPlayPause,
    required this.isCurrentPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 18,
                    color: Colors.indigo,
                  ),
                ),
              ),
              Tooltip(
                message: isCurrentPlaying ? 'Pause Audio' : 'Play Audio',
                child: IconButton(
                  icon: Icon(
                    isCurrentPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.indigo,
                    size: 30,
                  ),
                  onPressed: () => onPlayPause(audioUrl),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Divider(
              color: Colors.indigo,
              thickness: 1,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
