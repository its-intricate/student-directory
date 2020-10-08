# define method for inputting students
def input_students
  students = [] # create an empty array for student data hashes to be inputted to
  puts "Please enter the names of the students."
  puts "To finish, press Return twice."
  name = gets.chomp
  while !name.empty? do # continue to collect names until return is hit twice
    puts "What is #{name}'s nationality?"
    nationality = gets.chomp
    until !nationality.empty? do
      puts "What is #{name}'s nationality?"
      nationality = gets.chomp
    end
    students << {name: name, cohort: :november, nationality: nationality, height: rand(1.0..2.0).round(2)} # add input to student array
    puts "There are now #{students.count} students." #display number of students so far
    name = gets.chomp # ask for another name
  end
  students
end

# define print methods
def print_header
  puts "The students of the Academy".center(100)
  puts "-------------".center(100)
end

def print(people)
  people.each do |person|
    puts "#{person[:name]}, Height: #{person[:height]}m, Nationality: #{person[:nationality]} (#{person[:cohort]} cohort)".center(100)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(100)
end

#define students as the result of our input method
students = input_students

# call methods to print the list of students
print_header
print(students)
print_footer(students)
