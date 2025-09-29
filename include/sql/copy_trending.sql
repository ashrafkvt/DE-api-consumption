
-- IMPORTANT: Replace placeholders with your actual Snowflake object names.

COPY INTO your_raw_db.your_schema.raw_trending
FROM @your_s3_stage/{{ params.s3_key }}
FILE_FORMAT = (TYPE = 'JSON')
ON_ERROR = 'CONTINUE';
