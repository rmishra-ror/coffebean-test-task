# README

## Application Setup

* Run Bundle Install

```sh
	bundle install
```

* Configure local database credentials, I have added the `config/database.yml.example` for example purpose. You have to rename the `config/database.yml.example` to ``config/database.yml`.	You can check the <a href='https://www.freshworks.com/eng-blogs/managing-rails-application-secrets-with-encrypted-credentials-blog/'>blog</a> for more info. You have 

```sh

development:
  database_name: Your Database Name
  database_host: Your Database Host
  database_username: Your Database Username
  database_password: Your Database Password
  database_port: Your Databse Port    

```

* After your local database credential setup. Create the database and run the migration command.

```sh
	# Create Database
	rake db:create

	# Run Migration
	rake db:migrate
``` 

* Generate the seed data

```sh
	# generate the seed data

	rake db:seed
```

* After running the `rake db:seed` some users and projects are created into the system. You can login into the system by using the <b>email</b> : `tester@yopmail.com` and <b>password</b> : `Test@123` .
