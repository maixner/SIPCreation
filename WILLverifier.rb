#### WILL Verifier ####
# Version 1.01
# Written by Gary R. Maixner III
# Last modified: 4:21 PM Wednesday, March 06, 2013

# Changes in this version
#  - Refactored the code to make it easier to augment later by creating the comparer function


# This software take in two different folders and compares the contents on both. 
# If the software does not detect a 44KhZ for every 96KhZ file then it will alert the user.
# Direct the software to the proper directory by changing the string in declareDir, in the RUN CODE Section

require 'pathname'
require 'FileUtils'

# DECLARING FUNCTIONS

def comparer (files1, files2)
for file96 in files1 do
				found = false
				if file96.include?(".sfk") == true or file96 == "44" or file96 == "." or file96 == ".."
				else	
					for file44 in files2 do
						file44.gsub!("-44", "")
						file44.gsub!("_44","")
						file96.gsub!("_96","")
						if file44 == file96
							found = true
						else
								
						end
					end
					if found == false
						puts file96
						puts "Is not available in 44" 
					end
				end
		end		

end

# END DECLARING FUNCTIONS

# RUN CODE
puts("Type the full apth to the directory that you want analyzed"
declareDir = gets
declareDir = declareDir.chomp
newFold = Pathname.new(declareDir).children.select { |c| c.directory? }
files1 = Dir
files2 = Dir

# The software accounts for three different scenarios
# 1. the files are located in two sub-directories
# 2. One set of files is in a subdirectory and the other set on the top level
# 3. Both sets of files are on the top level

# This block is for when both sets are in subdirectories.
	if newFold.count() > 1
		for i in newFold do	
			if i.basename.to_s.include?("96") == true
				files1 = Dir.entries(i)
			else 
				files2 = Dir.entries(i)
			end
		end

		comparer(files1, files2)
		
				
 # This block is accessed when both sets are on the top level of the directory
	
	elsif newFold.count() == 0
		files1 = []
		files2 = []
		sepFiles = Dir.entries(declareDir)
		for item in sepFiles
			if item.include?("44") == true
				files2.push(item)
			else 
				files1.push(item)
			end
		end
		comparer(files1, files2)
# This block is accessed when the 44 KhZ files are in a subdirectory.
	else 
	files1 = Dir.entries(declareDir)
	files2 = Dir.entries(newFold[0])
			
		for file96 in files1 do
				found = false
				if file96.include?(".sfk") == true or file96 == "44" or file96 == "." or file96 == ".."

				else	
					comparer(files1, files2)

	end
# END RUN CODE
