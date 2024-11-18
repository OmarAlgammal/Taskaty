import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InteractiveText extends StatelessWidget {
  final String text;

  InteractiveText(this.text);

  // Updated regex for URLs to handle "chatgpt.com" format
  final RegExp urlRegEx = RegExp(r'((https?:\/\/|www\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,6}(\.[a-zA-Z]{2,6})?)');
  final RegExp phoneRegEx = RegExp(r'(\+?\d{1,3})?\s?-?\(?\d{1,4}\)?\s?-?\d{1,4}\s?-?\d{1,9}');

  // Parses the text and identifies URLs, phone numbers, and plain text
  List<Map<String, dynamic>> parseText(String text) {
    List<Map<String, dynamic>> parts = [];

    int start = 0;
    text.splitMapJoin(
      RegExp('${urlRegEx.pattern}|${phoneRegEx.pattern}'),
      onMatch: (match) {
        if (match.start > start) {
          parts.add({'text': text.substring(start, match.start), 'type': 'text'});
        }
        parts.add({'text': match[0]!, 'type': urlRegEx.hasMatch(match[0]!) ? 'url' : 'phone'});
        start = match.end;
        return match[0]!;
      },
      onNonMatch: (nonMatch) {
        if (nonMatch.isNotEmpty) {
          parts.add({'text': nonMatch, 'type': 'text'});
        }
        return nonMatch;
      },
    );

    return parts;
  }

  // Launches the URL in the browser
  Future<void> _launchUrl(String url) async {
    if (!url.startsWith('http')) {
      url = 'https://$url';  // Ensure URLs start with "https://"
    }
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Dials the phone number
  Future<void> _dialPhoneNumber(String number) async {
    final Uri telUri = Uri(scheme: 'tel', path: number);
    if (await canLaunch(telUri.toString())) {
      await launch(telUri.toString());
    } else {
      throw 'Could not dial $number';
    }
  }

  @override
  Widget build(BuildContext context) {
    final parts = parseText(text);

    return RichText(
      text: TextSpan(
        children: parts.map((part) {
          if (part['type'] == 'url') {
            return TextSpan(
              text: part['text'],
              style: TextStyle(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _launchUrl(part['text']),
            );
          } else if (part['type'] == 'phone') {
            return TextSpan(
              text: part['text'],
              //style: TextStyle(decoration: TextDecoration.underline),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _dialPhoneNumber(part['text']),
            );
          } else {
            return TextSpan(
              text: part['text'],
            );
          }
        }).toList(),
      ),
    );
  }
}
