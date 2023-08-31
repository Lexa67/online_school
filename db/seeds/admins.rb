if AdminA.count.zero?
  puts 'Seeding Admins'
  AdminA.create!(email: 'john@dow.com', first_name: 'John', last_name: 'Dow', password: 'password', password_confirmation: 'password')
end