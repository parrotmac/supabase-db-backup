# PostgreSQL Backup to Supabase Storage

This is a tool that lets you backup your PostgreSQL database to Supabase Storage. The tool runs as a Docker container and can be scheduled to run at specific times using a cron service like Render.com.

## Prerequisites

- Docker
- A PostgreSQL database to backup
- A Supabase account and Storage bucket

## Installation

1. Clone this repository
2. Build the Docker image: `docker build -t backup-to-supabase .`

## Configuration

The following environment variables are required:

- `SUPABASE_PROJECT_ID`: The unique ID of your Supabase project
- `SUPABASE_SERVICE_KEY`: A service key for your Supabase project (see [Supabase docs](https://supabase.io/docs/guides/api#service-role))
- `DATABASE_URL`: The URL of the PostgreSQL database to backup

The following environment variable is optional:

- `SUPABASE_BUCKET_NAME`: The name of the Supabase Storage bucket to store the backups in. Defaults to `database-backups`.

You can set these environment variables by creating a file called `.env` in the root directory of this project, with the following content:

```
SUPABASE_PROJECT_ID=your_project_id
SUPABASE_SERVICE_KEY=your_service_key
SUPABASE_BUCKET_NAME=your_bucket_name # defaults to 'database-backups'
DATABASE_URL=your_database_url
```

Alternatively, you can set these environment variables using the method recommended by your hosting provider.

## Usage

To run the backup process manually, you can use the following command:

```
docker run --rm --env-file .env backup-to-supabase
```


To schedule the backup process to run at specific times, you can use a cron service like Render.com. In Render.com, create a new cron job and set the command to:

```
docker run --rm --env-file /path/to/your/.env backup-to-supabase
```

Set the schedule to the desired frequency (e.g. daily, weekly) and the timezone to your local timezone.

For example, a cron schedule that would execute 6 minutes past every 12 hours would be

```cron
6 */12 * * *
```

## License

This project is licensed under the [MIT License](LICENSE).
