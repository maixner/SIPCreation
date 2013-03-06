# TDV Manip#
# Written by Grey Maixner
# Last Modified on Tuesday, February 5, 2013 at 6:59:40 PM CST

# This software was written to process a Tab Delimited Value metadata file.
# The file was very specific, so the code may not have any application elsewhere.
# If you do find a use please let me know at grey.maixner@gmail.com

text = File.open("C:\\Users\\maixner2\\Desktop\\willDiscIngest_prac.txt", "r")
newText = File.new("C:\\Users\\maixner2\\Desktop\\willDiscNameDateProgram.txt", "w")

def Manipulation(anArray, writeString, newText, nextArray)
	count = 0
	for item in anArray
		if count == 12
			writeString = writeString +item
			count = 0
=begin
		elsif count == 4
			if item.empty? == false
				if item.include?("speaker") == true
					writeString = writeString + item +"\t"
					count = count + 1
				else
					item = item.gsub(";", " (speaker);")
						
					if item[-2] == " "
						item = item + "(speaker)"
					else
						item = item + " (speaker)"
					end
					writeString = writeString + item +"\t"
					count = count + 1
				end
			else
				writeString = writeString + item +"\t"
				count = count + 1
			end
=end

		elsif count == 0
			if item.empty? == false
				writeString = writeString + item + "\t"
				count = count + 1
=begin
			else
				writeString = writeString + $newid.to_s + "\t"
				$newid = $newid + 1
			count = count + 1	
=end
			else
				exist = false
				name1 = anArray[1].sub(" part", "")
				name1 = name1.sub(" 1", "")
				name1 = name1.sub(" 2", "")
				cDate = anArray[3] 
				program = anArray[10]
					for anItem in nextArray
						if anItem[1] == name1 and anItem[2] == cDate and anItem[3] == program
							oldId = anItem[0]
							exist = true
						end
					end
					if exist == true
						writeString = writeString + oldId.to_s + "\t"
						count = count + 1
					else
						anId = $newid
						writeString = writeString + $newid.to_s + "\t"
						nextArray.push([anId, name1, cDate, program])
						$newid = $newid + 1
						count = count + 1
					
					end
			end
					
		else
			writeString = writeString + item +"\t"
			count = count + 1
		end
	end
	newText << writeString
	writeString = "" 
end


mainArray = []
writeString = ""
count = 0
nextArray =[1]
$newid = 1


for line in text.readlines()

	newLine = line.split "\t"
#	if newLine[0].include?("HANDLE") == true
#	else
=begin
		if newLine[1].include?("AND") == true
			lineA = newLine.dup
			lineB =newLine.clone
			

			
			stringA = workString
			stringA = stringA.gsub(" ", "")
			stringA = stringA.gsub("ANDB", "")
			
			
			lineA[1] = stringA
			lineA[11] = ""
		
			Manipulation(lineA, writeString, newText)

			

			
			stringB = lineB[1]
			stringB = stringB.gsub(" ","")
			stringB = stringB.gsub("AAND","")
			
			lineB[1] = stringB
			
			lineB[9] = lineB[11]
			lineB[11] = ""

			Manipulation(lineB, writeString, newText, )
			

			
			
		else

=end
			if nextArray.length() == 7
				nextArray.shift
			end
			Manipulation(newLine, writeString, newText, nextArray)
		
			
		#end
#end
		
end

text.close()
newText.close()
