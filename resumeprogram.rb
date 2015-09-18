# The first two gems below, 'rubygems' and 'json', are required in order 
# to parse the content in the BulkResume.json file. The third gem, 'pp',
# is not actually required in order to run this program, but it does help 
# ensure that all of the content prints nicely.
require 'rubygems'
require 'json'
require 'pp'


# Takes the JSON file that you referenced when you started the program 
# and assigns that file to a global variable called "MyResume" that is 
# later referenced at various points in the program 
$MyResume = ARGV[0]


# Creates a class called "Resume" that holds the various methods of 
# the program
class Resume 


# Creates a class variable called "Resume_Hash" that contains a hash.
# That has contains two keys; one for each of the two resumes that the
# user can select and then view/print. 
@@Resume_Hash = {"PM"=> {"Print_Option"=> "Project Management Resume", "File_Name"=> "Alyse Dunn_ProjectManager.txt"},
				"Dev"=> {"Print_Option"=> "Development Resume", "File_Name"=> "Alyse Dunn_Developer.txt"}
				}

# Method just for printing instructions to the screen for the user. Note
# that if you have different keys, you'll want to reference those keys
# instead of mine in line 35.
	def Print_instructions 
		puts
		puts "Welcome to the Resume Builder Program!"
		puts "Please enter 'Dev' if you would like to see the Development resume," 
		puts "or 'PM' if you would like to see the PM resume:"
	end


# Method to take the user's input and assign it to a class variable
# called @user_input_1
	def Update_user_input_1
		@user_input_1 = STDIN.gets.chomp
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
		end
	end

	def Resume
		puts
		puts "You selected the"+" "+ @user_input_1 + "resume"
		json1 = File.read($MyResume)
		obj = JSON.parse(json1)
		@Resume_Just_Created = ""
		obj.each do |key, value|
			value.each do |subkey_key, subkey_value|
				if subkey_key.include?(@user_input_1)
					puts subkey_value
					@Resume_Just_Created += subkey_value + "\n"
				end
			end
		end
	end

	def Print_printing_instructions
		print "Would you like to create a file with the" 
		print "resume that you selected? Enter 'yes' or 'no'." 
		print "Entering 'no' will exit the program."
	end

	def Update_user_input_2
		@user_input_2 = STDIN.gets.chomp.downcase
	end

	def Input_2_validation_loop
		if @user_input_2 == "yes" 
			puts "yes"
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

	def Create_file
		File.new @@Resume_Hash[@user_input_1]["File_Name"],"w"
		File.open(@@Resume_Hash[@user_input_1]["File_Name"], "w") { |file| file.write(@Resume_Just_Created) }
		puts @@Resume_Hash[@user_input_1]["Print_Option"] + "just created"
	end

end

Resume_Instance = Resume.new

# while true
	Resume_Instance.Print_instructions()
	Resume_Instance.Update_user_input_1()
	Resume_Instance.Input_1_validation_loop()
	Resume_Instance.Print_printing_instructions()
	Resume_Instance.Update_user_input_2()
	Resume_Instance.Input_2_validation_loop()

# end