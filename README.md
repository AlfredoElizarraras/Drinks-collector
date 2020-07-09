<h1 align="center">
 :coffee: Drinks collector :beer:
</h1>

## Table of Contents

* [About the Project](#about-the-project)
* [App Diagram](#app-diagram)
* [Video Presentation](#video-presentation)
* [Live Demo](#live-demo)
* [Project Management](#project-management)
* [Built With](#built-with)
* [Prerequisites](#prerequisites)
* [Getting started](#getting-started)
* [Usage](#usage)
* [Run automated tests](#run-automated-tests)
* [Deployment](#deployment)
* [Authors](#authors)
* [Contributing](#contributing)
* [Acknowledgments](#acknowledgments)
* [Screen shots](screen-shots)
* [License](#license)

## About the project

> This app keeps track of you and your friends drinks. It's purpose is to showcase all what I have learned in the Microverse course curriculum.

## App diagram

![ERD](/assets/images/Drinks_diagram.jpg?raw=true "ERD")

## Video presentation

You can find the video of the app [here](https://youtu.be/U3tEV4eN9vA) (you have to sign in on youtube to see the video.)

## Live Demo

[Drinks collector live app](https://drinks-collector.herokuapp.com)

## Project management
I used github [project management](https://github.com/users/AlfredoElizarraras/projects/3) to manage apps deadlines and due dates.

## Built With

- Ruby v2.7.1
- Ruby on Rails v6.0.3
- Postgresql

### Prerequisites

- Ruby: 2.7.1
- Rails: 6.0.3
- Postgres: >=10.12

## Getting Started

To get a local copy up and running follow these simple example steps

- Clone the repository by running in the console of your local machine the following command

  ```
  git clone https://github.com/AlfredoElizarraras/Drinks-collector.git
  ```
- Change directory to Drinks-collector folder.

> Setup

If you have another ruby version and have rbenv, you can run:
```
  rbenv install 2.7.1
```

> Install gems with:

```
bundle install
```

> Setup database with:

```
  sudo -u postgres psql
  CREATE ROLE developer WITH CREATEDB LOGIN PASSWORD 'pass123';
```
  Exit postgres console \q
  Make sure you have your yarn packages up to date. If not:
```
  yarn install --check-files
```
  Then
```
   rails db:setup
   rails db:migrate
```

## Usage

> Notes for development
1. As this is a web app is better to test it on a mobile, for this you can use [ngrok](https://ngrok.com/).
In ngrok page follow the instructions to download it for your own specific OS, then you can follow this [cool post](https://dev.to/ianvaughan/ngrok-on-rails-315m) that I followed in order to have ngrok running for development.
So you can do the following:
   1. Start ngrok in the console (in the folder directory you download and extract ngrok)
   ```
       ./ngrok http 3000
       export NGROK_HOST=ngrokHTTPSgivenURL
   ```
   
   2. Start server with:
   
   ```
       rails server
   ```
   3. Now you have to be able to visit the ngrok given URL on your mobile phone.
      OR

      Open `http://localhost:3000/` in your browser.

2. For testing, omniauth authentication is better if you use another deployment site or use GitHub as it is the only one of the three providers that accept callback for localhost 3000

## Run automated tests

```
    rpsec spec/models/. --format documentation
    rpsec spec/features/. --format documentation
```
### Deployment

- Change the 'xyz' part so you have your own Drinks collector app deployed.
```
 heroku create drinks-collector-xyz
 git push heroku +HEAD:master
 heroku run rails db:migrate
```
- To manage Environment variables I used [Figaro gem](https://github.com/laserlemon/figaro), so you can push the variables to Heroku as in the Figaros gem documentation
```
 figaro heroku:set -e production
```

## Authors

👤 **Oscar Alfredo Gómez Elizarrarás**

- Github: [@AlfredoElizarraras](https://github.com/AlfredoElizarraras)
- Twitter: [@OscarAlfredoGm4](https://twitter.com/OscarAlfredoGm4)
- Linkedin: [@OscarAlfredoGómezElizarrarás](https://mx.linkedin.com/in/oscar-alfredo-gomez-elizarraras)

## Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/AlfredoElizarraras/Drinks-collector/issues).

### Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://microverse.org)
- [Odin project](https://www.theodinproject.com/)
- I took the idea of this app from [Gregoire Vella on Behance](https://www.behance.net/gregoirevella) from his awsome design [Snapscan](https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding?tracking_source=)
- The whole project requirements, came from microverse capstone project in [notion: group our transactions](https://www.notion.so/Group-our-transactions-ccea2b6642664540a70de9f30bdff4ce)
- The icons I used, are from the next resources:
  - [Flaticons](www.flaticon.com)
  - [Icons 8](https://icons8.com/)
  - [Fontawesome](https://fontawesome.com/)
- I took the font used in the entire app from [google fonts](https://fonts.google.com/specimen/Ibarra+Real+Nova?query=Nova)

## Screen shots

- App screens:
![Login](/assets/images/login.jpeg?raw=true "Login")
![Sign up](/assets/images/sign_up.jpeg?raw=true "Sign up")
![Profile page](/assets/images/user_profile.jpeg?raw=true "Profile page")
![Profile page 1](/assets/images/user_profile_1.jpeg?raw=true "Profile page 1")
![All my drinks](/assets/images/all_my_drinks.jpeg?raw=true "All my drinks")
![All my external drinks](/assets/images/all_my_external_drinks.jpeg?raw=true "All my external drinks")
![Drink deletion](/assets/images/drink_deletion.jpeg?raw=true "Drink deletion")
![Add new drink](/assets/images/add_new_drink.jpeg?raw=true "Add new drink")
![All my groups](/assets/images/all_my_groups.jpeg?raw=true "All my groups")
![Add new group](/assets/images/add_new_group.jpeg?raw=true "Add new group")
![All my groups 1](/assets/images/all_my_groups_1.jpeg?raw=true "All my groups 1")
![Select a group](/assets/images/select_a_group.jpeg?raw=true "Select a group")

---

## License

This project is [MIT](https://github.com/AlfredoElizarraras/Drinks-collector/blob/master/LICENSE) licensed.

Copyright 2020 Oscar Alfredo Gómez Elizarrarás

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---
