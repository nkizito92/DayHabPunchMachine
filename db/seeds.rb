# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
donny = Driver.create(first_name: "Donny", last_name: "Don")
james = Client.create(full_name: "James Don", pay_rate: 50.0)
punchIn = Punch.create(client_id: 1, clock_in: Time.now)

donny.clients << james

james.punches << punchIn