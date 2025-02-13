# Aleph form

This project is a **Aleph Form** built with Laravel, Docker

## Prerequisites

Ensure you have the following tools installed:

- **Docker**
- **Docker Compose**

## Project Setup

### Step 1: Clone the Repository

Clone the repository to your local machine:

```bash

# Clone using HTTPS  
git clone https://github.com/LeonardD93/Aleph.git

# Or clone using SSH  
git clone git@github.com:LeonardD93/Aleph.git


```
Navigate to the project directory:

```bash

cd Aleph

```

### Step 2: Build and Start the Docker Containers

1.  create the .env file for the Docker and configure it with your configuration
```bash
cp .env.example .env

```
2. create the symbolic link file .env for the laravel application
```bash
ln -s ../.env aleph-laravel/.env
```

Build and run the Docker containers:

```bash
docker compose build
docker compose up -d
```

Services started by these commands:

- **PHP-FPM**: Runs Laravel.
- **Nginx**: Serves the Laravel application.
- **MySQL**: Database service.
- **Mailhog** For email testing.
- **PhpMyAdmin**: Web interface for MySQL (disable in production).

### Step 3: Configure the Application


1. **Enter the Docker container**:
```bash
   docker compose exec --user root app bash
```

2. **Install dependencies and generate an application key**:
```bash
   composer install
   php artisan key:generate 
```

### Step 4: Set File Permissions

in a new terminal, set proper permissions for the `aleph-laravel` directory:
```bash
sudo chown -R www-data:www-data aleph-laravel/
```

if you use the repository localy you can also use the following command to set permissions (warning security in production )
```bash
sudo chmod -R 777 aleph-laravel/
```

### Step 5: Access the Application

Visit the application in your browser at:

```
http://localhost:8080
```

If everything is set up correctly, the default Laravel welcome page should appear.


## Additional Commands

### Mailhog

Access Mailhog at:
```
http://localhost:8025/
```