String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

String validationName = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';

////////////////////////////////////////////////////////////////////////////////
// r'^
//   (?=.*[A-Z])       // should contain at least one upper case
//   (?=.*[a-z])       // should contain at least one lower case
//   (?=.*?[0-9])      // should contain at least one digit
//   (?=.*?[!@#\$&*~]) // should contain at least one Special character
//   .{8,}             // Must be at least 8 characters in length
// $
String validationPassword = r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$';

////////////////////////////////////////////////////////////////////////////////
String validationPhone = "";

String arabic = 'Arabic 🇸🇦';
String english = 'English 🇬🇧';
String france = 'French 🇫🇷';

String ara = 'ar';
String ene = 'en';
String frf = 'fr';
