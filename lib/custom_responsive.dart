//! Crucial numbers - min width of device screens
import 'other_exports.dart';

const int mobileWidth = 200;
const int tabletWidth = 600;
const int desktopWidth = 1300;

///[CustomResponsive] Responsive layout for different device screens
class CustomResponsive extends StatelessWidget {
  final Widget? watch;
  final Widget? mobilePortrait;
  final Widget? mobileLandscape;
  final Widget? tabletPortrait;
  final Widget? tabletLandscape;
  final Widget? desktop;

  const CustomResponsive({
    Key? key,
    this.watch,
    this.mobilePortrait,
    this.mobileLandscape,
    this.tabletPortrait,
    this.tabletLandscape,
    this.desktop,
  }) : super(key: key);

//! Checks for screen sizes and orientation
  static bool watchBool(BuildContext context) =>
      MediaQuery.of(context).size.width > mobileWidth;

  static bool mobileLandscapeBool(BuildContext context) =>
      MediaQuery.of(context).size.height >= mobileWidth &&
      MediaQuery.of(context).size.height < tabletWidth &&
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool mobilePortraitBool(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileWidth &&
      MediaQuery.of(context).size.width < tabletWidth &&
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool tabletLandscapeBool(BuildContext context) =>
      MediaQuery.of(context).size.height >= tabletWidth &&
      MediaQuery.of(context).size.height < desktopWidth &&
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool tabletPortraitBool(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletWidth &&
      MediaQuery.of(context).size.width < desktopWidth &&
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool desktopBool(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopWidth;

  @override
  Widget build(BuildContext context) {
    //! Desktop Screen
    Widget _desktop() {
      return desktop != null
          ? desktop!
          : tabletLandscape != null
              ? tabletLandscape!
              : Center(
                  child:
                      Text('Please create a desktop view for goodness sake!!!'),
                );
    }

//! Tablet Landscape Screen
    Widget _tabletLandscape() {
      return tabletLandscape != null
          ? tabletLandscape!
          : desktop != null
              ? desktop!
              : Center(
                  child: Text(
                      'Please create a tablet landscape view for goodness sake!!!'),
                );
    }

//! Tablet Portrait Screen
    Widget _tabletPortrait() {
      return tabletPortrait != null
          ? tabletPortrait!
          : mobilePortrait != null
              ? mobilePortrait!
              : Center(
                  child: Text(
                      'Please create a tablet portrait view for goodness sake!!!'),
                );
    }

//! Mobile Landscape Screen
    Widget _mobileLandscape() {
      return mobileLandscape != null
          ? mobileLandscape!
          : Center(
              child: Text(
                  'Please create a mobile landscape view for goodness sake!!!'),
            );
    }

//! Mobile Portrait Screen
    Widget _mobilePortrait() {
      return mobilePortrait != null
          ? mobilePortrait!
          : Center(
              child: Text(
                  'Please create a mobile portrait view for goodness sake!!!'),
            );
    }

//! Watch Screen
    Widget _watch() {
      return watch != null
          ? watch!
          : Center(
              child: Text('You have not assigned any screens.'),
            );
    }

    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      double _height = constraints.maxHeight;
      //! Checks device orientation
      var isPotrait =
          MediaQuery.of(context).orientation == Orientation.portrait;

//! if else statements to check for screen width/height & then applying the right screen
      if (_width >= desktopWidth) {
        return _desktop();
      } else if (_height >= tabletWidth &&
          _height < desktopWidth &&
          isPotrait == false) {
        return _tabletLandscape();
      } else if (_width >= tabletWidth &&
          _width < desktopWidth &&
          isPotrait == true) {
        return _tabletPortrait();
      } else if (_height >= mobileWidth &&
          _height < tabletWidth &&
          isPotrait == false) {
        return _mobileLandscape();
      } else if (_width >= mobileWidth &&
          _width < tabletWidth &&
          isPotrait == true) {
        return _mobilePortrait();
      } else {
        return _watch();
      }
    });
  }
}
