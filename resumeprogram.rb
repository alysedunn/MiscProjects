#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'

$MyResume = ARGV[0]

class Resume 

@@PM_Resume = "Project Management Resume"
@@Dev_Resume = "Development Resume"

	def Print_instructions 
		puts
		puts "Please enter the number associated with the resume you would like to see. Optons:"
		puts "1." + " " + @@PM_Resume
		puts "2." + " " + @@Dev_Resume
	end

	def Update_user_input_1
		@user_input_1 = STDIN.gets.chomp
	end

	def Input_1_validation_loop
		if @user_input_1 == "1" 
			PM_resume()
		elsif @user_input_1 == "2"
			Dev_resume()
		else
			puts "You entered an invalid value."
		end
	end

	def PM_resume
		puts "You selected the"+" "+ @@PM_Resume
		json1 = File.read($MyResume)
		obj = JSON.parse(json1)

		obj.each do |key, value|
			value.each do |subkey_key, subkey_value|
				if subkey_key.include?('PM')
					puts subkey_value
				end
			end
		end
	end

	def Dev_resume
		puts "You selected the"+" "+ @@Dev_Resume
		json1 = File.read($MyResume)
		obj = JSON.parse(json1)

		obj.each do |key, value|
			value.each do |subkey_key, subkey_value|
				if subkey_key.include?('Dev')
					puts subkey_value
	    		end
	    	end
		end
	end

	def Print_printing_instructions
		puts
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
		elsif @user_input_2 == "no"
			puts "Exiting program"
		else
			puts "You entered an invalid value."
			@user_input_2 = nil
			Print_printing_instructions()
			Update_user_input_2()
			Input_2_validation_loop()
		end
	end

	def Create_file

end

Resume_Instance = Resume.new

# while true
	Resume_Instance.Print_instructions()
	Resume_Instance.Update_user_input_1()
	Resume_Instance.Input_1_validation_loop()
	Resume_Instance.Print_printing_instructions()
	Resume_Instance.Update_user_input_2()
	Resume_Instance.Input_2_validation_loop()
	Resume_Instance.Create_file()

# end