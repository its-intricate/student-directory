@students = [] # an empty array accessible to all methods

# define method for inputting students
def input_students
  puts "Please enter the names of the students."
  puts "To finish, press Return twice."
  name = gets.chomp
  while !name.empty? do # continue to collect names until return is hit twice
    @students << {name: name, cohort: :november} # add input to student array
    puts "There are now #{@students.count} students." # display number of students so far
    name = gets.chomp # ask for another name
  end
end

# define print methods
def print_header
  puts "The students of the Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |person|
    puts "#{person[:name]} (#{person[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "Menu. Choose a number" # display menu options
  puts "1. Input students"
  puts "2. Display students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  # call methods to print the list of students
  print_header
  print_student_list
  print_footer
end

# define selection process method
def process(selection)
  case selection # execute methods based on user input
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_data
  when "9"
    exit # terminate program
  else
    puts "Sorry I didn't understand that. Please try again."
  end
end

# define interactive menu method
def interactive_menu
  loop do
    print_menu
    process(gets.chomp) # get user input
  end
end

# define a method which saves our data into an external file
def save_data
  file = File.open("students.csv", "w") # open the file where the data will be exported to
  # iterate over array of students to put data as string in file
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(", ")
    file.puts csv_line
  end
  file.close
end

# start the program
interactive_menu
