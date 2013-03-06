# WILL MP3 Generator
# Written by Gary Richard Maixner III
#

require 'pathname'
require 'FileUtils'

declareDir = 'Z:\packageTestArea\G-test'

allDir = Dir.entries(declareDir)

for folder in allDir
	newlocation = declareDir + "\\" + folder.to_s
	if folder == "." or folder == ".." or folder == ".DS_Store"
	else
		lowDir = Dir.entries(newlocation)
		print folder
		for item in lowDir
			
				if item.to_s.include?("44")
					convItem = newlocation + "\\" +  item
					toMP3 = convItem.gsub(".wav", ".mp3")
					sendOut = 'C:\Users\maixner2\Documents\GitHub\SIPCreation\ffmpeg\bin\ffmpeg.exe -i ' + convItem + " " + toMP3
					system sendOut
				end	
		end
	end
end
	