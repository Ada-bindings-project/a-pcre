private package Pcre.Low_Level.Linker_Options is
--  Add a list of libraries required to link.
   pragma Linker_Options ("-l" & "pcre");
end Pcre.Low_Level.Linker_Options;
