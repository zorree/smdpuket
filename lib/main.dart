
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_delegate.dart';
import 'ui/dashboard_app.dart';
import 'ui/widgets/widgets.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    BlocSupervisor.delegate = MyBlocDelegate();
  runApp(DashboardApp());
}


