# Sajilo Yatayat Flutter

## Introduction

Sajilo Yatayat is cross platform app developed with flutter that lets you book bus tickets. It allows multi-seat booking, payment with khalti and has faring functionality. Faring basically allows travellers to ask the ticket for lower price which when accepted by the bus owner, the ticket price can be paid and booked. It is a mvp product developed for minor project of college project. It depends on firebase (you need to set it up), backend (mentioned below).
 - Backend : <a href="https://github.com/samirkhanalofficial/Sajilo-Yatayat-Backend-Bus-Ticket-Booking-With-Fare-Management/tree/main">Repo Link</a>



## Getting Started
Before starting make sure you generate `lib/firebase_options.dart` using firebase. Also make sure you include the `android/app/google-service.json`. It can be downloaded from firebase console.

1. clone the project

   ```terminal
   git clone git@github.com:samirkhanalofficial/Sajilo-Yatayat-Flutter-Bus-Ticket-Booking-With-Fare-Management.git
   ```

2. download dependiencies

   ```terminal
   flutter pub get
   ```

3. Build the models

   ```terminal
   dart run build_runner build
   ```

4. Run The project

   ```terminal
   flutter run
   ```



## Credits

Minor project done by the following team members:

- Sumit Ray
- Ritesh Karmacharya
- Babita Shrestha
- Samir Khanal
