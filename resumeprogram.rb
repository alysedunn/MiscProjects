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

	def Update_user_input
		@user_input = STDIN.gets.chomp
	end

	def Validation_loop
		if @user_input == "1" 
			PM_resume()
		elsif @user_input == "2"
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

end

Resume_Instance = Resume.new

# while true
	Resume_Instance.Print_instructions()
	Resume_Instance.Update_user_input()
	Resume_Instance.Validation_loop()

# end