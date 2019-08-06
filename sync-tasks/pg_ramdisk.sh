mkdir /Volumes/tmp_ramdisk/data
export PGPORT=5858
export pg_dir=/Volumes/tmp_ramdisk/data
pg_ctl init -D $pg_dir
pg_ctl -D $pg_dir start -o "-c fsync=off -c synchronous_commit=off -c full_page_writes=off"
RAILS_ENV=test bundle exec rake db:create db:schema:load db:migrate
