
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void>launcCustomUr(BuildContext context,String? url)async
{
  if(url != null) {
    Uri uri =Uri.parse(url);
    if(await canLaunchUrl(uri))
      {
        await launchUrl(uri);
      }
    else{

    }
  }
}