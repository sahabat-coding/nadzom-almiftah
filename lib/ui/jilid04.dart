import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Jilid04 extends StatefulWidget {
  const Jilid04({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Jilid04State createState() => _Jilid04State();
}

class _Jilid04State extends State<Jilid04> {
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
            'Nadzom Jilid 04',
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
                  text: '1. MUBTADA BOLEH NAKIROH ',
                  audioUrl: 'Jilid4/MubtadaBolehNakiroh.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid4/MubtadaBolehNakiroh.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '2. ISIM YANG ROFA DAN NASOB',
                  audioUrl: 'Jilid4/IsimYangRofadanNashob.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying: _currentPlayingAudio ==
                      'Jilid4/IsimYangRofadanNashob.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '3. MAKNANYA DZOROF ',
                  audioUrl: 'Jilid4/maknadzorof.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid4/maknadzorof.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '4. AMIL NAWASIKH ',
                  audioUrl: 'Jilid4/amilnawasikh.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid4/amilnawasikh.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '5. UTAWI IKI IKU (MAKNA) ',
                  audioUrl: 'Jilid4/untukmakna.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid4/untukmakna.mp3',
                ),
                const SizedBox(height: 8),
                _TextWithBorderAndDottedLine(
                  text: '6. MUSTASNANYA ILLA ',
                  audioUrl: 'Jilid4/MustasnanyaIlla.mp3',
                  onPlayPause: _togglePlayPause,
                  isCurrentPlaying:
                      _currentPlayingAudio == 'Jilid4/MustasnanyaIlla.mp3',
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
