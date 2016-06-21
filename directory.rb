# store student names into an array
# students = [
#             {name: "Dr. Hannibal Lecter", cohort: :november},
#             {name: "Darth Vader", cohort: :november},
#             {name: "Nurse Ratched", cohort: :november},
#             {name: "Michael Corleone", cohort: :november},
#             {name: "Alex DeLarge", cohort: :november},
#             {name: "The Wicked Witch of the West", cohort: :november},
#             {name: "Terminator", cohort: :november},
#             {name: "Freddy Krueger", cohort: :november},
#             {name: "The Joker", cohort: :november},
#             {name: "Joffrey Baratheon", cohort: :november},
#             {name: "Norman Bates", cohort: :november},
#

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # creat an empty array
    students = []
    #get the first name
    name = gets.chomp
    # while name in not empty get students in
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        puts "Hit return twice if you don't want to add more"
        name = gets.chomp
        puts name
    end
    students
end

# then print them
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def prints(students)
  p students
  students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
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
