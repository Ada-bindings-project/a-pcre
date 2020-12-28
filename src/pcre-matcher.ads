with Interfaces.C; use Interfaces.C;
with System;
with Ada.Finalization;


private with Pcre.Low_Level.Pcre2_H;
package Pcre.Matcher is


   type General_Context is tagged private;

   type Compile_Context (<>) is tagged private;

   type Match_Context (<>) is tagged private;

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

   function Create (From : General_Context'Class) return Compile_Context;
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
   ALLOW_SURROGATE_ESCAPES : constant Extra_Options;
   BAD_ESCAPE_IS_LITERAL   : constant Extra_Options;
   MATCH_WORD              : constant Extra_Options;
   MATCH_LINE              : constant Extra_Options;
   ESCAPED_CR_IS_LF        : constant Extra_Options;
   ALT_BSUX                : constant Extra_Options;
   procedure Set_Compile_Extra_Options (Arg1 : Compile_Context; Arg2 : Extra_Options);
   --
   --  This function sets additional option bits for compile() that are housed in a compile context.
   --  It completely replaces all the bits.
   --  ---------------------------------------------------------------------------------------------

   procedure Set_Max_Pattern_Length (Arg1 : Compile_Context; Arg2 : unsigned_long);
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
   procedure Set_Newline (Arg1 : Compile_Context; Arg2 : NEW_LINE_TYPE);
   --
   --  This function sets the newline convention within a compile context.
   --  This specifies which character(s) are recognized as newlines when compiling and matching patterns.
   --  ---------------------------------------------------------------------------------------------

   procedure Set_Parens_Nest_Limit (Arg1 : Compile_Context; Arg2 : Positive);
   --
   --  This function sets, in a compile context, the maximum depth of nested parentheses in a pattern.
   --  ---------------------------------------------------------------------------------------------

   type Recursion_Guard_Interface is limited interface;
   type Recursion_Guard_Interface_Access is access all Recursion_Guard_Interface'Class;

   function Check (Gurad : Recursion_Guard_Interface; Amount : Natural) return Boolean is abstract;

   procedure Set_Compile_Recursion_Guard
     (Arg1  : access Compile_Context;
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


   procedure Set_Glob_Escape (Arg1 : access Convert_Context; Arg2 : Unsigned);

   procedure Set_Glob_Separator (Arg1 : access Convert_Context; Arg2 : Unsigned);

   function Pattern_Convert
     (Arg1 : access Character;
      Arg2 : unsigned_long;
      Arg3 : Unsigned;
      Arg4 : System.Address;
      Arg5 : access unsigned_long;
      Arg6 : access Convert_Context) return int;

   procedure Converted_Pattern_Free (Arg1 : access Character);

   ------------------------------------------------------------------------------

   procedure Set_Callout
     (Arg1 : access Match_Context;
      Arg2 : access function (Arg1 : access Callout_Block; Arg2 : System.Address) return int;
      Arg3 : System.Address);

   procedure Set_Substitute_Callout
     (Arg1 : access Match_Context;
      Arg2 : access function (Arg1 : access Substitute_Callout_Block; Arg2 : System.Address) return int;
      Arg3 : System.Address);

   procedure Set_Depth_Limit (Arg1 : access Match_Context; Arg2 : Unsigned);

   procedure Set_Heap_Limit (Arg1 : access Match_Context; Arg2 : Unsigned);

   procedure Set_Match_Limit (Arg1 : access Match_Context; Arg2 : Unsigned);

   procedure Set_Offset_Limit (Arg1 : access Match_Context; Arg2 : unsigned_long);

   procedure Set_Recursion_Limit (Arg1 : access Match_Context; Arg2 : Unsigned);

   procedure Set_Recursion_Memory_Management
     (Arg1 : access Match_Context;
      Arg2 : access function (Arg1 : unsigned_long; Arg2 : System.Address) return System.Address;
      Arg3 : access procedure (Arg1 : System.Address; Arg2 : System.Address);
      Arg4 : System.Address);

   -----------------------------------------------------------------------------------------
   -----------------------------------------------------------------------------------------
   function Compile
     (Arg1 : access Character;
      Arg2 : unsigned_long;
      Arg3 : Unsigned;
      Arg4 : access int;
      Arg5 : access unsigned_long;
      Arg6 : access Compile_Context) return access Code'Class;

   procedure Code_Free (Arg1 : access Code);

   function Code_Copy (Arg1 : access constant Code) return access Code;

   function Code_Copy_With_Tables (Arg1 : access constant Code) return access Code;

   function Pattern_Info
     (Arg1 : access constant Code;
      Arg2 : Unsigned;
      Arg3 : System.Address) return int;

   function Callout_Enumerate
     (Arg1 : access constant Code;
      Arg2 : access function (Arg1 : access Callout_Enumerate_Block; Arg2 : System.Address) return int;
      Arg3 : System.Address) return int;

   function Match_Data_Create (Arg1 : Unsigned; Arg2 : access General_Context) return access Match_Data'Class;

   function Match_Data_Create_From_Pattern (Arg1 : access constant Code;
                                            Arg2 : access General_Context'Class) return access Match_Data'Class;

   function Dfa_Match
     (Arg1 : access constant Code;
      Arg2 : access Character;
      Arg3 : unsigned_long;
      Arg4 : unsigned_long;
      Arg5 : Unsigned;
      Arg6 : access Match_Data'Class;
      Arg7 : access Match_Context'Class;
      Arg8 : access int;
      Arg9 : unsigned_long) return int;

   function Match
     (Arg1 : access constant Code;
      Arg2 : access Character;
      Arg3 : unsigned_long;
      Arg4 : unsigned_long;
      Arg5 : Unsigned;
      Arg6 : access Match_Data'Class;
      Arg7 : access Match_Context'Class) return int;

   procedure Match_Data_Free (Arg1 : access Match_Data);

   function Get_Mark (Arg1 : access Match_Data) return access Character;

   function Get_Match_Data_Size (Arg1 : access Match_Data) return unsigned_long;

   function Get_Ovector_Count (Arg1 : access Match_Data) return Unsigned;

   function Get_Ovector_Pointer (Arg1 : access Match_Data) return access unsigned_long;

   function Get_Startchar (Arg1 : access Match_Data) return unsigned_long;

   function Substring_Copy_Byname
     (Arg1 : access Match_Data;
      Arg2 : access Character;
      Arg3 : access Character;
      Arg4 : access unsigned_long) return int;

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
private
   use Pcre.Low_Level.Pcre2_H;
   type General_Context is new Ada.Finalization.Controlled with record
      Impl : access Pcre.Low_Level.Pcre2_H.Pcre2_General_Context_8;
   end record;
   procedure Initialize (Object : in out General_Context);
   procedure Adjust     (Object : in out General_Context);
   procedure Finalize   (Object : in out General_Context);

   type Compile_Context is  new Ada.Finalization.Controlled with record
      Impl : access Pcre.Low_Level.Pcre2_H.Pcre2_Compile_Context_8;
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
   procedure Initialize (Object : in out Match_Data);
   procedure Adjust     (Object : in out Match_Data);
   procedure Finalize   (Object : in out Match_Data);


   type Jit_Stack is  new Ada.Finalization.Controlled with record
      Impl : access Pcre.Low_Level.Pcre2_H.Pcre2_Jit_Stack_8;
   end record;
   procedure Initialize (Object : in out Jit_Stack);
   procedure Adjust     (Object : in out Jit_Stack);
   procedure Finalize   (Object : in out Jit_Stack);

   type Extra_Options  is new Unsigned;
   ALLOW_SURROGATE_ESCAPES : constant Extra_Options := PCRE2_EXTRA_ALLOW_SURROGATE_ESCAPES;
   BAD_ESCAPE_IS_LITERAL   : constant Extra_Options := PCRE2_EXTRA_BAD_ESCAPE_IS_LITERAL;
   MATCH_WORD              : constant Extra_Options := PCRE2_EXTRA_MATCH_WORD;
   MATCH_LINE              : constant Extra_Options := PCRE2_EXTRA_MATCH_LINE;
   ESCAPED_CR_IS_LF        : constant Extra_Options := PCRE2_EXTRA_ESCAPED_CR_IS_LF;
   ALT_BSUX                : constant Extra_Options := PCRE2_EXTRA_ALT_BSUX;
end   Pcre.Matcher;
