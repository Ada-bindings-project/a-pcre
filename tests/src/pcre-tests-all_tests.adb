pragma Ada_2012;
with Pcre.Tests.Simple_Case;
package body Pcre.Tests.all_tests is

   ----------
   -- Suit --
   ----------
   Simpl : aliased Pcre.Tests.Simple_Case.Test_Case;
   S     : aliased  AUnit.Test_Suites.Test_Suite;
   function Suit return AUnit.Test_Suites.Access_Test_Suite is
   begin
      S.Add_Test (Simpl'Access);
      return S'Access;
   end Suit;

end Pcre.Tests.all_tests;
