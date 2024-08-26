# Use an official Ruby runtime as a parent image
FROM ruby:3.1.2

# Set the working directory inside the Docker container
WORKDIR /app

# Install dependencies for the application
RUN apt-get update -qq && apt-get install -y nodejs yarn sqlite3 libsqlite3-dev

# Copy the Gemfile and Gemfile.lock into the Docker container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code into the Docker container
COPY . .

# Precompile assets for production
RUN bundle exec rails assets:precompile

# Expose the port the app runs on
EXPOSE 3000

# Set environment variables for the Rails environment
ENV RAILS_ENV=development

# Use build argument for SECRET_KEY_BASE
ARG SECRET_KEY_BASE
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE

# Specify the command to run the application server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
