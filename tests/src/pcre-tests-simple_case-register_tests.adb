-- @autogenerated
separate (Pcre.Tests.Simple_Case)
procedure Register_Tests (Test : in out Test_Case) is
begin
   Aunit.Test_Cases.Registration.Register_Routine (Test, Test_Compile'Access, "Test_Compile");
   Aunit.Test_Cases.Registration.Register_Routine (Test, Test_Match_1'Access, "Test_Match_1");
   Aunit.Test_Cases.Registration.Register_Routine (Test, Test_Compile2'Access, "Test_Compile2");
   Aunit.Test_Cases.Registration.Register_Routine (Test, Test_Match_2'Access, "Test_Match_2");
   Aunit.Test_Cases.Registration.Register_Routine (Test, Test_Match_3'Access, "Test_Match_3");
end Register_Tests;
