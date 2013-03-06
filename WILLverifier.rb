require 'pathname'
require 'FileUtils'

declareDir = 'Z:\packageTestArea\WILL_UIUC_Transfers'
newFold = Pathname.new(declareDir).children.select { |c| c.directory? }
files1 = Dir
files2 = Dir

# This block determines whether they match up when both are in seperate files

	if newFold.count() > 1
		for i in newFold do	
			if i.basename.to_s.include?("96") == true
				files1 = Dir.entries(i)
			else 
				files2 = Dir.entries(i)
			end
		end


		for file96 in files1 do
				found = false
				if file96.include?(".sfk") == true
				else	
					for file44 in files2 do
						file44.gsub!("-44", "")
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

		for file96 in files1 do
				if file96.include?(".sfk") == true or file96 == "." or file96 == ".."
				else	
						found = false
					for file44 in files2 do
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

	else 
	files1 = Dir.entries(declareDir)
	files2 = Dir.entries(newFold[0])
			
		for file96 in files1 do
				found = false
				if file96.include?(".sfk") == true or file96 == "44" or file96 == "." or file96 == ".."

				else	
					for file44 in files2 do
						file44.gsub!("-44","")
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
	
	




