# Flutter Basic Unit Testing with Mockito

This project demonstrates how to perform **Basic Unit Testing** in Flutter using **Mockito** and **build_runner**. It includes examples of handling `POST` and `GET` methods using the `http` library and provides a structured approach to simulate API interactions in unit tests. 

## Features
- **Unit Testing with Mockito:** Learn how to mock and test API responses effectively.
- **Predefined JSON Data:** A JSON file is provided to simplify testing. This file is parsed using the `path` library in `test/read_json.dart` into a `Map<String, dynamic>` type.
- **HTTP Methods Simulation:** The project implements `POST` and `GET` methods in `lib/service` to simulate real API requests and responses.

## Testing Scenarios
The unit tests cover the following HTTP status codes:
1. **200 (Success)**: Valid requests and responses.
2. **400 (Bad Request)**: Client-side errors.
3. **404 (Not Found)**: Resource not found.
4. **500 (Internal Server Error)**: Server-side errors.

### Data Used
1. **Login**
2. **Product**

Each data type is tested against all four HTTP status codes mentioned above.

## How to Run the Tests
1. Clone this repository to your local machine.
2. Install dependencies by running:
   ```bash
   flutter pub get
   ```
3. Generate mock files using build_runner:
   ```bash
   flutter pub run build_runner build
   ```
4. Run the unit tests:
   ```bash
   flutter pub get
   ```

## Folder Structure
lib/ 
├── service
│ ├── api_service.dart 
│ └── api_service_impl.dart 
test/ 
├── read_json.dart 
├── login
│ └── login_mockito_test.dart 
├── product
│ └── product_mockito_test.dart

## Dependencies
- Mockito: For mocking objects and verifying interactions.
- build_runner: To generate mock classes.
- http: For HTTP requests simulation.
- path: For parsing JSON files.
