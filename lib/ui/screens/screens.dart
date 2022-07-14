import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guhtix/bloc/blocs.dart';
import 'package:guhtix/model/models.dart';
import 'package:guhtix/services/services.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guhtix/shared/shared.dart';
import 'package:guhtix/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flushbar/flushbar.dart';
import 'package:intl/intl.dart';
// import 'package:another_flushbar/flushbar.dart';
// import 'package:another_flushbar/flushbar_helper.dart';
// import 'package:another_flushbar/flushbar_route.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:random_string/random_string.dart';
import 'package:guhtix/extensions/extensions.dart';

part 'splash_screen.dart';
part 'main_screen.dart';
part 'wrapper.dart';
part 'sign_in_screen.dart';
part 'movie_screen.dart';
part 'sign_up_screens.dart';
part 'account_confirmation_screen.dart';
part 'preference_screens.dart';
part 'movie_detail_screens.dart';
part 'select_schedule_screens.dart';
part 'select_seats_screen.dart';
part 'checkout_screen.dart';
part 'success_page.dart';
