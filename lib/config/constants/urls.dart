// const baseUrl = 'https://sajiloyatayatbackend.samirk.com.np';
const baseUrl = 'http://192.168.1.97:3001';
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
String getBookedSeatByDepartureIdUrl(String departureId) =>
    '$baseUrl/departure/booked-seats/$departureId';

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

// location apis
const getAllLocationsUrl = '$baseUrl/location/get-all-locations';

// payment apis
// khalti apis
const initilizeKhaltiPaymentUrl = '$baseUrl/pay/khalti/initpayment';
const confirmKhaltiPaymentUrl = '$baseUrl/pay/khalti/verify';

// transactions api
String getBusTransactionsUrl(String busId) =>
    '$baseUrl/transactions/get-all-transactions/bus/$busId';
const getUsersTransactionsUrl =
    '$baseUrl/transactions/get-all-transactions/user';
