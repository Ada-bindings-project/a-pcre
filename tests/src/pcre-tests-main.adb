with Ada.Command_Line;
with Ada.Directories;
with Ada.Streams.Stream_IO;

with AUnit.Options;
with AUnit.Reporter.GNATtest;
with AUnit.Reporter.Text;
with AUnit.Reporter.XML;
with AUnit.Reporter.Stream_XML;
with AUnit.Run;
with AUnit.Test_Filters.List_Filters;
with AUnit.Test_Filters;
with AUnit;

with GNAT.Command_Line;
with GNAT.Strings;


with Pcre.Tests.All_Tests;
procedure Pcre.Tests.Main is
   use AUnit;


   use GNAT.Command_Line;
   use type GNAT.Strings.String_Access;
   DEFAULT_LIST        : constant String := "testlist.txt";

   function Run is new AUnit.Run.Test_Runner_With_Status (Pcre.Tests.All_Tests.Suit);
   Text_Reporter       : aliased AUnit.Reporter.Text.Text_Reporter;
   Test_Reporter       : aliased AUnit.Reporter.GNATtest.GNATtest_Reporter;
   XML_Reporter        : aliased AUnit.Reporter.XML.XML_Reporter;
   XML_Stream_Reporter : aliased AUnit.Reporter.Stream_XML.XML_Reporter;

   Options             : aliased AUnit.Options.AUnit_Options := AUnit.Options.Default_Options;
   Filter              : aliased AUnit.Test_Filters.List_Filters.List_Filter;
   Filter_Path         : aliased GNAT.Strings.String_Access;
   Test_List_Save      : aliased GNAT.Strings.String_Access;
   Use_Text            : aliased Boolean := True;
   Use_Test            : aliased Boolean := False;
   Use_XML             : aliased Boolean := False;

   XML_Report          : aliased GNAT.Strings.String_Access;
   Outf                : Ada.Streams.Stream_IO.File_Type;

   Command_Line_Config : Command_Line_Configuration;

   type Reporter_Access is access all AUnit.Reporter.Reporter'Class;
   Reporter : Reporter_Access := Text_Reporter'Unrestricted_Access;
begin

   Options.Report_Successes := False;
   Define_Switch (Command_Line_Config, Options.Global_Timer'Unrestricted_Access, "-T", "--global-timer", Help => "Time all cases");
   Define_Switch (Command_Line_Config, Options.Test_Case_Timer'Unrestricted_Access, "-t", "--test-case-timer", Help => "time every case");
   Define_Switch (Command_Line_Config, Options.Report_Successes'Unrestricted_Access, "-s", "--report-successes", Help => "Report sucesses");
   Define_Switch (Command_Line_Config, Filter_Path'Unrestricted_Access, "-f?", "--filer?", Help => "Read testcases to run form PATH", Argument => "PATH");
   Define_Switch (Command_Line_Config, Test_List_Save'Unrestricted_Access, "-o=", "", Help => "save a list io testcates to PATH", Argument => "PATH");

   Define_Switch (Command_Line_Config, Use_Test'Unrestricted_Access, "", "--test", Help => "report in gettest format");
   Define_Switch (Command_Line_Config, Use_Text'Unrestricted_Access, "", "--no-text", Help => "Dont report in text format", Value => False);
   Define_Switch (Command_Line_Config, Use_XML'Unrestricted_Access, "", "--xml", Help => "Report in xml format");
   Define_Switch (Command_Line_Config, XML_Report'Unrestricted_Access, "", "--XML=", Help => "Report in XML to PATH", Argument => "PATH");

   GNAT.Command_Line.Getopt (Command_Line_Config);

   if Use_Text then
      Reporter := Text_Reporter'Unrestricted_Access;
   elsif Use_XML then
      Reporter := XML_Reporter'Unrestricted_Access;
   elsif XML_Report /= null then
      Ada.Streams.Stream_IO.Create (Outf, Mode => Ada.Streams.Stream_IO.Out_File, Name => XML_Report.all);
      Reporter := XML_Stream_Reporter'Unrestricted_Access;
      XML_Stream_Reporter.Set_Output (AUnit.Reporter.Stream_XML.Stream_Access (Ada.Streams.Stream_IO.Stream (Outf)));
   elsif Use_Test then
      Reporter := Test_Reporter'Unrestricted_Access;
   end if;

   if Filter_Path /= null and then Filter_Path.all'Length /= 0 then
      Filter.Read (Filter_Path.all);
      Options.Filter := Filter'Unrestricted_Access;
   elsif Ada.Directories.Exists (DEFAULT_LIST) then
      Filter.Read (DEFAULT_LIST);
      Options.Filter := Filter'Unrestricted_Access;
   end if;

   if Run (Reporter.all, Options) = AUnit.Success then
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
   else
      Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Failure);
   end if;

   if Test_List_Save /= null and then Test_List_Save.all'Length /= 0 then
      Filter.Write (Test_List_Save.all);
   end if;

   if Ada.Streams.Stream_IO.Is_Open (Outf) then
      Ada.Streams.Stream_IO.Close (Outf);
   end if;

exception
   when GNAT.Command_Line.Exit_From_Command_Line  | GNAT.Command_Line.Invalid_Switch  =>
      null;
end;
