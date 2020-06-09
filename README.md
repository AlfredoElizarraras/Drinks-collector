# My drinks

> This app keeps track of your and yours friends drinks. It's purpose is to showcase all what I have learned in the Microverse course curriculum.


## Built With

- Ruby v2.7.1
- Ruby on Rails v6.0.3
- Postgresql

## Live Demo

  Will be available soon

### Prerequisites

- Ruby: 2.7.1
- Rails: 6.0.3
- Postgres: >=10.12


## Getting Started

To get a local copy up and running follow these simple example steps

- Clone the repository by running in the console of your local machine the following command

  ```
  git clone https://github.com/AlfredoElizarraras/My-drinks.git
  ```
- Change directory to My-drinks folder.

### Setup

If you have another ruby version and have rbenv, you can run:
```
  rbenv install 2.7.1
```

Install gems with:

```
bundle install
```

Setup database with:

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
   rails db:create
   rails db:migrate
```



### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec spec/models/. --format documentation
    rpsec spec/features/. --format documentation
```

### Deployment

- Change 'xyz' part so you have your own My drinks app deployed.
```
 heroku create My-drinks-xyz
 git push heroku +HEAD:master
 heroku run rails db:migrate
```

## Authors

👤 **Oscar Alfredo Gómez Elizarrarás**

- Github: [@AlfredoElizarraras](https://github.com/AlfredoElizarraras)
- Twitter: [@OscarAlfredoGm4](https://twitter.com/OscarAlfredoGm4)
- Linkedin: [@OscarAlfredoGómezElizarrarás](https://mx.linkedin.com/in/oscar-alfredo-gomez-elizarraras)

---

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse](https://microverse.org)
- [Odin project](https://www.theodinproject.com/)

---

## 📝 License

This project is [MIT](https://github.com/AlfredoElizarraras/My-drinks/blob/master/LICENSE) licensed.

Copyright 2020 Oscar Alfredo Gómez Elizarrarás

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---
