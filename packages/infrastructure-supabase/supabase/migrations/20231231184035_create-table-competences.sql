create table competences (
  id bigint generated by default as identity primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null,
  deleted_at timestamp with time zone default timezone('utc'::text, now()),
  value text not null,
  type text,
  unique (value)
);

create extension if not exists moddatetime schema extensions;

-- assuming the table name is "todos", and a timestamp column "updated_at"
-- this trigger will set the "updated_at" column to the current timestamp for every update
create trigger
  handle_updated_at before update
on competences
for each row execute
  procedure moddatetime(updated_at);