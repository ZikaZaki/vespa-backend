# Motorcycles Appointment

## Introduction
 
The following API documentation outlines the endpoints for a Motorcycle appointment scheduling application. The endpoints include the ability to register a new user, login, view available Motorcycles, schedule appointments, and view upcoming appointments for a logged in user. Each endpoint includes the relevant URL, HTTP method, expected data in the request body (if applicable), and the expected response in JSON format. Example code is also provided for reference on how to use the endpoint in a JavaScript application using the axios library.

## Authentication
The API documentation outlined above includes two endpoints that handle authentication, specifically "Register new user" and "Login". When a user logs in successfully, they will receive a JSON response that includes a token. This token should be saved by the user and included in the header of every subsequent request to access protected endpoints.


## End points

- **Register new user** : This end point is used to sign up a new user
   - Endpoint: https://Motorcycle-appointment-hbcv.onrender.com/users
   - Method: POST
   - Request Body: JSON data including name, username, email, and password
  ```javascript
  {
      name: 'Ali',
      username: 'ALI_M',
      email: "ali123@gmail.com",
      password: "123456"
  }
  ```

   - Response: JSON data including id, name, username, email, password_digest, isAdmin, created_at, and updated_at
   - Example Response:
  ```
   {
      "id": 4,
      "name": "Ali",
      "username": "ALI_M",
      "email": "ali123@gmail.com",
      "password_digest": "$2a$12$kuXk5y71wUjnTrzZTOnVfOC33IhEtnyC4oOoAWNd8imUf5tZxFegC",
      "isAdmin": false,
      "created_at": "2023-01-24T16:59:26.977Z",
      "updated_at": "2023-01-24T16:59:26.977Z"
  }
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.post('https://Motorcycle-appointment-hbcv.onrender.com/users', {name: 'John Smith', username: 'testusername', email: "john@gmail", password: "123456"})
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
    });
  ```

- **Login** : This end point is used to login 
   - Endpoint: https://Motorcycle-appointment-hbcv.onrender.com/auth/login
   - Method: POST
   - Request Body: JSON data including name, username, email, and password
  ```javascript
  {
      email: "ali123@gmail.com",
      password: "123456"
  }
  ```

   - Response: JSON data including token and is_admin
   - Example Response:
  ```
   {
      "token": "eyJhbGciOiJIUzI1NiJ9.eyJhY2NvdW50X2lkIjoyLCJleHAiOjE2NzUxODMzMzN9.QaXuISDXN2axaUa7Zu1uiuVkDAbVtp4Ce21MteJvyjQ",
      "is_admin": true
  }
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.post('https://Motorcycle-appointment-hbcv.onrender.com/auth/login', {email: "user1@gmail.com", password: "123456"})
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```

- **Get Motorcycles** : this end point returns a list of available Motorcycles
   - Endpoint: https://Motorcycle-appointment-hbcv.onrender.com/Motorcycles
   - Method: GET

   - Response: JSON data including of Motorcycles with thier details
   - Example Response:
  ```
   [
      { 
          "motor_id": 1,
          "motor_name": "Motorcycle1",
          "motor_description": "description1",
          "motor_no": "1",
          "finance_fee": "finance_fee1",
          "purchase_fee": "purchase_fee1",
          "production_date": "production_date1",
          "created_at": "2023-01-24T16:31:24.327Z",
          "updated_at": "2023-01-24T16:31:24.327Z"


      },
      {
          "motor_id": 2,
          "motor_name": "Motorcycle2",
          "motor_description": "description2",
          "motor_no": "2",
          "finance_fee": "finance_fee2",
          "purchase_fee": "purchase_fee2",
          "production_date": "production_date2",
          "created_at": "2023-01-24T16:31:24.327Z",
          "updated_at": "2023-01-24T16:31:24.327Z"
      },
      {
          "motor_id": 3,
          "motor_name": "Motorcycle3",
          "motor_description": "description3",
          "motor_no": "3",
          "finance_fee": "finance_fee3",
          "purchase_fee": "purchase_fee3",
          "production_date": "production_date3",
          "created_at": "2023-01-24T16:31:24.327Z",
          "updated_at": "2023-01-24T16:31:24.327Z"
      },
      {
          "motor_id": 4,
          "motor_name": "Motorcycle4",
          "motor_description": "description4",
          "motor_no": "4",
          "finance_fee": "finance_fee4",
          "purchase_fee": "purchase_fee4",
          "production_date": "production_date4",
          "created_at": "2023-01-24T16:31:24.327Z",
          "updated_at": "2023-01-24T16:31:24.327Z"
      }
  ]
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  axios.get('https://Motorcycle-appointment-hbcv.onrender.com/Motorcycles')
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```

- **Create new Motorcycle** : this end point is responsible for creating a new Motorcycle
   > **Important note**
   >only admins can create new Motorcycle if you want to create new Motorcycle
   >you have to login as admin with the follwing email and password
   >- email: user1@gmail.com
   >- password: 123456
   - Endpoint: https://Motorcycle-appointment-hbcv.onrender.com/Motorcycles
   - Method: POST
   - Request Body: JSON data including name, picture, model, and bio
  ```javascript
  {  
          "motor_id": 1,
          "motor_name": "Vespa600",
          "motor_description": "A green motorcycle",
          "motor_no": "1",
          "finance_fee": "$4000",
          "purchase_fee": "$7000",
          "production_date": "2020-01-24T16:31:24.327Z",
          "created_at": "2023-01-24T16:31:24.327Z",
          "updated_at": "2023-01-24T16:31:24.327Z"
  }
  ```

   - Response: JSON data including the Motorcycle that has been created along with other details about the Motorcycle
   - Example Response:
  ```
   {
          "motor_id": 1,
          "motor_name": "Vespa 8900",
          "motor_description": "A red motorcycle",
          "motor_no": "1",
          "finance_fee": "$4000",
          "purchase_fee": "$7000",
          "production_date": "2018-01-24T16:31:24.327Z",
          "created_at": "2018-01-24T16:31:24.327Z",
          "updated_at": "2018-01-24T16:31:24.327Z"
  }
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  axios.post('https://Motorcycle-appointment-hbcv.onrender.com/Motorcycles',{name: 'test_name', picture: 'test_picture',model: 'test_model',bio: 'test_bio'})
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```

- **Get reservations** : This end point returns a list of the reservations the user has created by the logged in user
   - Endpoint: https://Motorcycle-appointment-hbcv.onrender.com/reservations
   - Method: GET

   - Response: JSON data including the list of all reservations created by the logged-in user
   - Example Response:
  ```
   [
    {
      id: 1,
      city: 'Berlin',
      date: '2023-05-01',
      Motorcycle_id: 1,
      account_id: 2,
      created_at: '2023-01-24T16:31:24.352Z',
      updated_at: '2023-01-24T16:31:24.352Z'
    },
    {
      id: 2,
      city: 'New-York',
      date: '2023-05-02',
      Motorcycle_id: 2,
      account_id: 2,
      created_at: '2023-01-24T16:31:24.360Z',
      updated_at: '2023-01-24T16:31:24.360Z'
    }
  ]
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  axios.get('https://Motorcycle-appointment-hbcv.onrender.com/reservations')
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```

- **Create reservation** : This end point is responsible for creating reservation for the logged-in user
   - Endpoint: https://Motorcycle-appointment-hbcv.onrender.com/reservations
   - Method: POST
   - Request Body: JSON data including date, city, and Motorcycle_id
  ```javascript
  {
      date: '2022-5-1',
      city: 'test_city',
      Motorcycle_id: 2
  }
  ```

   - Response: JSON data including all the details about created reservation
   - Example Response:
  ```
   {
    id: 6,
    city: 'test_city',
    date: '2022-05-01',
    Motorcycle_id: 2,
    account_id: 2,
    created_at: '2023-01-24T19:43:53.352Z',
    updated_at: '2023-01-24T19:43:53.352Z'
  }
  ```
   - Example Code:
  ```javascript
  const axios = require('axios');
  axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
  axios.post('https://Motorcycle-appointment-hbcv.onrender.com/reservations',{date: '2022-5-1', city: 'test_city',Motorcycle_id: 2})
    .then(response => {
      console.log(response.data);
    })
    .catch(error => {
      console.log(error);
  });
  ```
