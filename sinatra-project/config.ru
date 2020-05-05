require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#get access to put/patch and delete
use Rack::MethodOverride


use SongsController
use UsersController
run ApplicationController
