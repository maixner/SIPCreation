# WILL MP3 Generator
# Version 1.0
# Written by Gary Richard Maixner III
# Last modified: 4:26 PM Wednesday, March 06, 2013

# This software runs through an Audio SIP and derives an MP3 access file from a 44 kHz WAV file.
# Requires the ffmpeg software to run.

require 'pathname'
require 'FileUtils'

# This is where you point FFmpeg
ffmpeg_loc = 'C:\Users\maixner2\Documents\GitHub\SIPCreation\ffmpeg\bin\ffmpeg.exe'

puts "Type the full path to the directory where the packages are located"
declareDir = gets
declareDir = declareDir.chomp

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

					sendOut = ffmpeg_loc+ ' -i ' + convItem + " " + toMP3
					system sendOut
				end	
		end
	end
end
	
