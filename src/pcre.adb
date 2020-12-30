pragma Ada_2012;
with Pcre.Low_Level.Pcre2_H;
with Pcre.Matcher;
package body Pcre is

   procedure Retcode_2_Exception (Code : Interfaces.C.int) is
      use type Interfaces.C.int;
   begin
      if Code /= 0 and then Code /= 100 then
         raise PCRE_ERROR with "[" & Code'Img & "] " & Pcre.Matcher.Get_Error_Message (Code);
      end if;
   end;

   ---------
   -- "+" --
   ---------

   function "+" (L, R : Extra_Options) return Extra_Options is
   begin
      return Extra_Options (Natural (L) + Natural (R));
   end "+";


   function "+" (L, R : Compile_Options) return Compile_Options is
   begin
      return Compile_Options (Natural (L) + Natural (R));
   end "+";

   function "+" (L, R : Match_Options) return Match_Options is
   begin
      return Match_Options (Natural (L) + Natural (R));
   end "+";

end Pcre;
