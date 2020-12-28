private package Pcre.Low_Level.Linker_Options is
--  Add a list of libraries required to link.
   pragma Linker_Options ("-l" & "pcre2-8");
end Pcre.Low_Level.Linker_Options;
