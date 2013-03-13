#### WILL Metadata MOVER ######
# Written by Gary R. Maixner III

# Code written to compare an arbitrarilly assigned ID to an entity's name
# then move the metadata to the entity.

# Note from: 3:22 PM Wednesday, March 06, 2013
# This code will change radically very shortly, it was originally written simply to match by name
# and not by ID. This will be changed shortly.

require 'pathname'
require 'FileUtils'

startDir = 'Z:\packageTestArea\output_G-unit'
endDir = 'Z:\packageTestArea\1306005'

mdFiles = Dir.entries(startDir)
destDirs = Dir.entries(endDir)

for item in mdFiles
	if item == "." or item == ".."
	else
		destName = item.gsub("mods-","")
		destName.gsub!(".xml","")
		destName = destName[0..2] + "_" + destName[3..-1]
		if destName[0..3].include?("_") == true
			destName = "0" + destName
		end

		oriDir = startDir + '/' + item
		dest = endDir + '/' + destName
		if File.directory?(dest) == false
			FileUtils.mkdir_p(dest)
			puts dest
		end
		FileUtils.cp(oriDir, dest)
		puts oriDir
		puts dest

	end
end
	