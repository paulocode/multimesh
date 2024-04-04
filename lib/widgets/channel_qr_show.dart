import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ChannelQrShow extends StatefulWidget {
  const ChannelQrShow(this.url, {super.key});

  final String url;
  @override
  State<ChannelQrShow> createState() => _ChannelQrShowState();
}

class _ChannelQrShowState extends State<ChannelQrShow> {
  final _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _urlController.text = '${widget.url.substring(0, 35)}...';
    return Column(
      children: [
        QrImageView(
          backgroundColor: Colors.white,
          data: widget.url,
          size: 300,
        ),
        const SizedBox(
          height: 8,
        ),
        InkWell(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: widget.url));
          },
          child: Column(
            children: [
              TextField(
                enabled: false,
                controller: _urlController,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Tap to Copy URL',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }
}
