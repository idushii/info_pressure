import 'package:flutter/material.dart';
import 'package:info_pressure/forms/add_form.dart';
import 'package:info_pressure/models/record_info.dart';
import 'package:info_pressure/state/record_cubit.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'models/record_info.dart';
import 'format_date_time.dart';
part 'my_app.dart';
part 'screens/main_screen.dart';
part 'screens/add_screen.dart';
part 'screens/edt_screen.dart';

void main() {
  runApp(MyApp());
}

