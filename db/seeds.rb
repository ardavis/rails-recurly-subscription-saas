puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ name: role }, without_protection: true)
  puts 'role: ' << role
end

puts 'DEFAULT USERS'
user = User.find_or_create_by_email(first_name: ENV['ADMIN_FIRST_NAME'].dup, last_name: ENV['ADMIN_LAST_NAME'].dup, email: ENV['ADMIN_EMAIL'].dup, password: ENV['ADMIN_PASSWORD'].dup, password_confirmation: ENV['ADMIN_PASSWORD'].dup)
puts 'user: ' << user.name
user.add_role :admin
user2 = User.find_or_create_by_email(first_name: 'Silver', last_name: 'User', email: 'user2@example.com', password: 'please', password_confirmation: 'please')
user2.add_role :silver
user3 = User.find_or_create_by_email(first_name: 'Gold', last_name: 'User', email: 'user3@example.com', password: 'please', password_confirmation: 'please')
user3.add_role :gold
user4 = User.find_or_create_by_email(first_name: 'Platinum', last_name: 'User', email: 'user4@example.com', password: 'please', password_confirmation: 'please')
user4.add_role :platinum
puts "users: #{user2.name}, #{user3.name}, #{user4.name}"