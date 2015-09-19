# The first two gems below, 'rubygems' and 'json', are required in order 
# to parse the content in the BulkResume.json file. The third gem, 'prawn',
# is required in order to create PDF file types. The forth gem, 'pp',
# is not actually required in order to run this program, but it does help 
# ensure that all of the content prints nicely. 
require 'rubygems'
require 'json'
require 'prawn'
require 'pp'


# Takes the JSON file that you referenced when you ran the program 
# and assigns that file to a global variable called "MyResume" that is 
# later referenced at various points in the program.
$MyResume = ARGV[0]


# Creates a class called "Resume" that holds the various methods of 
# the program.
class Resume 


# Creates a class variable called "Resume_Hash" that contains a hash.
# That has contains two keys; one for each of the two resumes that the
# user can select and then view/print as default. You can change the names  
# of the primary keys (i.e. 'PM and 'Dev'), the secondary keys (i.e. 'Print
# Option' or 'File_Name', or secondary key values (i.e. 'Project Management
# Resume' or 'Alyse Dunn_ProjectManager.pdf') to your own values.
@@Resume_Hash = {"PM"=> {"Print_Option"=> "Project Management Resume", "File_Name"=> "Alyse Dunn_ProjectManager.pdf"},
				"Dev"=> {"Print_Option"=> "Development Resume", "File_Name"=> "Alyse Dunn_Developer.pdf"}
				}

# Method just for printing instructions to the screen for the user. Note
# that if you have different keys, you'll want to reference those keys
# instead of mine in lines 34 and 35.
	def Print_instructions 
		puts
		puts "Please enter 'Dev' if you would like to see the Development resume," 
		puts "or 'PM' if you would like to see the PM resume:"
		Update_user_input_1()
	end

# Method to take the user's input and assign it to a class variable
# called @user_input_1
	def Update_user_input_1
		@user_input_1 = STDIN.gets.chomp
		Input_1_validation_loop()
	end

# Method to evaluate whether or not the user's input matches
# the key from the Resume_Hash. If so, the program runs the
# 'Resume' method. If not, the user is prompted to enter a 
# valid value.
	def Input_1_validation_loop
		if @@Resume_Hash.has_key?(@user_input_1) 
			Resume()
		else
			puts "You entered an invalid value."
			@user_input_1 = nil
			Print_instructions()
		end
	end

# Method to confirm the resume that the user selected, and create that 
# resume by parsing the appropriate content from the JSON file. Note 
# that you'll want to replace my name with yours in line 69 below.
	def Resume
		puts
		puts "You selected the"+" "+ @user_input_1 + "resume"
		json1 = File.read($MyResume)
		obj = JSON.parse(json1)
		@Resume_Just_Created = "ALYSE NICOLE DUNN\n\nPROFESSIONAL EXPERIENCE\n\n"
		obj.each do |key, value|
			value.each do |subkey_key, subkey_value|
				if subkey_key.include?(@user_input_1)
					puts subkey_value
					@Resume_Just_Created += subkey_value + "\n"
				end
			Print_printing_instructions()
			end
		end
	end

# Method to ask the user whether or not he/she would like to print the resume
	def Print_printing_instructions
		puts 
		puts "Would you like to create a file with the" 
		puts "resume that you selected? Enter 'yes' or 'no'." 
		puts "Entering 'no' will exit the program."
	end

# Method to normalize the second user input (the input that the user
# enters to indicate whether or not he/she should like to print
# the resume.
	def Update_user_input_2
		@user_input_2 = STDIN.gets.chomp.downcase
	end

# Method to create the PDF file for the selected resume if the user
# entered 'yes', quit the program if the user entered 'no', or
# prompt the user to input a valid value if the user entered an
# invalid value.
	def Input_2_validation_loop
		if @user_input_2 == "yes" 
			Create_file()
		elsif @user_input_2 == "no"
			puts "Exiting Program"
		else
			puts "You entered an invalid value."
			@user_input_2 = nil
			Print_printing_instructions()
			Update_user_input_2()
			Input_2_validation_loop()
		end
	end

# Method to create the PDF file of the selected resume and prints a 
# confirmation message to the screen
	def Create_file
		Prawn::Document.generate(@@Resume_Hash[@user_input_1]["File_Name"]) do |pdf|
  		pdf.text @Resume_Just_Created
  		# puts @@Resume_Hash[@user_input_1]["Print_Option"] + "just created"
  		end
	end
end

# Instantiates the resume class
Resume_Instance = Resume.new

# Calls the various methods in the resume class
	Resume_Instance.Print_instructions()
	Resume_Instance.Update_user_input_2()
	Resume_Instance.Input_2_validation_loop()
