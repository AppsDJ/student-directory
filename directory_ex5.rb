# store student names into an array
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # creat an empty array
    students = []
    #get the first name
    name = gets.chomp
    # while name in not empty get students in
    while !name.empty? do
        students << {name: name, cohort: :november, hobby: :ruby, country: :uk}
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

def print(students)
  # students.each_with_index do |student, index|
  #   if student[:name].length < 12
  #     puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  #   end
  # end
  count = 0
  while count < students.length
    if students[count][:name].length < 12
      puts "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort)" +
            " from #{students[count][:country]}, having a #{students[count][:hobby]} hobby"
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
print(students)
print_footer(students)
