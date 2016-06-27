#  1. TIDY UP: get rid of all large comments previously used for alternative solutions
# 2. Group output of students by cohort

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

def format_cohort(cohort)
  case cohort
  when "January"
    cohort = "(1) January"
  when "February"
    cohort = "(2) February"
  when "March"
    cohort = "(3) March"
  when "April"
    cohort = "(4) April"
  when "May"
    cohort = "(5) May"
  when "June"
    cohort = "(6) June"
  when "July"
    cohort = "(7) July"
  when "August"
    cohort = "(8) August"
  when "September"
    cohort = "(9) September"
  when "October"
    cohort = "(10) October"
  when "November"
    cohort = "(11) November"
  when "December"
    cohort = "(12) December"
  end
  return cohort
end

def input_students
  students = []
  cohorts = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

  puts "Please enter the name of the student:"
  name = gets.chomp
  if name == ""
      name = default_name
  end

  puts "Please enter the cohort for the student:"
  cohort = gets.chomp
  # validate input for chorts for typos
  loop do
    if cohorts.include?(cohort)
      cohort = format_cohort(cohort)
      break
    else
      puts "The cohort you typed does not exist. Please retype (should be the name of a month - e.g. 'July')"
      cohort = gets.chomp
    end
  end

  puts "Please enter the country of origin for the student:"
  country = gets.chomp
  if country == ""
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
      name = gets.chomp
      if name == ""
          name = default_name
      end
      puts "Cohort?"
      cohort = gets.chomp
      # validate input for chorts for typos
      loop do
        if cohorts.include?(cohort)
          cohort = format_cohort(cohort)
          break
        else
          puts "The cohort you typed does not exist. Please retype (should be the name of a month - e.g. 'July')"
          cohort = gets.chomp
        end
      end

      puts "Country?"
      country = gets.chomp
      if country == ""
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
  #  sort students by cohort
  students.sort_by! do |student|
    student[:cohort]
  end

  count = 0
  student_record = []
  while count < students.length
    if students[count][:name].length < 12
      record_name = "| #{count+1}. #{students[count][:name]}"
      record_cohort = "| cohort: #{students[count][:cohort]}"
      record_country = "| country: #{students[count][:country]}"
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
