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
	