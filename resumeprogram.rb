#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'

$MyResume = ARGV[0]

class Resume 

@@PM_Resume = "Project Management Resume"
@@Dev_Resume = "Development Resume"
@@Exit_message = "Exiting Program"

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
		@PM_Resume_Just_Created = ""
		obj.each do |key, value|
			value.each do |pm_subkey_key, pm_subkey_value|
				if pm_subkey_key.include?('PM')
					puts pm_subkey_value
					@PM_Resume_Just_Created += pm_subkey_value + "\n"
				end
			end
		end
	end

	def Dev_resume
		puts "You selected the"+" "+ @@Dev_Resume
		json1 = File.read($MyResume)
		obj = JSON.parse(json1)
		@Dev_Resume_Just_Created = ""
		obj.each do |key, value|
			value.each do |dev_subkey_key, dev_subkey_value|
				if dev_subkey_key.include?('Dev')
					puts dev_subkey_value
					@Dev_Resume_Just_Created += dev_subkey_value + "\n"
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
			puts @@Exit_message
		else
			puts "You entered an invalid value."
			@user_input_2 = nil
			Print_printing_instructions()
			Update_user_input_2()
			Input_2_validation_loop()
		end
	end

	def Create_file
		if @user_input_1 == "1"
			File.new "Alyse Dunn_ProjectManager.txt","w"
			File.open("Alyse Dunn_ProjectManager.txt", 'w') { |file| file.write(@PM_Resume_Just_Created) }
			puts "PM Resume Created"
		else
			File.new "Alyse Dunn_Developer.txt","w"
			File.open("Alyse Dunn_Developer.txt", 'w') { |file| file.write("test") }
			puts "Dev Resume Created"

		end
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