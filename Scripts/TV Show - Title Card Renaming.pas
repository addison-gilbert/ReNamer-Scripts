//Title Card Renaming for FileBot by Addison G.
//**TV Series Only**
//Goal: Take in Episode Title Cards, rename them with the extension
//      .mp4 so FileBot will properly rename the episodes for Plex.
//      Next, re-add the newly named files from FileBot. Prompt asks
//      for the original image extension. Removes .mp4 and adds the
//      user's input extension.
//Procedure: If the file is the first file in the ReNamer list and 
//      the extension does contain ".mp4" then a dialog box will
//      appear asking the user to input the original file extension.
//      A new dialog box will appear telling the user that ".mp4"
//      will be replaced by what they inputted.
//      If the file does not contain ".mp4", then the files will be
//      renamed with the extension ".mp4".

var
	UserInput: String;
	BaseName, ExtName: WideString;
	ExtCheck, UserInputCheck, Index: integer;

begin
	BaseName := WideExtractBaseName(FileName);
	ExtName := WideExtractFileExt(FileName);
	ExtCheck := pos('mp4',ExtName);
	Index := GetCurrentFileIndex;

	if (ExtCheck > 0) and (Index = 1) then //rename from mp4 to original extension
		begin
			repeat
				if not InputQuery('File Extension Question',
								  'Please type the original file extension without "." (period):',
								  UserInput)
				then ShowMessage('User cancelled the dialog');
			until UserInput <> '';
			UserInputCheck := pos('.', UserInput);
			if UserInputCheck > 0 then
				delete(UserInput, UserInputCheck, 1);

			ShowMessage('Replacing ' + '.mp4' + ' with .' + UserInput);
		end;


    FileName := BaseName + '.' + UserInput //add the user input extension to the file

	if ExtCheck = 0 then //append .mp4 to end of file (excl ext.)
		FileName := BaseName + '.mp4'
end.