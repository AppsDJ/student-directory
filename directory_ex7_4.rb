#  STRING FROM INPUT TO SYMBOL


# store student names into an array
def default_name(default="Jane Doe")
    default
end

def default_cohort(default="July")
  default
end

def default_country(default="UK")
  default
end

def input_students
  students = []
  puts "Please enter the name of the student:"
  name = gets.chomp.to_sym
  if name == "".to_sym
      name = default_name
  end
  puts "Please enter the cohort for the student:"
  cohort = gets.chomp.to_sym
  if cohort == "".to_sym
      cohort = default_cohort
  end
  puts "Please enter the country of origin for the student:"
  country = gets.chomp.to_sym
  if country == "".to_sym
      country = default_country
  end

  # while name in not empty get students in
  while !name.empty? do
      students << {name: name, cohort: cohort, country: country}
      puts "Now we have #{students.count} students"
      puts "Would you like to add more students? Y/N"
      more = gets.chomp.upcase
      break if more == "N"

      puts "Name?"
      name = gets.chomp.to_sym
      if name == "".to_sym
          name = default_name
      end
      puts "Cohort?"
      cohort = gets.chomp.to_sym
      if cohort == "".to_sym
          cohort = default_cohort
      end
      puts "Country?"
      country = gets.chomp.to_sym
      if country == "".to_sym
          country = default_country
      end
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
