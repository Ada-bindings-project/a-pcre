with Interfaces.C; use Interfaces.C;
with System;
with Ada.Finalization;
with System.Storage_Elements;
with Ada.Streams;
private with Pcre.Low_Level.Pcre2_H;
private with Interfaces.C.Extensions;
package Pcre.Matcher is

   type General_Context is tagged private;
   Null_General_Context : constant General_Context;

   type Compile_Context (<>) is tagged private;
   Null_Compile_Context : constant Compile_Context;

   type Match_Context (<>) is tagged private;
   Null_Match_Context : constant Match_Context;

   type Convert_Context (<>) is tagged private;
   Null_Convert_Context : constant Convert_Context;

   type Code is tagged private with
     Read => Read,
     Write => Write;


   type Match_Data is tagged private with
     Constant_Indexing => Constant_Indexing;
   function Constant_Indexing (Self : Match_Data ; Index : Natural) return String;
   function Length (Self : Match_Data) return Natural;

   procedure Finalize (Object : in out Match_Data);

   type Jit_Stack is tagged private;


   type Jit_Callback is access function (Arg1 : System.Address) return access Jit_Stack
     with Convention => C;


   type Callout_Block (<>) is private;
   type Callout_Enumerate_Block (<>) is private;
   type Substitute_Callout_Block (<>) is private;

   type NEW_LINE_TYPE is (Cr,      --  Carriage return only
                          Lf,      --  Linefeed only
                          Crlf,    --  CR followed by LF only
                          Anycrlf, --  Any of the above
                          Any,     --  Any Unicode newline sequence
                          Nul);    --  The NUL character (binary zero)

   type Config_Type (What : Config_Settings; Size : Natural) is record
      case What is
      when CONFIG_BSR => BSR                             : int;
      when CONFIG_COMPILED_WIDTHS => COMPILED_WIDTHS     : Natural;
      when CONFIG_DEPTHLIMIT => DEPTHLIMIT               : Natural;
      when CONFIG_HEAPLIMIT => HEAPLIMIT                 : Natural;
      when CONFIG_JIT => JIT                             : Boolean;
      when CONFIG_JITTARGET => JITTARGET                 : String (1 .. Size);
      when CONFIG_LINKSIZE => LINKSIZE                   : Natural;
      when CONFIG_MATCHLIMIT => MATCHLIMIT               : Natural;
      when CONFIG_NEVER_BACKSLASH_C => NEVER_BACKSLASH_C : Boolean;
      when CONFIG_NEWLINE => NEWLINE                     : NEW_LINE_TYPE;
      when CONFIG_UNICODE => UNICODE                     : Boolean;
      when CONFIG_UNICODE_VERSION => UNICODE_VERSION     : String (1 .. Size);
      when CONFIG_VERSION => Version                     : String (1 .. Size);
      when others => null;
      end case;
   end record;
   function Config (What : Config_Settings) return Config_Type;

   --  -------------------------------------------------------------------------------------------------------------------------

   function Create (From : General_Context'Class := Null_General_Context) return Compile_Context;
   --  This function creates and initializes a new compile context.
   --  -------------------------------------------------------------------------------------------------------------------------

   type Bsr_Type is (ANYCRLF, UNICODE);
   procedure Set (Context : Compile_Context; Bsr : Bsr_Type);
   --
   --  This function sets the convention for processing \R within a compile context.
   --  -------------------------------------------------------------------------------------------------------------------------
   type Character_Tables is private;
   procedure Set_Character_Tables (Context : Compile_Context; To : Character_Tables);
   --
   --  This function sets a pointer to custom character tables within a compile context.
   --  The second argument must point to a set of PCRE2 character tables or be NULL to request the default tables.
   --  -------------------------------------------------------------------------------------------------------------------------



   procedure Set_Compile_Extra_Options (Context : Compile_Context; Options : Extra_Options);
   --
   --  This function sets additional option bits for compile() that are housed in a compile context.
   --  It completely replaces all the bits.
   --  -------------------------------------------------------------------------------------------------------------------------

   procedure Set_Max_Pattern_Length (Context : Compile_Context; Length : Natural);
   --
   --  This function sets, in a compile context, the maximum text length (in code units)
   --   of the pattern that can be compiled.
   --  If a longer pattern is passed to compile there is an immediate error return.
   --  The default is effectively unlimited, being the largest value a PCRE2_SIZE variable can hold.
   --  -------------------------------------------------------------------------------------------------------------------------


   procedure Set_Newline (Context : Compile_Context; Arg2 : NEW_LINE_TYPE);
   --
   --  This function sets the newline convention within a compile context.
   --  This specifies which character(s) are recognized as newlines when compiling and matching patterns.
   --  -------------------------------------------------------------------------------------------------------------------------

   procedure Set_Parens_Nest_Limit (Context : Compile_Context; Limit : Positive);
   --
   --  This function sets the maximum depth of nested parentheses in a pattern.
   --  -------------------------------------------------------------------------------------------------------------------------



   procedure Set_Glob_Escape (Context : Convert_Context; Escape_Character : Character);
   --
   --  This function is part of an experimental set of pattern conversion functions.
   --  It sets the escape character that is used when converting globs.
   --  The second argument must either be NUL (meaning there is no escape character) or a punctuation character.
   --  The default is grave accent if running under Windows, otherwise backslash.
   --  -------------------------------------------------------------------------------------------------------------------------

   type Glob_Separator is new Character with Static_Predicate => Glob_Separator  in '/' | '\' | '.';
   procedure Set_Glob_Separator (Context : Convert_Context; Separator : Glob_Separator);
   --
   --  This function is part of an experimental set of pattern conversion functions.
   --  It sets the component separator character that is used when converting globs.
   --  The second argument must be one of the characters forward slash, backslash, or dot.
   --  The default is backslash when running under Windows, otherwise forward slash.
   --  -------------------------------------------------------------------------------------------------------------------------


   procedure Set_Depth_Limit (Context : Match_Context; Value : Natural);
   --
   --  Sets the backtracking depth limit field in a match context.
   --  -------------------------------------------------------------------------------------------------------------------------

   procedure Set_Heap_Limit (Context : access Match_Context; Limit : System.Storage_Elements.Storage_Count);
   --
   --  Sets the backtracking heap limit field in a match context.
   --  -------------------------------------------------------------------------------------------------------------------------

   procedure Set_Match_Limit (Context : access Match_Context; Limit : Natural);
   --
   --  sets the match limit field in a match context.
   --  -------------------------------------------------------------------------------------------------------------------------

   procedure Set_Offset_Limit (Context : access Match_Context; Limit : Natural);
   --
   --  sets the offset limit field in a match context.
   --  -------------------------------------------------------------------------------------------------------------------------



   function Compile
     (Pattern : String;
      Options : Compile_Options := Null_Compile_Options;
      Context : Compile_Context'Class := Null_Compile_Context) return Code;
   procedure Compile
     (Into    : in out Pcre.Matcher.Code;
      Pattern : String;
      Options : Compile_Options := Null_Compile_Options;
      Context : Compile_Context'Class := Null_Compile_Context);
   --
   --  The length of the pattern and any error offset that is returned are in code units, not characters.
   --  A compile context is needed only if you want to provide custom memory allocation functions,
   --  or to provide an external function for system stack size checking, or to change one or more of these parameters.
   --  -------------------------------------------------------------------------------------------------------------------------
   function Create (Size    : Positive;
                    Context : General_Context'Class := Null_General_Context) return Match_Data;
   procedure Initialize (Match_Data : in out Pcre.Matcher.Match_Data;
                         Size       : Positive;
                         Context    : General_Context'Class := Null_General_Context);
   --
   --  Creates a new match data block, which is used for holding the result of a match.
   --  The first argument specifies the number of pairs of offsets that are required.
   --  These form the "output vector" (ovector) within the match data block,
   --  and are used to identify the matched string and any captured substrings.
   --  There is always one pair of offsets; if ovecsize is zero, it is treated as one.
   --  -------------------------------------------------------------------------------------------------------------------------

   function Create (Code    : Pcre.Matcher.Code'Class;
                    Context : General_Context'Class := Null_General_Context) return Match_Data;
   procedure Initialize (Match_Data : in out Pcre.Matcher.Match_Data;
                         Code       : Pcre.Matcher.Code'Class;
                         Context    : General_Context'Class := Null_General_Context);
   --
   --  This function creates a new match data block, which is used for holding the result of a match.
   --  The first argument points to a compiled pattern.
   --  The number of capturing parentheses within the pattern is used to compute the number of pairs of offsets
   --  that are required in the match data block.
   --  These form the "output vector" (ovector) within the match data block,
   --  and are used to identify the matched string and any captured substrings
   --  -------------------------------------------------------------------------------------------------------------------------

   type Workspace_Type (Size : Natural)is private;
   function Match
     (Code        : Pcre.Matcher.Code;
      Data        : String;
      Match_Data  : in out Pcre.Matcher.Match_Data'Class;
      Data_First  : Integer      := -1;
      Data_Last   : Positive     := Positive'Last;
      Options     : Match_Options := Null_Match_Options;
      Context     : Pcre.Matcher.Match_Context'Class := Null_Match_Context;
      Workspace   : Workspace_Type) return Integer;
   --
   --  Matches a compiled regular expression against a given subject string,
   --  using an alternative matching algorithm that scans the subject string just once
   --   (except when processing lookaround assertions).
   --  This function is not Perl-compatible (the Perl-compatible matching function is match)
   --  matches a compiled regular expression against a given subject string,
   --  using an alternative matching algorithm that scans the subject string just once
   --    (except when processing lookaround assertions).
   --  -------------------------------------------------------------------------------------------------------------------------

   function Match
     (Code        : Pcre.Matcher.Code; -- the compiled pattern
      Data        : String;
      Match_Data  : in out Pcre.Matcher.Match_Data'Class;
      Data_First  : Integer      := -1;
      Data_Last   : Positive     := Positive'Last;
      Options     : Match_Options := Null_Match_Options;
      Context     : Match_Context'Class := Null_Match_Context) return Integer;

   procedure Match
     (Code        : Pcre.Matcher.Code; -- the compiled pattern
      Data        : String;
      Match_Data  : in out Pcre.Matcher.Match_Data'Class;
      Data_First  : Integer      := -1;
      Data_Last   : Positive     := Positive'Last;
      Options     : Match_Options := Null_Match_Options;
      Context     : Match_Context'Class := Null_Match_Context);

   procedure Match
     (Code        : String; -- the compiled pattern
      Data        : String;
      Match_Data  : in out Pcre.Matcher.Match_Data'Class;
      Data_First  : Integer      := -1;
      Data_Last   : Positive     := Positive'Last;
      Options     : Match_Options := Null_Match_Options;
      Context     : Match_Context'Class := Null_Match_Context);
   --
   --  Matches a compiled regular expression against a given subject string,
   --   using a matching algorithm that is similar to Perl's.
   --  It returns offsets to what it has matched and to captured substrings via the match_data block,
   --   which can be processed by functions with names that start with get_ovector_... or substring_....
   --  The return from match  is one more than the highest numbered capturing pair that has been set
   --   (for example, 1 if there are no captures), zero if the vector of offsets is too small,
   --   or a negative error code for no match and other errors
   --  -------------------------------------------------------------------------------------------------------------------------


   procedure Substring
     (Match_Data : Pcre.Matcher.Match_Data;
      Name       : String;
      Buffer     : out String;
      Last       : out Natural);

   function Substring
     (Match_Data : Pcre.Matcher.Match_Data;
      Name       : String) return String;

   procedure Substring
     (Match_Data : Pcre.Matcher.Match_Data;
      Number     : Natural;
      Buffer     : out String;
      Last       : out Natural);

   function Substring
     (Match_Data : Pcre.Matcher.Match_Data;
      Number     : Natural) return String;
   --
   --  This is a convenience function for extracting a captured substring into a given buffer.
   --  -------------------------------------------------------------------------------------------------------------------------

   function Substring_Length
     (Match_Data : Pcre.Matcher.Match_Data;
      Name       : String) return Natural;
   --  returns the length of a matched substring, identified by name.
   --  -------------------------------------------------------------------------------------------------------------------------

   function Substring_Length
     (Match_Data : Pcre.Matcher.Match_Data;
      Number     : Natural) return Natural;
   --  returns the length of a matched substring, identified by number.
   --  -------------------------------------------------------------------------------------------------------------------------


   function Number_From_Name (Code  : Pcre.Matcher.Code; Name  : String) return Natural;
   --  This convenience function finds the number of a named substring capturing parenthesis in a compiled pattern,
   --  provided that it is a unique name.
   --  The yield of the function is the number of the parenthesis if the name is found,
   --   or raises ERROR_NOSUBSTRING if it is not found.
   --   When duplicate names are allowed (DUPNAMES is set),
   --  if the name is not  unique, ERROR_NOUNIQUESUBSTRING is raised.
   --   You can obtain the list of numbers with the same name by calling substring_nametable_scan.
   --  -------------------------------------------------------------------------------------------------------------------------

   type Substring_List is tagged limited private;
   function Get (Match_Data : Pcre.Matcher.Match_Data'Class) return Substring_List;

   --  =========================================================================================================================
   --
   --  =========================================================================================================================

   function Pattern_Info
     (Code  : Pcre.Matcher.Code;
      What  : Unsigned;
      Where : System.Address) return int;

   function Callout_Enumerate
     (Code         : Pcre.Matcher.Code;
      Callback     : access function (Arg1 : access Callout_Enumerate_Block; Callout_Data : System.Address) return int;
      Callout_Data : System.Address) return int;


   procedure Set_Callout
     (Context             : Match_Context;
      Callout_Function    : access function (Arg1 : access Callout_Block; Callout_Data : System.Address) return int;
      Callout_Data        : System.Address);
   --  -------------------------------------------------------------------------------------------------------------------------

   procedure Set_Substitute_Callout
     (Context             : Match_Context;
      Callout_Function    : access function (Arg1 : access Substitute_Callout_Block; Callout_Data : System.Address) return int;
      Callout_Data        : System.Address);
   --  -------------------------------------------------------------------------------------------------------------------------

  procedure Substring_Nametable_Scan
     (Code  : Pcre.Matcher.Code;
      Name  : String;
      First : System.Address;
      Last  : System.Address);

   type Recursion_Guard_Interface is limited interface;
   type Recursion_Guard_Interface_Access is access all Recursion_Guard_Interface'Class;

   function Check (Guard : Recursion_Guard_Interface; Amount : Natural) return Boolean is abstract;

   procedure Set_Recursion_Memory_Management
     (Context : access Match_Context;
      Arg2    : access function (Arg1 : unsigned_long; Arg2 : System.Address) return System.Address;
      Arg3    : access procedure (Arg1 : System.Address; Arg2 : System.Address);
      Arg4    : System.Address);

   --  -------------------------------------------------------------------------------------------------------------------------
   procedure Set_Compile_Recursion_Guard
     (Arg1  : in out Compile_Context;
      Guard : not null Recursion_Guard_Interface_Access);
   --
   --  This function defines, within a compile context, a function that is called whenever compile()
   --  starts to compile a parenthesized part of a pattern.
   --  The first argument to the function gives the current depth of parenthesis nesting,
   --  and the second is user data that is supplied when the function is set up.
   --  The callout function should return zero if all is well, or non-zero to force an error.
   --  This feature is provided so that applications can check the available system stack space,
   --  in order to avoid running out.
   --  -------------------------------------------------------------------------------------------------------------------------


   function Get_Mark (Match_Data : Pcre.Matcher.Match_Data) return access Character;
   --
   --  After a call of match that was passed the match block that is this function's argument,
   --  this function returns a pointer to the last (*MARK), (*PRUNE), or (*THEN) name that was encountered during the matching process.
   --  The name is zero-terminated, and is within the compiled pattern.
   --  The length of the name is in the preceding code unit.
   --  If no name is available, NULL is returned.
   --  After a successful match, the name that is returned is the last one on the matching path.
   --  After a failed match or a partial match, the last encountered name is returned.
   --  -------------------------------------------------------------------------------------------------------------------------

   function Get_Size (Match_Data : Pcre.Matcher.Match_Data) return Natural;
   --
   --  Returns the size, in bytes, of the match data block.
   --  -------------------------------------------------------------------------------------------------------------------------

   function Get_Ovector_Count (Match_Data : Pcre.Matcher.Match_Data) return Natural;
   --
   --  Returns the number of pairs of offsets in the ovector that forms part of the given match data block
   --  -------------------------------------------------------------------------------------------------------------------------

   function Get_Ovector_Pointer (Match_Data : Pcre.Matcher.Match_Data) return access unsigned_long;
   --
   --  Returns a pointer to the vector of offsets that forms part of the given match data block.
   --  The number of pairs can be found by calling pcre2_get_ovector_count().
   --  -------------------------------------------------------------------------------------------------------------------------

   function Get_Startchar (Match_Data : Pcre.Matcher.Match_Data) return unsigned_long;
   --
   --  After a successful call of pcre2_match() that was passed the match block that is this function's argument,
   --  this function returns the code unit offset of the character at which the successful match started.
   --  For a non-partial match, this can be different to the value of ovector[0]
   --  if the pattern contains the \K escape sequence. After a partial match, however,
   --  this value is always the same as ovector[0] because \K does not affect the result of a partial match.
   --  -------------------------------------------------------------------------------------------------------------------------

   procedure Substitute
     (Code              : Pcre.Matcher.Code;
      Subject           : String;
      Startoffset       : unsigned_long;
      Options           : Unsigned;
      Match_Data        : Pcre.Matcher.Match_Data'Class;
      Context           : Match_Context'Class;
      Replacement       : String;
      Outputbuffer      : out String;
      Last              : out unsigned_long);

   --  ===============================================================================================
   --  ===============================================================================================

   procedure Jit_Compile (Arg1 : access Code; Arg2 : Unsigned);

   function Jit_Match
     (Arg1 : access constant Code;
      Arg2 : access Character;
      Arg3 : unsigned_long;
      Arg4 : unsigned_long;
      Arg5 : Unsigned;
      Arg6 : access Match_Data'Class;
      Arg7 : access Match_Context'Class) return int;

   procedure Jit_Free_Unused_Memory (Arg1 : access General_Context);

   function Jit_Stack_Create
     (Arg1 : unsigned_long;
      Arg2 : unsigned_long;
      Arg3 : access General_Context) return access Jit_Stack'Class;

   procedure Jit_Stack_Assign
     (Arg1 : access Match_Context;
      Arg2 : Jit_Callback;
      Arg3 : System.Address);

   procedure Jit_Stack_Free (Arg1 : access Jit_Stack);


   function Maketables (Context :  General_Context) return Character_Tables;

   procedure Maketables_Free (Context :  General_Context; Tables : Character_Tables);

   function Get_Error_Message (Code : int) return String;

   procedure Read (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : out Code);
   procedure Write (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : in Code);
   procedure Read (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : out Code; Context : General_Context'Class);
   procedure Write (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : in Code; Context : General_Context'Class);
   --  These routines will handle a patter in streameble format:
   --  <length of binary><pcre binary format>
private

   use Pcre.Low_Level.Pcre2_H;
   type General_Context is new Ada.Finalization.Controlled with record
      Impl : access Pcre.Low_Level.Pcre2_H.Pcre2_General_Context_8;
   end record;
   procedure Initialize (Object : in out General_Context);
   procedure Adjust     (Object : in out General_Context);
   procedure Finalize   (Object : in out General_Context);

   type Compile_Context is  new Ada.Finalization.Controlled with record
      Impl  : access Pcre.Low_Level.Pcre2_H.Pcre2_Compile_Context_8;
      Guard : Recursion_Guard_Interface_Access;
   end record;

   procedure Adjust     (Object : in out Compile_Context);
   procedure Finalize   (Object : in out Compile_Context);

   type Match_Context is new Ada.Finalization.Controlled with record
      Impl  : access Pcre.Low_Level.Pcre2_H.Pcre2_Match_Context_8;
   end record;
   procedure Adjust     (Object : in out Match_Context);
   procedure Finalize   (Object : in out Match_Context);

   type Convert_Context is  new Ada.Finalization.Controlled with record
      Impl : access Pcre.Low_Level.Pcre2_H.Pcre2_Convert_Context_8;
   end record;

   procedure Adjust     (Object : in out Convert_Context);
   procedure Finalize   (Object : in out Convert_Context);

   type Code is new Ada.Finalization.Controlled with record
      Impl : access Pcre.Low_Level.Pcre2_H.Pcre2_Code_8;
   end record;
   procedure Initialize (Object : in out Code);
   procedure Adjust     (Object : in out Code);
   procedure Finalize   (Object : in out Code);

   type Match_Data is new Ada.Finalization.Controlled with record
      Impl : access Pcre.Low_Level.Pcre2_H.Pcre2_Match_Data_8;
   end record;
   procedure Adjust     (Object : in out Match_Data);


   type Jit_Stack is  new Ada.Finalization.Controlled with record
      Impl : access Pcre.Low_Level.Pcre2_H.Pcre2_Jit_Stack_8;
   end record;

   procedure Initialize (Object : in out Jit_Stack);
   procedure Adjust     (Object : in out Jit_Stack);
   procedure Finalize   (Object : in out Jit_Stack);

   type Substring_List is  new Ada.Finalization.Limited_Controlled with record
      Listptr    : Interfaces.C.Extensions.Void_Ptr := System.Null_Address;
      Lengthsptr : Interfaces.C.Extensions.Void_Ptr := System.Null_Address;
   end record;
   procedure Finalize   (Object : in out Substring_List);


   type Character_Tables is access Unsigned_Char;

   Null_General_Context : constant General_Context := (Ada.Finalization.Controlled with null);
   Null_Compile_Context : constant Compile_Context := (Ada.Finalization.Controlled with null, null);
   Null_Match_Context   : constant Match_Context := (Ada.Finalization.Controlled with null);
   Null_Convert_Context : constant Convert_Context := (Ada.Finalization.Controlled with null);

   type Integer_Array is array (Natural range <>) of aliased int;
   type Workspace_Type (Size : Natural ) is record
      Data : Integer_Array (1 .. Size);
   end record;

   type Callout_Block is new Pcre.Low_Level.Pcre2_H.Pcre2_Callout_Block_8;
   type Callout_Enumerate_Block  is new Pcre.Low_Level.Pcre2_H.Pcre2_Callout_Enumerate_Block_8;
   type Substitute_Callout_Block  is new Pcre.Low_Level.Pcre2_H.Pcre2_Substitute_Callout_Block_8;

end   Pcre.Matcher;
