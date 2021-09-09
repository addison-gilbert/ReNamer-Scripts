﻿//PosterDB Renaming to Plex by Addison G.
//**Movies Only**
//Goal: Take in Movie Posters downloaded from ThePosterDB.com,
//      rename them so Plex will use them after a metadata refresh.
//Procedure: Creates a folder with the exact name the file already
//           has then moves the file into that folder.

var
  BaseName: WideString;

begin
  BaseName := WideExtractBaseName(FileName);

  FileName := BaseName + '\' + FileName
end.
