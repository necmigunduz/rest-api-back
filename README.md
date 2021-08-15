![](https://img.shields.io/badge/Microverse-blueviolet)

# BodyMonitor Api

This api is the backend of the BodyMonitor app. The link for the deployed version is [here](https://rest-api-front.herokuapp.com/)

- POST /users 
Arguments.:
```
{
  name: <username>
  password: <your_password>
}
```
creates a user and responds with:
```
{
  user: {}
  token: user_token
}
```

- POST/login 
Arguments:
```
{
  name: <username>
  password: <your_password>
}
```
Logs in the user and responds with:
```
{
  user: {}
  token: user_token
}
```

- GET /units 
Arguments:
```
headers: {
  Authorization: 'Bearer <token>'
}
```
Returns a list of all the availiable units to measure

-GET /units/:id 
Arguments:
```
headers: {
  Authorization: 'Bearer <token>'
}
```
Returns the unit with :id and a list of its measurements

- GET /measurements
Arguments:
```
headers: {
  Authorization: 'Bearer <token>'
}
```
returns an object with the name of the unit as keys and the list of measurements as values

- POST /units/:unit_id/measurements 
Arguments:
```
headers: {
  Authorization: 'Bearer <token>'
}
body: {
  value: <float>
}
```
Creates a measurement for the corresponding unit

- PUT /units/:unit_id/measurements/:id
Arguments:
```
headers: {
  Authorization: 'Bearer <token>'
}
body: {
  value: <float>
}
```
Updates the value of the given measurement

-DELETE /units/:unit_id/measurements/:id
Arguments:
```
headers: {
  Authorization: 'Bearer <token>'
}
```
Deletes the given measurement


## Built With

- Ruby on Rails

## Getting Started

The project uses the postgresql database
To test the endpoints locally you can use tunneling with ngrok or a similar tool

- `git clone https://github.com/necmigunduz/rest-api-back.git`
- `cd rest-api-back`
- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed` to populate the default units in seeds.rb.

To run the tests:

- `bundle exec rspec`

## Author

👤 **Necmi Gunduz**

- LinkedIn: [Necmi Gunduz](https://www.linkedin.com/in/necmigunduz/)
- Github: [@necmigunduz](https://github.com/necmigunduz/)
- Twitter: [@necm_gun](https://twitter.com/necm_gun)
- Mail: [necmigunduz@gmail.com](necmigunduz@gmail.com)

## Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- To Microverse for their `README` template.

## 📝 [License]

MIT License
