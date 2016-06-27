
# array students will hold all student records and will be available globaly
@students = []

# set default values for details in student records
def default_name(default="Jane Doe")
    default
end

def default_cohort(default="July")
  default
end

def default_country(default="UK")
  default
end
#format the months representing each cohort so records could be grouped
# by cohort (i.e. months ordered calendaristically not alphabetically)
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

def build_student_record(name, cohort, country)
    @students << {name: name, cohort: cohort, country: country}
end

def input_students
  cohorts = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"]

  puts "Please enter the name of the student:"
  name = STDIN.gets.chomp
  # or   name = STDIN.gets.gsub("\n","")
  if name == ""
      name = default_name
  end

  puts "Please enter the cohort for the student:"
  cohort = STDIN.gets.chomp
  # or   cohort = STDIN.gets.gsub("\n","")
  # validate input for chorts for typos
  loop do
    if cohorts.include?(cohort)
      cohort = format_cohort(cohort)
      break
    else
      puts "The cohort you typed does not exist. Please retype (should be the name of a month - e.g. 'July')"
      cohort = STDIN.gets.chomp
      # or   cohort = STDIN.gets.gsub("\n","")
    end
  end

  puts "Please enter the country of origin for the student:"
  country = STDIN.gets.chomp
  # or   country = STDIN.gets.gsub("\n","")
  if country == ""
      country = default_country
  end
  puts "New record has been created for student #{name}"
  # while name in not empty get students in
  while !name.empty? do

    build_student_record(name, cohort, country)

    puts "Now we have #{@students.count} student#{ 's' if @students.length > 1}"
    puts "Would you like to add more students? Y/N"
    more = STDIN.gets.chomp.upcase
    # or   more = STDIN.gets.gsub("\n","").upcase
    break if more == "N"

    puts "Name?"
    name = STDIN.gets.chomp
    # or   name = STDIN.gets.gsub("\n","")
    if name == ""
        name = default_name
    end
    puts "Cohort?"
    cohort = STDIN.gets.chomp
    # or   cohort = STDIN.gets.gsub("\n","")
    # validate input for chorts for typos
    loop do
      if cohorts.include?(cohort)
        cohort = format_cohort(cohort)
        break
      else
        puts "The cohort you typed does not exist. Please retype (should be the name of a month - e.g. 'July')"
        cohort = STDIN.gets.chomp
        # or   cohort = STDIN.gets.gsub("\n","")
      end
    end

    puts "Country?"
    country = STDIN.gets.chomp
    # or   country = STDIN.gets.gsub("\n","")
    if country == ""
        country = default_country
    end
    puts "New record has been created for student #{name}"
  end
end

# then print them
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def prints_students_list
  #  sort students by cohort
  @students.sort_by! do |student|
    student[:cohort]
  end

  count = 0
  student_record = []
  while count < @students.length
    if @students[count][:name].length < 12
      record_name = "| #{count+1}. #{@students[count][:name]}"
      record_cohort = "| cohort: #{@students[count][:cohort]}"
      record_country = "| country: #{@students[count][:country]}"
      print record_name.ljust(30)
      print record_cohort.ljust(25)
      puts record_country
    end
    count += 1
  end
end

def print_footer
  if @students.length == 0
      puts "Overall, we have no great students yet"
      exit
  else
    puts "Overall, we have #{@students.count} great student#{ 's' if @students.length > 1}"
  end
end

def save_students_to_file(filename = "students.csv")
  # open the file for writing
  File.open(filename, "w") do |file|
    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:country]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Student records successfuly saved to file #{filename}"
end

def load_students_from_file(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort, country = line.chomp.split(',')
      build_student_record(name, cohort, country)
    end
  end
  puts "List of student records successfuly retrieved from file #{filename}"
end

def try_load_students_from_CL(filename = "students.csv")
  # if user inputs file name at CL use that file, otherwise use default file
  if ARGV.first.nil?
    filename
  else
    filename = ARGV.first
  end

  if File.exists?(filename) # if it exists
    load_students_from_file(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save student records to file students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process_menu_choice(selection)
  case selection
  when "1"
    # input the students
    input_students
  when "2"
    # show the students
    print_header
    prints_students_list
    print_footer
  when "3"
    # type and pass file name as argument or default file will be used for load
    print "save_students_to_file "
    save_students_to_file(gets.chomp)
  when "4"
    # type and pass file name as argument or default file will be used for load
    print "load_students_from_file "
    load_students_from_file(gets.chomp)
  when "9"
    puts "Good bye!"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    selection = STDIN.gets.chomp
    # 3. do what the user has asked
    process_menu_choice(selection)
  end
end

try_load_students_from_CL
interactive_menu
