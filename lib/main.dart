import 'package:final_project/blocs/Auth_bloc/auth_bloc.dart';
import 'package:final_project/blocs/add_tooth_status_bloc/add_tooth_status_bloc.dart';
import 'package:final_project/blocs/community_bloc/community_bloc.dart';
import 'package:final_project/blocs/date_picker_bloc/date_piker_bloc.dart';
import 'package:final_project/blocs/documents_bloc/documents_bloc.dart';
import 'package:final_project/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:final_project/blocs/my_appointments_bloc/my_appointments_bloc.dart';
import 'package:final_project/blocs/status_chip_bloc/status_chip_bloc.dart';
import 'package:final_project/blocs/teeth_screen_bloc/teeth_screen_bloc.dart';
import 'package:final_project/blocs/timer_bloc/timer_bloc.dart';
import 'package:final_project/cubits/cubit/ai_cubit.dart';
import 'package:final_project/screens/welcome_screen.dart';
import 'package:final_project/services/supabase_auth_request.dart';
import 'package:final_project/services/supabase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await supabaseInitialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SupabaseFunctions().getUsers();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => DatePikerBloc(),
        ),
        BlocProvider(
          create: (context) => StatusChipBloc(),
        ),
        BlocProvider(
          create: (context) => AiCubit(),
        ),
        BlocProvider(
          create: (context) => MyAppointmentsBloc(),
        ),
        BlocProvider(
          create: (context) => AddToothStatusBloc(),
        ),
        BlocProvider(
          create: (context) => TeethScreenBloc(),
        ),
        BlocProvider(
          create: (context) => TimerBloc(),
        ),
        BlocProvider(
          create: (context) => CommunityBloc(),
        ),
        BlocProvider(
          create: (context) => EditProfileBloc(),
        ),
        BlocProvider(
          create: (context) => DocumentsBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          // Locale("en", "US"),
          Locale("ar", "AE"),
        ],
        theme: ThemeData(
          fontFamily: 'Cairo',
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
