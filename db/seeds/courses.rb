if Course.count.zero?
  puts 'Seeding courses'
  Course.create!(name: 'First course', description: 'Это первый курс')
end