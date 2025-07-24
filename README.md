# 🔐 LoginOptions - Flutter Authentication Demo

A complete **Flutter demo** showcasing **multiple authentication flows** with form validations, OTP screens, and timer logic. This app demonstrates best practices for modular code organization and reusable components using **GetX** for state management and routing.

---

## 📱 Available Login Options

This demo includes the following login combinations:

| Method |
|--------|
| ✅ Username + Password |
| ✅ Mobile Number + Password |
| ✅ Country Code + Mobile Number + Password |
| ✅ Email + Password |
| ✅ Mobile + OTP |
| ✅ Country Code + Mobile + OTP |
| ✅ Email + OTP |

All forms include basic validation (e.g., empty check, email format, phone validation).

---

## 🎥 UI Preview
<img src="assets/demo_login_options.gif" width="150" />

---

## 🧪 Features

- ✅ Multiple login flows (Password-based and OTP-based)
- ✅ OTP Input with Timer (using `pinput`)
- ✅ State Management with GetX
- ✅ Country Picker (`country_code_picker`)
- ✅ Custom splash screen (`flutter_native_splash`)
- ✅ SVG & responsive UI (`flutter_screenutil`)
- ✅ Modular project structure for scalability

---

## 📁 Folder Structure

```bash
lib/
│
├── common/                    # Shared widgets, helpers
├── screen/
│   ├── country_mobile_otp_login/
│   ├── country_mobile_password_login/
│   ├── email_otp_login/
│   ├── email_password_login/
│   ├── list/                  # Home/List of login options
│   ├── mobile_otp_login/
│   ├── mobile_password_login/
│   ├── otpscreen/            # OTP UI + timer
│   ├── splash/               # Splash screen
│   └── username_password_login/
│
├── utils/                     # Routing, page mapping
│   ├── app_pages.dart
│   ├── app_routes.dart
│   └── main.dart
