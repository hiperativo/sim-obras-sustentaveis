cd `dirname $0`
bundle install
rake db:migrate
foreman start -p 7000