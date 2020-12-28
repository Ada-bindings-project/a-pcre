with Interfaces.C; use Interfaces.C;
with System;
with Ada.Finalization;
with System.Storage_Elements;

private with Pcre.Low_Level.Pcre2_H;
package Pcre.Matcher is


   type General_Context is tagged private;
   Null_General_Context : constant General_Context;

   type Compile_Context (<>) is tagged private;
   Null_Compile_Context : constant Compile_Context;

   type Match_Context (<>) is tagged private;
   Null_Match_Context : constant Match_Context;

   type Convert_Context (<>) is tagged private;

   type Code is tagged private;

   type Match_Data is tagged private;


   type Jit_Stack is tagged private;


   type Jit_Callback is access function (Arg1 : System.Address) return access Jit_Stack
     with Convention => C;


   type Callout_Block is record
      Version               : aliased Unsigned;
      Callout_Number        : aliased Unsigned;
      Capture_Top           : aliased Unsigned;
      Capture_Last          : aliased Unsigned;
      Offset_Vector         : access unsigned_long;
      Mark                  : access Character;
      Subject               : access Character;
      Subject_Length        : aliased unsigned_long;
      Start_Match           : aliased unsigned_long;
      Current_Position      : aliased unsigned_long;
      Pattern_Position      : aliased unsigned_long;
      Next_Item_Length      : aliased unsigned_long;
      Callout_String_Offset : aliased unsigned_long;
      Callout_String_Length : aliased unsigned_long;
      Callout_String        : access Character;
      Callout_Flags         : aliased Unsigned;
   end record
     with Convention => C_Pass_By_Copy;

   type Callout_Enumerate_Block is record
      Version               : aliased Unsigned;
      Pattern_Position      : aliased unsigned_long;
      Next_Item_Length      : aliased unsigned_long;
      Callout_Number        : aliased Unsigned;
      Callout_String_Offset : aliased unsigned_long;
      Callout_String_Length : aliased unsigned_long;
      Callout_String        : access Character;
   end record
     with Convention => C_Pass_By_Copy;

   type Substitute_Callout_Block_Array1601 is array (0 .. 1) of aliased unsigned_long;
   type Substitute_Callout_Block is record
      Version        : aliased Unsigned;
      Input          : access Character;
      Output         : access Character;
      Output_Offsets : aliased Substitute_Callout_Block_Array1601;
      Ovector        : access unsigned_long;
      Oveccount      : aliased Unsigned;
      Subscount      : aliased Unsigned;
   end record
     with Convention => C_Pass_By_Copy;

   function Config (Arg1 : Unsigned; Arg2 : System.Address) return int;

   ---------------------------------------------------------------------------------------

   function Create (From : General_Context'Class := Null_General_Context) return Compile_Context;
   --  This function creates and initializes a new compile context.

   type Bsr_Type is (ANYCRLF, UNICODE);
   procedure Set (Arg1 : Compile_Context; Arg2 : Bsr_Type);
   --
   --  This function sets the convention for processing \R within a compile context.
   --  ---------------------------------------------------------------------------------------------

   procedure Set_Character_Tables (Arg1 : Compile_Context; Arg2 : access Character);
   --
   --  This function sets a pointer to custom character tables within a compile context.
   --  The second argument must point to a set of PCRE2 character tables or be NULL to request the default tables.
   --  ---------------------------------------------------------------------------------------------


   type Extra_Options is private;
   function "+" (L, R : Extra_Options) return Extra_Options;
   EXTRA_ALLOW_SURROGATE_ESCAPES : constant Extra_Options;
   EXTRA_BAD_ESCAPE_IS_LITERAL   : constant Extra_Options;
   EXTRA_MATCH_WORD              : constant Extra_Options;
   EXTRA_MATCH_LINE              : constant Extra_Options;
   EXTRA_ESCAPED_CR_IS_LF        : constant Extra_Options;
   EXTRA_ALT_BSUX                : constant Extra_Options;

   procedure Set_Compile_Extra_Options (Arg1 : Compile_Context; Arg2 : Extra_Options);
   --
   --  This function sets additional option bits for compile() that are housed in a compile context.
   --  It completely replaces all the bits.
   --  ---------------------------------------------------------------------------------------------

   procedure Set_Max_Pattern_Length (Arg1 : Compile_Context; Arg2 : Natural);
   --
   --  This function sets, in a compile context, the maximum text length (in code units)
   --   of the pattern that can be compiled.
   --  If a longer pattern is passed to compile there is an immediate error return.
   --  The default is effectively unlimited, being the largest value a PCRE2_SIZE variable can hold.
   --  ---------------------------------------------------------------------------------------------

   type NEW_LINE_TYPE is (Cr,      --  Carriage return only
                          Lf,      --  Linefeed only
                          Crlf,    --  CR followed by LF only
                          Anycrlf, --  Any of the above
                          Any,     --  Any Unicode newline sequence
                          Nul);    --  The NUL character (binary zero)
   procedure Set_Newline (Context : Compile_Context; Arg2 : NEW_LINE_TYPE);
   --
   --  This function sets the newline convention within a compile context.
   --  This specifies which character(s) are recognized as newlines when compiling and matching patterns.
   --  ---------------------------------------------------------------------------------------------

   procedure Set_Parens_Nest_Limit (Context : Compile_Context; Arg2 : Positive);
   --
   --  This function sets, in a compile context, the maximum depth of nested parentheses in a pattern.
   --  ---------------------------------------------------------------------------------------------

   type Recursion_Guard_Interface is limited interface;
   type Recursion_Guard_Interface_Access is access all Recursion_Guard_Interface'Class;

   function Check (Guard : Recursion_Guard_Interface; Amount : Natural) return Boolean is abstract;

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
   --  ---------------------------------------------------------------------------------------------


   procedure Set_Glob_Escape (Context : Convert_Context; Arg2 : Character);
   --
   --  This function is part of an experimental set of pattern conversion functions.
   --  It sets the escape character that is used when converting globs.
   --  The second argument must either be NUL (meaning there is no escape character) or a punctuation character.
   --  The default is grave accent if running under Windows, otherwise backslash.
   --  ---------------------------------------------------------------------------------------------

   type Glob_Separator is new Character with Static_Predicate => Glob_Separator  in '/' | '\' | '.';
   procedure Set_Glob_Separator (Arg1 : Convert_Context; Arg2 : Glob_Separator);
   --
   --  This function is part of an experimental set of pattern conversion functions.
   --  It sets the component separator character that is used when converting globs.
   --  The second argument must be one of the characters forward slash, backslash, or dot.
   --  The default is backslash when running under Windows, otherwise forward slash.
   --  ---------------------------------------------------------------------------------------------

   procedure Pattern_Convert
     (Pattern   : String;
      Options   : Unsigned;
      Buffer    : System.Address;
      Blength   : access unsigned_long;
      Cvcontext : access Convert_Context) with Obsolescent;

   procedure Converted_Pattern_Free (Arg1 : access Character) with Obsolescent;
   --
   ------------------------------------------------------------------------------

   procedure Set_Callout
     (Arg1 : access Match_Context;
      Arg2 : access function (Arg1 : access Callout_Block; Arg2 : System.Address) return int;
      Arg3 : System.Address) with Obsolescent;

   procedure Set_Substitute_Callout
     (Arg1 : access Match_Context;
      Arg2 : access function (Arg1 : access Substitute_Callout_Block; Arg2 : System.Address) return int;
      Arg3 : System.Address) with Obsolescent;

   procedure Set_Depth_Limit (Arg1 : Match_Context; Arg2 : Natural);
   --
   --  Sets the backtracking depth limit field in a match context.
   ------------------------------------------------------------------------------

   procedure Set_Heap_Limit (Context : access Match_Context; Arg2 : System.Storage_Elements.Storage_Count);
   --
   --  Sets the backtracking heap limit field in a match context.
   ------------------------------------------------------------------------------

   procedure Set_Match_Limit (Context : access Match_Context; Arg2 : Natural);
   --
   --  sets the match limit field in a match context.
   ------------------------------------------------------------------------------

   procedure Set_Offset_Limit (Context : access Match_Context; Arg2 : Natural);
   --
   --  sets the offset limit field in a match context.
   ------------------------------------------------------------------------------

   procedure Set_Recursion_Memory_Management
     (Context : access Match_Context;
      Arg2 : access function (Arg1 : unsigned_long; Arg2 : System.Address) return System.Address;
      Arg3 : access procedure (Arg1 : System.Address; Arg2 : System.Address);
      Arg4 : System.Address);

   -----------------------------------------------------------------------------------------

   type Compile_Options is private;
   Null_Compile_Options : constant Compile_Options;
   ANCHORED           : constant Compile_Options ; -- Force pattern anchoring
   ALLOW_EMPTY_CLASS  : constant Compile_Options ; -- Allow empty classes
   ALT_BSUX           : constant Compile_Options ; -- Alternative handling of \u, \U, and \x
   ALT_CIRCUMFLEX     : constant Compile_Options ; -- Alternative handling of ^ in multiline mode
   ALT_VERBNAMES      : constant Compile_Options ; -- Process backslashes in verb names
   AUTO_CALLOUT       : constant Compile_Options ; -- Compile automatic callouts
   CASELESS           : constant Compile_Options ; -- Do caseless matching
   DOLLAR_ENDONLY     : constant Compile_Options ; -- $ not to match newline at end
   DOTALL             : constant Compile_Options ; -- . matches anything including NL
   DUPNAMES           : constant Compile_Options ; -- Allow duplicate names for subpatterns
   ENDANCHORED        : constant Compile_Options ; -- Pattern can match only at end of subject
   EXTENDED           : constant Compile_Options ; -- Ignore white space and # comments
   FIRSTLINE          : constant Compile_Options ; -- Force matching to be before newline
   LITERAL            : constant Compile_Options ; -- Pattern characters are all literal
   MATCH_INVALID_UTF  : constant Compile_Options ; -- Enable support for matching invalid UTF
   MATCH_UNSET_BACKREF  : constant Compile_Options ; -- Match unset backreferences
   MULTILINE          : constant Compile_Options ; -- ^ and $ match newlines within data
   NEVER_BACKSLASH_C  : constant Compile_Options ; -- Lock out the use of \C in patterns
   NEVER_UCP          : constant Compile_Options ; -- Lock out UCP, e.g. via (*UCP)
   NEVER_UTF          : constant Compile_Options ; -- Lock out UTF, e.g. via (*UTF)
   NO_AUTO_CAPTURE    : constant Compile_Options ; -- Disable numbered capturing paren-theses (named ones available)
   NO_AUTO_POSSESS    : constant Compile_Options ; -- Disable auto-possessification
   NO_DOTSTAR_ANCHOR  : constant Compile_Options ; -- Disable automatic anchoring for .*
   NO_START_OPTIMIZE  : constant Compile_Options ; -- Disable match-time start optimizations
   NO_UTF_CHECK       : constant Compile_Options ; -- Do not check the pattern for UTF validity (only relevant if UTF is set)
   UCP                : constant Compile_Options ; -- Use Unicode properties for \d, \w, etc.
   UNGREEDY           : constant Compile_Options ; -- Invert greediness of quantifiers
   USE_OFFSET_LIMIT   : constant Compile_Options ; -- Enable offset limit for unanchored matching
   UTF                : constant Compile_Options ; -- Treat pattern and subjects as UTF strings
   function Compile
     (Pattern : String;           --  A string containing expression to be compiled
      Options : Compile_Options := Null_Compile_Options;
      Context : Compile_Context'Class := Null_Compile_Context) return Code;
   --
   --  The length of the pattern and any error offset that is returned are in code units, not characters.
   --  A compile context is needed only if you want to provide custom memory allocation functions,
   --  or to provide an external function for system stack size checking, or to change one or more of these parameters.
   ---------------------------------------------------------------------------------------------------------------------

   function Pattern_Info
     (Arg1 : Code;
      Arg2 : Unsigned;
      Arg3 : System.Address) return int;

   function Callout_Enumerate
     (Arg1 : Code;
      Arg2 : access function (Arg1 : access Callout_Enumerate_Block; Arg2 : System.Address) return int;
      Arg3 : System.Address) return int;

   function Create (Size    : Positive;
                    Context : General_Context'Class := Null_General_Context) return Match_Data;
   --
   --  Creates a new match data block, which is used for holding the result of a match.
   --  The first argument specifies the number of pairs of offsets that are required.
   --  These form the "output vector" (ovector) within the match data block,
   --  and are used to identify the matched string and any captured substrings.
   --  There is always one pair of offsets; if ovecsize is zero, it is treated as one.
   ---------------------------------------------------------------------------------------------------------------------

   function Create (Code    : Pcre.Matcher.Code'Class;
                    Context : General_Context'Class := Null_General_Context) return Match_Data;
   --
   --  This function creates a new match data block, which is used for holding the result of a match.
   --  The first argument points to a compiled pattern.
   --  The number of capturing parentheses within the pattern is used to compute the number of pairs of offsets
   --  that are required in the match data block.
   --  These form the "output vector" (ovector) within the match data block,
   --  and are used to identify the matched string and any captured substrings
   ---------------------------------------------------------------------------------------------------------------------

   type Match_Options is private;

   Null_Match_Options         : constant Match_Options;
   Match_ANCHORED             : constant Match_Options; --  Match only at the first position
   Match_COPY_MATCHED_SUBJECT : constant Match_Options; --  On success, make a private subject copy
   Match_ENDANCHORED          : constant Match_Options; --  Pattern can match only at end of subject
   Match_NOTBOL               : constant Match_Options; --  Subject string is not the beginning of a line
   Match_NOTEOL               : constant Match_Options; --  Subject string is not the end of a line
   Match_NOTEMPTY             : constant Match_Options; --  An empty string is not a valid match
   Match_NOTEMPTY_ATSTART     : constant Match_Options; --  An empty string at the start of the subject is not a valid match
   Match_NO_JIT               : constant Match_Options; --  Do not use JIT matching
   Match_NO_UTF_CHECK         : constant Match_Options; --  Do not check the subject for UTF validity (only relevant if UTF was set at compile time)
   Match_PARTIAL_HARD         : constant Match_Options; --  Return ERROR_PARTIAL for a partial match even if there is a full match
   Match_PARTIAL_SOFT         : constant Match_Options; --  Return ERROR_PARTIAL for a partial match if no full matches are found

   function "+" (L, R : Match_Options) return Match_Options;
   type Workspace_Type (Size : Natural)is private;
   function Dfa_Match
     (Code        : Pcre.Matcher.Code;
      Subject     : String;
      Startoffset : Natural;
      Options     : Match_Options;
      Match_Data  : out Pcre.Matcher.Match_Data'Class;
      Context     : Pcre.Matcher.Match_Context'Class := Null_Match_Context;
      workspace   : Workspace_Type) return int;

   function Match
     (Code        : Pcre.Matcher.Code;
      Subject     : String;
      Startoffset : Natural := 0;
      Options     : Match_Options := Null_Match_Options;
      Match_Data  : out Pcre.Matcher.Match_Data'Class;
      Context     : Match_Context'Class := Null_Match_Context) return int;


   function Get_Mark (Match_Data : Pcre.Matcher.Match_Data) return access Character;

   function Get_Match_Data_Size (Match_Data : Pcre.Matcher.Match_Data) return Natural;

   function Get_Ovector_Count (Match_Data : Pcre.Matcher.Match_Data) return Natural;

   function Get_Ovector_Pointer (Match_Data : Pcre.Matcher.Match_Data) return access unsigned_long;

   function Get_Startchar (Match_Data : Pcre.Matcher.Match_Data) return unsigned_long;

   function Substring_Copy_Byname
     (Arg1 : Match_Data;
      Arg2 : Character;
      Arg3 : Character;
      Arg4 : unsigned_long) return int;

   function Substring_Copy_Bynumber
     (Arg1 : access Match_Data;
      Arg2 : Unsigned;
      Arg3 : access Character;
      Arg4 : access unsigned_long) return int;

   procedure Substring_Free (Arg1 : access Character);

   function Substring_Get_Byname
     (Arg1 : access Match_Data;
      Arg2 : access Character;
      Arg3 : System.Address;
      Arg4 : access unsigned_long) return int;

   function Substring_Get_Bynumber
     (Arg1 : access Match_Data;
      Arg2 : Unsigned;
      Arg3 : System.Address;
      Arg4 : access unsigned_long) return int;

   function Substring_Length_Byname
     (Arg1 : access Match_Data;
      Arg2 : access Character;
      Arg3 : access unsigned_long) return int;

   function Substring_Length_Bynumber
     (Arg1 : access Match_Data;
      Arg2 : Unsigned;
      Arg3 : access unsigned_long) return int;

   function Substring_Nametable_Scan
     (Arg1 : access constant Code;
      Arg2 : access Character;
      Arg3 : System.Address;
      Arg4 : System.Address) return int;

   function Substring_Number_From_Name (Arg1 : access constant Code; Arg2 : access Character) return int ;

   procedure Substring_List_Free (Arg1 : System.Address);

   function Substring_List_Get
     (Arg1 : access Match_Data;
      Arg2 : System.Address;
      Arg3 : System.Address) return int ;

   function Serialize_Encode
     (Arg1 : System.Address;
      Arg2 : int;
      Arg3 : System.Address;
      Arg4 : access unsigned_long;
      Arg5 : access General_Context) return int;

   function Serialize_Decode
     (Arg1 : System.Address;
      Arg2 : int;
      Arg3 : access Character;
      Arg4 : access General_Context) return int ;

   function Serialize_Get_Number_Of_Codes (Arg1 : access Character) return int;

   procedure Serialize_Free (Arg1 : access Character);

   procedure Substitute
     (Arg1  : access constant Code;
      Arg2  : access Character;
      Arg3  : unsigned_long;
      Arg4  : unsigned_long;
      Arg5  : Unsigned;
      Arg6  : access Match_Data'Class;
      Arg7  : access Match_Context'Class;
      Arg8  : access Character;
      Arg9  : unsigned_long;
      Arg10 : access Character;
      Arg11 : access unsigned_long);

   procedure Jit_Compile (Arg1 : access Code; Arg2 : Unsigned);

   function Jit_Match
     (Arg1 : access constant Code;
      Arg2 : access Character;
      Arg3 : unsigned_long;
      Arg4 : unsigned_long;
      Arg5 : Unsigned;
      Arg6 : access Match_Data'Class;
      Arg7 : access Match_Context'Class) return int ;

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

   function Get_Error_Message
     (Arg1 : int;
      Arg2 : access Character;
      Arg3 : unsigned_long) return int;

   function Maketables (Arg1 : access General_Context) return access Character;

   procedure Maketables_Free (Arg1 : access General_Context; Arg2 : access Character);
   PCRE_ERROR : exception;

private
   function Get_Error_Message (Code : int) return String;
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
   procedure Finalize   (Object : in out Match_Data);


   type Jit_Stack is  new Ada.Finalization.Controlled with record
      Impl : access Pcre.Low_Level.Pcre2_H.Pcre2_Jit_Stack_8;
   end record;
   procedure Initialize (Object : in out Jit_Stack);
   procedure Adjust     (Object : in out Jit_Stack);
   procedure Finalize   (Object : in out Jit_Stack);

   type Compile_Options is new Unsigned;
   ANCHORED           : constant Compile_Options := PCRE2_ANCHORED; -- Force pattern anchoring
   ALLOW_EMPTY_CLASS  : constant Compile_Options := PCRE2_ALLOW_EMPTY_CLASS ; -- Allow empty classes
   ALT_BSUX           : constant Compile_Options := PCRE2_ALT_BSUX ; -- Alternative handling of \u, \U, and \x
   ALT_CIRCUMFLEX     : constant Compile_Options := PCRE2_ALT_CIRCUMFLEX ; -- Alternative handling of ^ in multiline mode
   ALT_VERBNAMES      : constant Compile_Options := PCRE2_ALT_VERBNAMES ; -- Process backslashes in verb names
   AUTO_CALLOUT       : constant Compile_Options := PCRE2_AUTO_CALLOUT ; -- Compile automatic callouts
   CASELESS           : constant Compile_Options := PCRE2_CASELESS ; -- Do caseless matching
   DOLLAR_ENDONLY     : constant Compile_Options := PCRE2_DOLLAR_ENDONLY ; -- $ not to match newline at end
   DOTALL             : constant Compile_Options := PCRE2_DOTALL ; -- . matches anything including NL
   DUPNAMES           : constant Compile_Options := PCRE2_DUPNAMES ; -- Allow duplicate names for subpatterns
   ENDANCHORED        : constant Compile_Options := PCRE2_ENDANCHORED; -- Pattern can match only at end of subject
   EXTENDED           : constant Compile_Options := PCRE2_EXTENDED ; -- Ignore white space and # comments
   FIRSTLINE          : constant Compile_Options := PCRE2_FIRSTLINE; -- Force matching to be before newline
   LITERAL            : constant Compile_Options := PCRE2_LITERAL ; -- Pattern characters are all literal
   MATCH_INVALID_UTF  : constant Compile_Options := PCRE2_MATCH_INVALID_UTF ; -- Enable support for matching invalid UTF
   MATCH_UNSET_BACKREF  : constant Compile_Options := PCRE2_MATCH_UNSET_BACKREF ; -- Match unset backreferences
   MULTILINE          : constant Compile_Options := PCRE2_MULTILINE ; -- ^ and $ match newlines within data
   NEVER_BACKSLASH_C  : constant Compile_Options := PCRE2_NEVER_BACKSLASH_C ; -- Lock out the use of \C in patterns
   NEVER_UCP          : constant Compile_Options := PCRE2_NEVER_UCP ; -- Lock out UCP, e.g. via (*UCP)
   NEVER_UTF          : constant Compile_Options := PCRE2_NEVER_UTF ; -- Lock out UTF, e.g. via (*UTF)
   NO_AUTO_CAPTURE    : constant Compile_Options := PCRE2_NO_AUTO_CAPTURE ; -- Disable numbered capturing paren-theses (named ones available)
   NO_AUTO_POSSESS    : constant Compile_Options := PCRE2_NO_AUTO_POSSESS ; -- Disable auto-possessification
   NO_DOTSTAR_ANCHOR  : constant Compile_Options := PCRE2_NO_DOTSTAR_ANCHOR ; -- Disable automatic anchoring for .*
   NO_START_OPTIMIZE  : constant Compile_Options := PCRE2_NO_START_OPTIMIZE ; -- Disable match-time start optimizations
   NO_UTF_CHECK       : constant Compile_Options := PCRE2_NO_UTF_CHECK; -- Do not check the pattern for UTF validity (only relevant if UTF is set)
   UCP                : constant Compile_Options := PCRE2_UCP; -- Use Unicode properties for \d, \w, etc.
   UNGREEDY           : constant Compile_Options := PCRE2_UNGREEDY ; -- Invert greediness of quantifiers
   USE_OFFSET_LIMIT   : constant Compile_Options := PCRE2_USE_OFFSET_LIMIT ; -- Enable offset limit for unanchored matching
   UTF                : constant Compile_Options := PCRE2_UTF ; -- Treat pattern and subjects as UTF strings
   Null_Compile_Options : constant Compile_Options := 0;

   type Extra_Options  is new Compile_Options;
   EXTRA_ALLOW_SURROGATE_ESCAPES : constant Extra_Options := PCRE2_EXTRA_ALLOW_SURROGATE_ESCAPES;
   EXTRA_BAD_ESCAPE_IS_LITERAL   : constant Extra_Options := PCRE2_EXTRA_BAD_ESCAPE_IS_LITERAL;
   EXTRA_MATCH_WORD              : constant Extra_Options := PCRE2_EXTRA_MATCH_WORD;
   EXTRA_MATCH_LINE              : constant Extra_Options := PCRE2_EXTRA_MATCH_LINE;
   EXTRA_ESCAPED_CR_IS_LF        : constant Extra_Options := PCRE2_EXTRA_ESCAPED_CR_IS_LF;
   EXTRA_ALT_BSUX                : constant Extra_Options := PCRE2_EXTRA_ALT_BSUX;

   Null_General_Context : constant General_Context := (Ada.Finalization.Controlled with null);
   Null_Compile_Context : constant Compile_Context := (Ada.Finalization.Controlled with null, null);
   Null_Match_Context   : constant Match_Context := (Ada.Finalization.Controlled with null);

   type Match_Options is new UNsigned;
   Null_Match_Options : constant Match_Options := 0;
   Match_ANCHORED             : constant Match_Options := PCRE2_ANCHORED;
   Match_COPY_MATCHED_SUBJECT : constant Match_Options := PCRE2_COPY_MATCHED_SUBJECT;
   Match_ENDANCHORED          : constant Match_Options := PCRE2_ENDANCHORED;
   Match_NOTBOL               : constant Match_Options := PCRE2_NOTBOL;
   Match_NOTEOL               : constant Match_Options := PCRE2_NOTEOL;
   Match_NOTEMPTY             : constant Match_Options := PCRE2_NOTEMPTY;
   Match_NOTEMPTY_ATSTART     : constant Match_Options := PCRE2_NOTEMPTY_ATSTART;
   Match_NO_JIT               : constant Match_Options := PCRE2_NO_JIT;
   Match_NO_UTF_CHECK         : constant Match_Options := PCRE2_NO_UTF_CHECK;
   Match_PARTIAL_HARD         : constant Match_Options := PCRE2_PARTIAL_HARD;
   Match_PARTIAL_SOFT         : constant Match_Options := PCRE2_PARTIAL_SOFT;
   type Integer_Array is array (Natural range <>) of aliased int;
   type Workspace_Type (Size : Natural ) is record
      Data : Integer_Array (1 .. Size);
   end record;

end   Pcre.Matcher;
