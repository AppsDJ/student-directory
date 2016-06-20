student_count = 11
# store student names into an array
students = ["Dr. Hannibal Lecter",
            "Darth Vader",
            "Nurse Ratched",
            "Michael Corleone",
            "Alex DeLarge",
            "The Wicked Witch of the West",
            "Terminator",
            "Freddy Krueger",
            "The Joker",
            "Joffrey Baratheon",
            "Norman Bates"]

# then print them
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each do |name|
      puts name
  end
end

def print_footer(students)
  # use the array method 'count'
  puts "Overall, we have #{students.count} great students"
end

print_header
print(students)
print_footer
