# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test1 = User.create(username: "test", password: "passs", password_confirmation: "passs")
donny = test1.drivers.build({first_name: "Donny", last_name: "Don"})
donny.save
test2 = User.create(username: "test2", password: "pass2", password_confirmation: "pass2")

james = Client.create(full_name: "James Don", pay_rate: 50.0)
jack = Client.create(full_name: "Jack Don", pay_rate: 30.0)

punchIn = Punch.create( clock_in: Time.new.strftime("%H%M"), date: Time.new.strftime("%B"), month_day: Time.new.strftime("%b %e"))
punchOut = Punch.create(clock_out: "2420", date: Time.new.strftime("%B"), month_day: Time.new.strftime("%b %e"))
punchIn2 = Punch.create(clock_in: Time.new.strftime("%H%M"), date: "February", month_day: "Feb 1")
punchOut2 = Punch.create(clock_out: "2459", date: "February", month_day: "Feb 1")

donny.clients << james
donny.clients << jack

james.punches << punchIn
james.punches << punchOut
james.punches << punchIn2
james.punches << punchOut2