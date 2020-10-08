# define method for inputting students
def input_students
  students = [] # create an empty array for student data hashes to be inputted to
  puts "Please enter the names of the students."
  puts "To finish, press Return twice."
  name = gets.chomp
  while !name.empty? do # continue to collect names until return is hit twice
    students << {name: name, cohort: :november} # add input to student array
    puts "There are now #{students.count} students." # display number of students so far
    name = gets.chomp # ask for another name
  end
  students
end

# define print methods
def print_header
  puts "The students of the Academy"
  puts "-------------"
end

def print(people)
  people.each do |person|
    puts "#{person[:name]} (#{person[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# define interactive menu method
def interactive_menu
  students = [] # create an empty array for student data hashes to be inputted to
  loop do
    puts "Menu. Choose a number" # display menu options
    puts "1. Input students"
    puts "2. Display students"
    puts "9. Exit"
    selection = gets.chomp # get user input
    case selection # execute methods based on user input
    when "1"
      # define students as the result of our called input method
      students = input_students
    when "2"
      # call methods to print the list of students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # terminate program
    else
      puts "Sorry I didn't understand that. Please try again."
    end
  end
end

# start the program
interactive_menu
