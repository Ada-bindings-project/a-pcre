--@test_case
pragma Ada_2020;
with Ada.Text_IO;
with GNAT.Source_Info;
with AUnit; use AUnit;
with GNAT.Strings;
with Ada.Streams.Storage.Unbounded;
with AUnit.Assertions; use AUnit.Assertions;
with GNAT.Memory_Dump;
with INTERFACES.C;
package body Pcre.Tests.Simple_Case is
----------
-- Name --
----------

   procedure Test_Compile (Test : in out AUnit.Test_Cases.Test_Case'Class) is
      Pattern       : constant String := "(\w+) (\d+.\d+)";
      Tc            : Test_Case renames Test_Case (Test);
   begin
      Tc.Re := Pcre.Matcher.Compile (Pattern => Pattern);
      Tc.Re.Compile (Pattern => Pattern);
   end;


   procedure Test_Match_1 (Test : in out AUnit.Test_Cases.Test_Case'Class) is
      Match_Data    : Pcre.Matcher.Match_Data;
      Subject       : constant String := "Bullen 123.672";

      Expected      : constant GNAT.Strings.String_List :=
                        (1 => new String'("Bullen 123.672"),
                         2 => new String'("Bullen"),
                         3 => new String'("123.672"));

      Tc            : Test_Case renames Test_Case (Test);
   begin
      for I in 0 .. Natural (Tc.Re.Match (Subject, Match_Data => Match_Data)) -1 loop
         Assert (Match_Data.Substring (I), Expected (I + 1).all, "Match failed");
      end loop;
   end;

   procedure Test_Compile2 (Test : in out AUnit.Test_Cases.Test_Case'Class) is
      Pattern       : constant String := "(\w+) (\d+.\d+)";
      Tc            : Test_Case renames Test_Case (Test);
   begin
      Tc.Re.Compile (Pattern => Pattern);
   end;

   procedure Test_Match_2 (Test : in out AUnit.Test_Cases.Test_Case'Class) is
      Match_Data    : Pcre.Matcher.Match_Data;
      Subject       : constant String := "Bullen 123.672";

      Expected      : constant GNAT.Strings.String_List :=
                        (1 => new String'("Bullen 123.672"),
                         2 => new String'("Bullen"),
                         3 => new String'("123.672"));

      Tc            : Test_Case renames Test_Case (Test);
   begin

      for I in 0 .. Natural (Tc.Re.Match (Subject, Match_Data => Match_Data)) -1 loop
         Assert (Match_Data (I), Expected (I + 1).all, "Match failed");
      end loop;
   end;

   procedure Test_Match_3 (Test : in out AUnit.Test_Cases.Test_Case'Class) is
      Match_Data    : Pcre.Matcher.Match_Data;
      Tc            : Test_Case renames Test_Case (Test);
      --                                             012345678901234
      Subject       : constant String (10 .. 24) := "0012a12b12c9999";
   begin
      Pcre.Matcher.Match (".*?(12.).*", Subject, Match_Data, 10);
      ASSERT (Match_Data (1), "12a", "Match Failed");
      Pcre.Matcher.Match (".*?(12.).*", Subject, Match_Data, 13);
      ASSERT (Match_Data (1), "12b", "Match Failed");
   end;


   procedure Test_Serialize (Test : in out AUnit.Test_Cases.Test_Case'Class) is
      Td            : Pcre.Matcher.Code;
      F             : aliased Ada.Streams.Storage.Unbounded.Stream_Type;
      Td2           : Pcre.Matcher.Code;
      Match_Data    : Pcre.Matcher.Match_Data;
   begin
      Td.Compile (".*?(12.).*");
      Pcre.Matcher.Code'Write (F'Access, Td);

      Pcre.Matcher.Code'Read (F'Access	, Td2);
      Td2.Match (Data => "0012a12b12c9999", Match_Data => Match_Data);
      ASSERT (Match_Data (1), "12a", "Match Failed");

   end;

   procedure Test_Config (Test : in out AUnit.Test_Cases.Test_Case'Class) is
      use PcRE.MATCHER;
      procedure Put_Line (Item : String) is null;
      BSR                         : INTERFACES.C.int := Config (CONFIG_BSR).BSR;
      COMPILED_WIDTHS             : Natural := Config (CONFIG_COMPILED_WIDTHS).COMPILED_WIDTHS;
      DEPTHLIMIT                  : Natural := Config (CONFIG_DEPTHLIMIT).DEPTHLIMIT;
      HEAPLIMIT                   : Natural := Config (CONFIG_HEAPLIMIT).HEAPLIMIT;
      JIT                         : Boolean := Config (CONFIG_JIT).JIT;
      JITTARGET                   : String := Config (CONFIG_JITTARGET).JITTARGET;
      LINKSIZE                    : Natural := Config (CONFIG_LINKSIZE).LINKSIZE;
      MATCHLIMIT                  : Natural := Config (CONFIG_MATCHLIMIT).MATCHLIMIT;
      BACKSLASH_C                 : Boolean := Config (CONFIG_NEVER_BACKSLASH_C).NEVER_BACKSLASH_C;
      NEWLINE                     : NEW_LINE_TYPE := Config (CONFIG_NEWLINE).NEWLINE;
      UNICODE                     : Boolean := Config (CONFIG_UNICODE).UNICODE;
      UNICODE_VERSION             : String := Config (CONFIG_UNICODE_VERSION).UNICODE_VERSION;
      Version                     : String := Config (CONFIG_Version).Version;
   begin
      PUT_LINE (BSR'IMG);
      PUT_LINE (COMPILED_WIDTHS'IMG);
      PUT_LINE (DEPTHLIMIT'IMG);
      PUT_LINE (HEAPLIMIT'IMG);
      PUT_LINE (JIT'IMG);
      PUT_LINE (JITTARGET'IMG);
      PUT_LINE (LINKSIZE'IMG);
      PUT_LINE (MATCHLIMIT'IMG);
      PUT_LINE (BACKSLASH_C'IMG);
      PUT_LINE (NEWLINE'IMG);
      PUT_LINE (UNICODE'IMG);
      PUT_LINE (UNICODE_VERSION'IMG);
      PUT_LINE (Version'IMG);
   end;

   function Name (Test : Test_Case) return AUnit.Message_String is
   begin
      return Format (GNAT.Source_Info.Enclosing_Entity);
   end Name;

   procedure Register_Tests (Test : in out Test_Case) is separate;
end Pcre.Tests.Simple_Case;
