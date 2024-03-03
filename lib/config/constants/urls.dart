// const baseUrl = 'https://sajiloyatayatbackend.samirk.com.np';
// const baseUrl = 'http://192.168.1.64:3001';
const baseUrl = 'http://192.168.1.90:3001';
// user apis
const registerUserUrl = '$baseUrl/user/create';
const getUserDetailsUrl = '$baseUrl/user/mydetails';

// bus apis
const addBusUrl = '$baseUrl/bus/add';
const getmyBusesUrl = '$baseUrl/bus/mybuses';

// departure apis
const addDepartureUrl = '$baseUrl/departure/add';
const getAllDepartureUrl = '$baseUrl/departure/get-departures';
String getBusDepartureUrl(String busId) =>
    '$baseUrl/departure/my-departure/$busId';

// fare apis
const addFareUrl = '$baseUrl/fare/create';
const getUserFareUrl = '$baseUrl/fare/user-fares';
String getBusFaresUrl(String busId) => '$baseUrl/fare/bus-fares/$busId';
String acceptFareUrl(String fareId) => '$baseUrl/fare/accept/$fareId';
String rejectFareUrl(String fareId) => '$baseUrl/fare/reject/$fareId';
String cancelFareUrl(String fareId) => '$baseUrl/fare/cancel/$fareId';
String changePriceAndOfferFareUrl(String fareId) =>
    '$baseUrl/fare/changePrice/$fareId';
String completeFareUrl(String fareId) => '$baseUrl/fare/complete/$fareId';
