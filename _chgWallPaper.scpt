#!/usr/bin/osascript

tell application "System Events"

	set displays to a reference to every desktop

	set homeDir to POSIX path of the (path to the home folder)
	-- to config images folder location
	set wallPaperDir to homeDir & "/path/to/all/your/wall-paper/images"

	--display dialog wallPaperDir

	set picList to {}

	--set picList to (every item of folder wallPaperDir whose name extension is "jpg")
	set tmpList to (list folder wallPaperDir without invisibles)
	repeat with i from 1 to count tmpList
		set fname to item i of tmpList as string
		set fpath to (wallPaperDir & "/" & fname)
		--if (not isDirectory(fpath)) then
		if fname ends with "jpg" or fname ends with "jpeg" or fname ends with "png" then
			set the end of picList to fname
		end if
		--end if
	end repeat

	--set picCount to (count picList) as number

	--display dialog (count picList)

	repeat with disp from 1 to (count displays)
		--set idx to (random number from 1 to picCount) as text
		--set wallpaper to (wallPaperDir & "/" & item idx of picList) as string
		--set fname to item idx of picList
		set fname to some item of picList
		set wallpaper to (wallPaperDir & "/" & fname) as string
		set picture of item disp of displays to POSIX file wallpaper
	end repeat

end tell

--not working yet
on isDirectory(someItem)
	set filePosixPath to quoted form of (POSIX path of someItem)
	set fileType to (do shell script "file -b " & filePosixPath)
	if fileType ends with "directory" then return true
	return false
end isDirectory
