with AUnit.Run.Generic_Runner;
with Pcre.Tests.All_Tests;
procedure Pcre.Tests.Main is new AUnit.Run.Generic_Runner (Pcre.Tests.All_Tests.Suit);

