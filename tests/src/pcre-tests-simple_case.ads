with Aunit.Test_Cases;
with Pcre.Matcher;
package Pcre.Tests.Simple_Case is

   type Test_Case is new AUnit.Test_Cases.Test_Case with record
      Re : Pcre.Matcher.Code;
   end record;

   function Name (Test : Test_Case) return AUnit.Message_String;
   procedure Register_Tests (Test : in out Test_Case);


end Pcre.Tests.Simple_Case;
