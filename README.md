# NYC.rb Meetup Demo App

This repository contains a Ruby on Rails application created as a demo for the NYC.rb meetup talk on Kamal deployments. This app showcases a basic setup to demonstrate how to deploy a Rails application using Kamal.

## Getting Started

### Prerequisites

- Ruby
- PostgreSQL
- Node.js and Yarn
- Redis
- Docker and Kamal CLI

### Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/dennmart/nycrb_meetup.git
   cd nycrb_meetup
   ```

2. **Install dependencies:**

   ```bash
   bundle install
   yarn install
   ```

3. **Setup the database:**

   ```bash
   rails db:setup
   ```

### Running Locally

To run the application locally in development mode:

```bash
./bin/dev
```

Visit `http://localhost:3000` in your browser to view the app.

### Deployment with Kamal

1. **Install Kamal CLI:**

   Follow the instructions on [Kamal's website](https://kamal-deploy.org/docs/installation/) to install the Kamal CLI.

2. **Configure Kamal:**

   Adjust the `config/deploy  .yml` file with your server and application settings.

3. **Perform the initial setup for the app on your servers:**

   ```bash
   kamal setup
   ```

4. **Deploy the app after updating:**

   ```bash
   kamal deploy
   ```
