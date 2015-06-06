# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

puts "Creating aaron@lesson.ly admin..."
User.create! \
  name: "Aaron Milam",
  email: "aaron@lesson.ly",
  password: "asdfasdf",
  admin: true

puts "Creating steve@lesson.ly admin..."
User.create! \
  name: "Steve Grossi",
  email: "steve@lesson.ly",
  password: "asdfasdf",
  admin: true

puts "Creating austin@lesson.ly admin..."
User.create! \
  name: "Austin Horning",
  email: "austin@lesson.ly",
  password: "asdfasdf",
  admin: true

puts "Creating students..."
100.times do
  Student.create! \
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: rand(1000..9000).days.ago,
    ips_id: (0...10).map { ('0'..'9').to_a[rand(10)] }.join,
    address: Faker::Address.street_address,
    grade: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 'K', 'P'][rand(14)],
    school: Faker::Company.name
end

puts "Creating users..."
50.times do
  User.create! \
    email: Faker::Internet.email,
    password: "asdfasdf",
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    admin: false
end

puts "Creating admins..."
5.times do
  User.create! \
    email: Faker::Internet.email,
    password: "asdfasdf",
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    admin: true
end

puts "Giving each student a parent..."
Student.all.each do |student|
  rand(2).times do
    student.users << User.not_admins.offset(rand(User.not_admins.count)).first
  end
end

puts "Creating issues..."
Student.all.each do |student|
  rand(5).times do
    Issue.create \
      owner_admin_id: User.admins.offset(rand(User.admins.count)).first.id,
      description: Faker::Lorem.sentence,
      status: rand(2),
      subject: student
  end
end

puts "Creating events..."
Issue.all.each do |issue|
  (rand(5)+1).times do
    Event.create \
      issue: issue,
      method: ['phone', 'email', 'in person'][rand(3)],
      user: issue.subject.users.offset(rand(issue.subject.users.count)).first,
      admin: User.admins.offset(rand(User.admins.count)).first,
      description: Faker::Lorem.sentence,
      happened_at: rand(100).days.ago - rand(23*60).minutes
  end
end

Event.where(user: nil).each do |event|
  event.update!(user: User.not_admins.offset(rand(User.not_admins.count)).first)
end

puts "Creating applications..."
Student.all.each do |student|
  rand(3).times do
    student.applications.create \
      wl_building: Faker::Lorem.word,
      wl_program: Faker::Lorem.word,
      status: rand(3),
      priority: [2,3,4,9][rand(4)],
      random: rand(10000),
      current_building: Faker::Lorem.word,
      current_program: Faker::Lorem.word,
      current_status: rand(3),
      select_number: rand(2)
  end
end