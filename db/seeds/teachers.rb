if Teacher.count.zero?
    puts 'Seeding Teachers'
    Teacher.create!(first_name: 'Galina', last_name: 'Kriageva', description: 'Main Teacher')
    Teacher.create!(first_name: 'John', last_name: 'Dow', description: 'Second Teacher')
    Teacher.create!(first_name: 'Jane', last_name: 'Dow', description: 'Third Teacher')
end