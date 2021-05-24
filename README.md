<h1 align="center">Backend - Coffee Shop</h1>
<p align="center">
  <a href="https://coffee-shop-bohdan.netlify.app/" target="_blank"><img height="140" src="https://user-images.githubusercontent.com/55057008/119323729-3afbaf80-bca9-11eb-85eb-b0d6b67a2c33.png" alt="Coffee-Shop" border="0" /></a>
</p>

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Built With](#built-with)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Documentation](#documentation)
- [Link](#link)
- [Authors](#authors)

## Introduction

Coffee Shop is a food ordering service application that gives customers complete control over ordering menus on their respective gadgets with direct payment options connected to the application. Premium features for a fast, effective and economical solution.

## Features

- JWT Authentication

- Multilevel Authorization

- Nodemailer For Mailer

- Upload Image Multer

- Redis Server

- Form Validation Using Joi

- CRUD Orders

- CRUD Products

- CRUD Users

## Built With

- [ExpressJs](https://www.npmjs.com/package/express)
- [MySQL](https://www.npmjs.com/package/mysql2)
- [Bcrypt](https://www.npmjs.com/package/bcrypt)
- [Cors](https://www.npmjs.com/package/cors)
- [Dotenv](https://www.npmjs.com/package/dotenv)
- [JWT](https://www.npmjs.com/package/jsonwebtoken)
- [Lodash](https://www.npmjs.com/package/lodash)
- [Moment](https://www.npmjs.com/package/moment)
- [Multer](https://www.npmjs.com/package/multer)
- [Morgan](https://www.npmjs.com/package/morgan)
- [Joi](https://www.npmjs.com/package/joi)
- [Ip](https://www.npmjs.com/package/ip)
- [Nodemailer](https://www.npmjs.com/package/nodemailer)
- [Nodemon](https://www.npmjs.com/package/nodemon)
- [Redis](https://www.npmjs.com/package/redis)

## Prerequisites

- [NodeJs](https://nodejs.org/en/download/)
- [XAMPP](https://www.apachefriends.org/index.html)

## Installation

1. Clone the repository

```
git clone https://github.com/bohdan-28/coffee-shop-backend.git
cd coffee-shop-backend
```

2. Install package

```
npm install
```

3. Create a new database with a name `coffee-shop` and import `coffee-shop.sql` from this repository

4. Create .env file

```
# Host & Port
HOST=
PORT=
PORT_FRONTEND=

# Database
DB_HOST=
DB_USER=
DB_PASS=
DB_NAME=coffee-shop

# Secret Key
SECRET_KEY=

# Email
EMAIL_USER=
EMAIL_PASS=

# Redis
REDIS_PORT=6379
```

5. Run application

```
npm run dev
```

Or

```
npm start
```

## Documentation

[![Run in Postman](https://run.pstmn.io/button.svg)](https://documenter.getpostman.com/view/11970262/TzCV4Qae)

## Link

- :white_check_mark: [`Frontend Coffee Shop`](https://github.com/bohdan-28/coffee-shop-frontend)
- :rocket: [`Publication`](https://coffee-shop-bohdan.netlify.app/)

## Authors

1.  [Herza Paramayudhanto](https://github.com/herzaparam) - Frontend - PM
2.  [Chaerul Marwan](https://github.com/chaerulmarwan20) - Full Stack - Member
3.  [Nevalen Aginda Prasetyo](https://github.com/nevalenaginda) - Backend - Member
4.  [Abu Dzar Al-ghifari](https://github.com/abudzr) - Frontend - Member
5.  [Kevin Farid Alpharisy](https://github.com/kevinfaridap) - Frontend - Member
