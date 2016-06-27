# store student names into an array
def input_students
  students = []
  puts "Please enter the name of the student:"
  name = gets.chomp
  puts "Please enter the cohort for the student:"
  cohort = gets.chomp
  puts "Please enter the country of origin for the student:"
  country = gets.chomp

  # while name in not empty get students in
  while !name.empty? do
      students << {name: name, cohort: cohort, country: country}
      puts "Now we have #{students.count} students"
      puts "Hit return twice if you don't want to add more students, or else keep adding"
      puts "Name?"
      name = gets.chomp
      break if name == ""
      puts "Cohort?"
      cohort = gets.chomp
      puts "Country?"
      country = gets.chomp
  end
  students
end

# then print them
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def prints(students)
  # LOOP USING each_with_index METHOD:
  #####
  # students.each_with_index do |student, index|
  #   if student[:name].length < 12
  #     puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  #   end
  # end
  #####
  #
  # OR
  # LOOP USING while CONSTRUCT:
  #####
  count = 0
  while count < students.length
    record = ""
    if students[count][:name].length < 12
      record_name = "| #{count+1}. #{students[count][:name]}"
      record_cohort = "| cohort: #{students[count][:cohort]}"
      record_country = "| country: #{students[count][:country]}"
      record_hobby = "| hobby: #{students[count][:hobby]}"
      print record_name.ljust(30)
      print record_cohort.ljust(25)
      puts record_country
    end
    count += 1
  end
end

def print_footer(students)
  # use the array method 'count'
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
prints(students)
print_footer(students)
