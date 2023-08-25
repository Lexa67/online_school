if Discipline.count.zero?
  puts 'Seeding Disciolines'

  %w(Графика Скетчинг).each do |name|
    Discipline.create!(name: name)
  end
end