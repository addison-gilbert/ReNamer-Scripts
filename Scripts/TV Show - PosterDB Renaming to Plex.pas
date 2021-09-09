//PosterDB Renaming to Plex by Addison G.
//**TV Series Only**
//Goal: Take in TV Posters downloaded from ThePosterDB.com,
//      rename them so Plex will use them after a metadata refresh.
//Procedure: Checks for if the term "Specials" or "Season" are 
//			 present in the file. If no, then rename the show cover
//			 poster as "show.ext". If yes to "Specials", then rename
//			 to "season-specials-poster.ext" and move to folder
//			 "Specials". If yes to "Season", then rename the file to
//			 "SeasonXX.ext" and move the file to the folder "Season XX".

var
  BaseName, ExtName, NewName, Folder: WideString;
  spec_pos, seas_pos, end_pos, base_len: integer;

begin
  BaseName := WideExtractBaseName(FileName);
  ExtName := WideExtractFileExt(FileName);
  spec_pos := pos('Specials',BaseName);
  seas_pos := pos('Season',BaseName);

  if spec_pos = 0 then
    if seas_pos = 0 then
        FileName := 'show' + WideExtractFileExt(FileName);
  if spec_pos>0 then
    begin
      FileName := 'Specials\season-specials-poster' + WideExtractFileExt(FileName);
    end;
  if seas_pos>0 then
    begin
      end_pos := seas_pos + 6;
      WideDelete(BaseName, 1, end_pos);
      base_len := Length(BaseName);
      if base_len = 1 then
        begin
          NewName := 'Season0' + BaseName
          Folder := 'Season 0' + BaseName + '\'
          FileName := Folder + NewName + WideExtractFileExt(FileName);
        end;
      if base_len = 2 then
        begin
          NewName := 'Season' + BaseName
          Folder := 'Season ' + BaseName + '\'
          FileName := Folder + NewName + WideExtractFileExt(FileName);
        end;
    end;
end.
