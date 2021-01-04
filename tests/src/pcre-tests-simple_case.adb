--@test_case
pragma Ada_2012;
with GNAT.Source_Info;
with AUnit; use AUnit;
with GNAT.Strings;
with AUnit.Assertions; use AUnit.Assertions;
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

   function Name (Test : Test_Case) return AUnit.Message_String is
   begin
      return Format (GNAT.Source_Info.Enclosing_Entity);
   end Name;

   procedure Register_Tests (Test : in out Test_Case) is separate;
end Pcre.Tests.Simple_Case;
