#!/usr/bin/env bash

set -euo pipefail

DATABASE_URL="${DATABASE_URL}"

SUPABASE_PROJECT_ID="${SUPABASE_PROJECT_ID}"
SUPABASE_SERVICE_KEY="${SUPABASE_SERVICE_KEY}"
SUPABASE_BUCKET_NAME="${SUPABASE_BUCKET_NAME:-database-backups}"

TIMESTAMP="$(date +%s)"

DUMP_FILE="db-dump-${TIMESTAMP}.sql"

echo "Creating dump at ${DUMP_FILE}"

time pg_dump -d "${DATABASE_URL}" -f "${DUMP_FILE}"

echo "Dump complete. Uploading..."

curl \
	-H "Authorization: Bearer ${SUPABASE_SERVICE_KEY}" \
	-F "data=@${DUMP_FILE}" \
	"https://${SUPABASE_PROJECT_ID}.supabase.co/storage/v1/object/${SUPABASE_BUCKET_NAME}/${DUMP_FILE}"

