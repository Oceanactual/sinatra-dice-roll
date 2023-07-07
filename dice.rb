require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get ("/") do
  "Hello World"
  #![](http://127.0.0.1:4567/roll_with_advantage)
  "<a href = "http://127.0.0.1:4567/roll_with_advantage">Roll with Advantage</a>"
end

get ("/zebra") do
  "We must add a route for each path we want to support"
end

get ("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end

get ("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
  outcome = "You rolled a #{first_die}, and a #{second_die} for a total of #{sum}"

  "<h1>2d6</h1>
  <p>#{outcome}</p>"
end

get ("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die
  outcome = "You rolled #{first_die}, and a #{second_die} for a total of #{sum}"

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

get ("/dice/1/20") do
  first_die = rand(1..20)
  outcome = "You rolled #{first_die}"

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end

get ("/dice/5/4") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  third_die = rand(1..10)
  fourth_die = rand(1..10)
  fifth_die = rand(1..10)
  sum = first_die + second_die + third_die + fourth_die + fifth_die
  outcome = "You rolled #{first_die}, a #{second_die}, a #{third_die}, a #{fourth_die}, and a #{fifth_die} for a total of #{sum}"

  "<h1>2d10</h1>
  <p>#{outcome}</p>"
end

get ("/roll_with_advantage") do
  first_die = rand(1..20)
  second_die = rand(1..20)
  roll = [first_die, second_die].max
  outcome = "You rolled #{first_die}, and #{second_die}. With advantage you rolled #{roll}"

  "<h1>Roll with Advantage</h1>
  <p>#{outcome}</p>"
end
