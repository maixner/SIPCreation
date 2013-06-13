require 'pathname'
require 'FileUtils'

# This function is abstracted enough that  

def Repack(files1, files2, locale96, locale44,newLocation)
		puts files2
		for file96 in files1 do
				if file96.include?(".sfk") == true
				else	
					for file44 in files2 do
						compare44 = file44.gsub("-44","")
						compare44 = compare44.gsub("_44","")
						compare44 = compare44.gsub("KHz","")
						compare96 = file96.gsub("-96","")
						compare96 = compare96.gsub("_96","")
						compare96 = compare96.gsub("KHz","")
						
						if compare44 == compare96
							dest = newLocation
							
							if file96.include?("kHz") == true
								dest = dest + file96[22..27]
							
							elsif file96 == "." or file96 ==".." or file96 == ""
								break

							
							elsif file96[27] == "A" or file96[27] == "B"
								dest = dest + file96[22..-5]
								dest.gsub!("_cut_","")	
							else
								dest = dest + file96[22..-5]
							end
							
						
							if File.directory?(dest) == false
								FileUtils.mkdir_p(dest)
							end
							file96 = '/' + file96
							file44 = '/' + file44
							mvFile96 = locale96.to_s + file96
							mvFile44 = locale44.to_s + file44
							FileUtils.cp(mvFile96, dest)
							FileUtils.cp(mvFile44,dest)
							if file96.include?("kHz") == true
								rn96ori = dest + file96
								rn96new = dest + file96[0..31] + file96[-4..-1]
							else
								rn96ori = dest + file96
								rn96new = dest + file96[0..-5] + "_96" + file96[-4..-1]
							end
							if file44.include?("kHz") == true
								rn44ori = dest + file44
								rn44new = dest + file44[0..31] + file44[-4..-1]
							else
								rn44ori = dest + file44
								rn44new = dest + file44.gsub("-","_")
							end
							File.rename(rn96ori, rn96new) 
							File.rename(rn44ori, rn44new) 

						end
					end	 
				end						
		end
end 
puts "Type the full path to the directory that you want to package"
declareDir = gets
declareDir = declareDir.chomp

puts "Type the full path to the directory where you would like the packages to be placed"
newLocation = gets
newLocation = newLocation.chomp


newFold = Pathname.new(declareDir).children.select { |c| c.directory? }
files1 = []
files2 = []
locale96 = ''
locale44 = ''


# This block is accessed if the files are seperated into two seperate subdirectories.

	if newFold.count() == 2
		for i in newFold do	
			if i.basename.to_s.include?("96") == true
				files1 = Dir.entries(i)
				locale96 = i 
				print locale96
			else 
				files2 = Dir.entries(i)
				locale44 = i  
				print locale44
			end
		end
		Repack(files1,files2, locale96, locale44, newLocation)

# This block is accessed if only the 44 files are located in a subdirectory


	elsif newFold.count() == 1 
		files1 = Dir.entries(declareDir)
		files2 = Dir.entries(newFold[0])
		locale96 = declareDir
		locale44 = newFold[0]
		Repack(files1, files2, locale96, locale44, newLocation)

# This block is accessed in the event that both the 96 and 44 files are in the same directory

	elsif newFold.count() == 0
		sepFiles = Dir.entries(declareDir)
		for item in sepFiles
			if item.include?("44") == true
				files2.push(item)
			else 
				files1.push(item)
			end
		end
		locale96 = declareDir
		locale44 = declareDir
		
		Repack(files1, files2, locale96, locale44, newLocation)

	else
		puts("I don't know why or even how this happened, sorry.")
end 



	




