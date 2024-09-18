sealed class Screen {
  String title;
  String route;

  Screen({required this.title, required this.route});
}

class ScreenDashboard extends Screen {
  ScreenDashboard() : super(title: "Dashboard", route: "/ScreenDashboard");
}

class ScreenSplash extends Screen {
  ScreenSplash() : super(title: "Splash", route: "/ScreenSplash");
}

class ScreenLogin extends Screen {
  ScreenLogin() : super(title: "Login", route: "/ScreenLogin");
}

class ScreenEducatorDetails extends Screen {
  ScreenEducatorDetails() : super(title: "EducatorDetails", route: "/ScreenEducatorDetails");
}

class ScreenLiveSessions extends Screen {
  ScreenLiveSessions() : super(title: "LiveSessions", route: "/ScreenLiveSessions");
}

class ScreenProfile extends Screen {
  ScreenProfile() : super(title: "Profile", route: "/ScreenProfile");
}
