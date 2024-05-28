# Power+Playbook Dashboard

## Table of Contents

- [Overview](#overview)
- [Requirements](#requirements)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [APIs](#apis)
- [Technologies Used](#technologies-used)
- [Stray Thoughts](#stray-thoughts)

## Overview

This is a mock dashboard built on Ruby on Rails with the Playbook design system.

Link to the [live sandbox](https://secret-everglades-10866-ba4bd045ad04.herokuapp.com/).

To view the code, go to [examples/rails-react-example](examples/rails-react-example).

## Requirements

- Ruby version: `3.3.0`
- Rails version: `1.22.15`
- Database: PostgreSQL, Redis.

## Setup and Installation

For more details on setup, go to the [README](examples/rails-react-example/README.md).

1. **Clone the repository and go to /examples/rails-react-example:**

   ```sh
   git clone https://github.com/kangaree/pbdb.git
   cd pbdb/examples/rails-react-example
   ```

2. **Install dependencies:**

   ```sh
   bundle install
   ```

3. **Set up the database:**

   ```sh
   rails db:create
   rails db:migrate
   ```

4. **Run the application:**

   ```sh
   yarn watch
   ```

   ```sh
   rails server
   ```

## Usage

- **Access the application:** Open your browser and navigate to `http://localhost:3000`

## APIs

### Tickets

I scaffolded tickets out:
```sh
rails g scaffold ticket title:string content:text ticket_type:string user_name:string user_image:string
```

You have access to all the usual CRUD actions on /tickets. 

### Zen Quotes API

This app uses one external API, [Zen Quotes API](https://zenquotes.io/), to mock notifications.

In the app, you can access the Zen Quotes dialog by clicking the "bell" icon in the nav bar.

## Technologies Used

- **Ruby on Rails**: Web application framework
- **React**: Web application framework, not used
- **Playbook**: Design System
- **Font Awesome Free**: Icons, limited to a small subset as most free icons are bold
- **PostgreSQL**: Database, switched out from SQLite so the db persists on Heroku
- **Turbo Stream**: Redis, for live updates through websockets
- **HTTParty**: HTTP requests, for Zen Quotes API.

## Stray Thoughts

### Responsiveness

I factored for mobile and desktop in mind. 

I didn't get to properly test out tablets.

### Testing

If I could redo this challenge, I would've started by working on testing before
building. 

### Turbo Stream

I made a very quick example of Turbo Stream with tickets.

It works _only_ if you're making a CUD action in the "New" category. 
Long story short, there's one stream for "tickets", but I need to split this
out into five streams for each category. 

And if you make a new ticket and there's already 7 tickets, the new ticket
will show after the "Show More" button!