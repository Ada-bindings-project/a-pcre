pragma Ada_2012;
with Ada.Unchecked_Conversion;
package body Pcre.Matcher is
   function As_PCRE2_SPTR8 is new Ada.Unchecked_Conversion (System.Address, PCRE2_SPTR8);

   function Get_Error_Message (Code : int) return String is
      Ret : int;
      Buffer : String (1 .. 1024);
   begin
      Ret := Pcre2_Get_Error_Message_8 (Code, As_PCRE2_SPTR8 (Buffer'Address), Buffer'Length);
      return Buffer (Buffer'First .. Natural (Ret));
   end;

   procedure Retcode_2_Exception (Code : int) is
   begin
      if Code /= 0 and then Code /= 100 then
         raise PCRE_ERROR with "[" & Code'Img & "] " & Get_Error_Message (Code);
      end if;
   end;
   ------------
   -- Config --
   ------------

   function Config (Arg1 : Unsigned; Arg2 : System.Address) return int is
   begin
      return raise Program_Error with "Unimplemented function Config";
   end Config;


   -------------
   -- Set_Bsr --
   -------------

   Bsr_Type_Maping : constant array (Bsr_Type) of Unsigned := (ANYCRLF => PCRE2_BSR_ANYCRLF,
                                                               UNICODE => PCRE2_BSR_UNICODE);
   procedure Set (Arg1 : Compile_Context; Arg2 : Bsr_Type)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Bsr_8 (Arg1.Impl, Bsr_Type_Maping (Arg2)));
   end Set;

   --------------------------
   -- Set_Character_Tables --
   --------------------------

   procedure Set_Character_Tables
     (Arg1 : Compile_Context; Arg2 : access Character)
   is
      Data : aliased Unsigned_Char with Address => Arg2.all'Address;
   begin
      Retcode_2_Exception (Pcre2_Set_Character_Tables_8 (Arg1.Impl, Data'Access));
   end Set_Character_Tables;

   -------------------------------
   -- Set_Compile_Extra_Options --
   -------------------------------
   function "+" (L, R : Extra_Options) return Extra_Options is
   begin
      return Extra_Options (Unsigned (L)+ Unsigned (R));
   end;

   procedure Set_Compile_Extra_Options
     (Arg1 : Compile_Context; Arg2 : Extra_Options)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Compile_Extra_Options_8 (Arg1.Impl, Unsigned (Arg2)));
   end Set_Compile_Extra_Options;

   ----------------------------
   -- Set_Max_Pattern_Length --
   ----------------------------

   procedure Set_Max_Pattern_Length
     (Arg1 : Compile_Context; Arg2 : Natural)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Max_Pattern_Length_8 (Arg1.Impl, unsigned_long (Arg2)));
   end Set_Max_Pattern_Length;

   -----------------
   -- Set_Newline --
   -----------------
   NEW_LINE_MAP : constant array (NEW_LINE_TYPE) of Unsigned :=
                    (Cr      => PCRE2_NEWLINE_CR,
                     Lf      => PCRE2_NEWLINE_LF,
                     Crlf    => PCRE2_NEWLINE_CRLF,
                     Anycrlf => PCRE2_NEWLINE_ANYCRLF,
                     Any     => PCRE2_NEWLINE_ANY,
                     Nul     => PCRE2_NEWLINE_NUL);
   procedure Set_Newline
     (Context : Compile_Context; Arg2 : NEW_LINE_TYPE)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Newline_8 (Context.Impl, NEW_LINE_MAP (Arg2)));
   end Set_Newline;

   ---------------------------
   -- Set_Parens_Nest_Limit --
   ---------------------------

   procedure Set_Parens_Nest_Limit
     (Context : Compile_Context; Arg2 : Positive)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Parens_Nest_Limit_8 (Context.Impl, UNSIGNED (Arg2)));
   end Set_Parens_Nest_Limit;

   ---------------------------------
   -- Set_Compile_Recursion_Guard --
   ---------------------------------
   function Compile_Recursion_Guard (Arg1 : Unsigned; Arg2 : System.Address) return int is
      Me : Compile_Context with Address => Arg2, Import => True;
   begin
      return 0;
   end;

   procedure Set_Compile_Recursion_Guard
     (Arg1  : in out Compile_Context;
      Guard : not null Recursion_Guard_Interface_Access)
   is
   begin
      Arg1.Guard := Guard;
      null;
      --  Retcode_2_Exception (Pcre2_Set_Compile_Recursion_Guard_8 (Arg1.Impl, Arg2, Arg1.all'Address));
   end Set_Compile_Recursion_Guard;


   ---------------------
   -- Set_Glob_Escape --
   ---------------------

   procedure Set_Glob_Escape (Context : Convert_Context; Arg2 : Character)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Glob_Escape_8 (Context.Impl, Character'Pos (Arg2)));
   end Set_Glob_Escape;

   ------------------------
   -- Set_Glob_Separator --
   ------------------------

   procedure Set_Glob_Separator
     (Arg1 : Convert_Context; Arg2 : Glob_Separator)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Glob_Separator_8 (Arg1.Impl, Glob_Separator'Pos (Arg2)));
   end Set_Glob_Separator;

   ---------------------
   -- Pattern_Convert --
   ---------------------

   procedure Pattern_Convert
     (Pattern   : String;
      Options   : Unsigned;
      Buffer    : System.Address;
      Blength   : access unsigned_long;
      Cvcontext : access Convert_Context)
   is
   begin
      --  pragma Compile_Time_Warning (Standard.True, "Pattern_Convert unimplemented");
      raise Program_Error with "Unimplemented function Pattern_Convert";
   end Pattern_Convert;

   ----------------------------
   -- Converted_Pattern_Free --
   ----------------------------

   procedure Converted_Pattern_Free (Arg1 : access Character) is
   begin
      --  pragma Compile_Time_Warning(Standard.True, "Converted_Pattern_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Converted_Pattern_Free";
   end Converted_Pattern_Free;



   -----------------
   -- Set_Callout --
   -----------------

   procedure Set_Callout
     (Arg1 : access Match_Context;
      Arg2 : access function
        (Arg1 : access Callout_Block; Arg2 : System.Address) return int;
      Arg3 : System.Address)
   is
   begin
      raise Program_Error with "Unimplemented procedure Set_Callout";
   end Set_Callout;

   ----------------------------
   -- Set_Substitute_Callout --
   ----------------------------

   procedure Set_Substitute_Callout
     (Arg1 : access Match_Context;
      Arg2 : access function
        (Arg1 : access Substitute_Callout_Block; Arg2 : System.Address)
      return int;
      Arg3 : System.Address)
   is
   begin
      raise Program_Error with "Unimplemented procedure Set_Substitute_Callout";
   end Set_Substitute_Callout;

   ---------------------
   -- Set_Depth_Limit --
   ---------------------

   procedure Set_Depth_Limit (Arg1 : Match_Context; Arg2 : Natural) is
   begin
      Retcode_2_Exception (Pcre2_Set_Depth_Limit_8 (Arg1.Impl, Unsigned (Arg2)));
   end Set_Depth_Limit;

   --------------------
   -- Set_Heap_Limit --
   --------------------

   procedure Set_Heap_Limit (Context : access Match_Context; Arg2 : System.Storage_Elements.Storage_Count) is
   begin
      Retcode_2_Exception (Pcre2_Set_Heap_Limit_8 (Context.Impl, Unsigned (Arg2)));
   end Set_Heap_Limit;

   ---------------------
   -- Set_Match_Limit --
   ---------------------

   procedure Set_Match_Limit (Context : access Match_Context; Arg2 : Natural) is
   begin
      Retcode_2_Exception (Pcre2_Set_Match_Limit_8 (Context.Impl, Unsigned (Arg2)));
   end Set_Match_Limit;

   ----------------------
   -- Set_Offset_Limit --
   ----------------------

   procedure Set_Offset_Limit
     (Context : access Match_Context; Arg2 : Natural)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Offset_Limit_8 (Context.Impl, unsigned_long (Arg2)));
   end Set_Offset_Limit;

   -------------------------
   -- Set_Recursion_Limit --
   -------------------------

   procedure Set_Recursion_Limit (Arg1 : access Match_Context; Arg2 : Natural)
   is
   begin
      Retcode_2_Exception (pcre2_set_recursion_limit_8 (Arg1.Impl, Unsigned (Arg2)));
   end Set_Recursion_Limit;

   -------------------------------------
   -- Set_Recursion_Memory_Management --
   -------------------------------------

   procedure Set_Recursion_Memory_Management
     (Context : access Match_Context;
      Arg2 : access function (Arg1 : unsigned_long; Arg2 : System.Address) return System.Address;
      Arg3 : access procedure (Arg1 : System.Address; Arg2 : System.Address);
      Arg4    : System.Address)
   is
   begin
      raise Program_Error
        with "Unimplemented procedure Set_Recursion_Memory_Management";
   end Set_Recursion_Memory_Management;

   -------------
   -- Compile --
   -------------
   function Compile
     (Pattern : String;           --  A string containing expression to be compiled
      Options : Compile_Options := Null_Compile_Options;
      Context : Compile_Context'Class := Null_Compile_Context) return Code
   is
      Errocode : aliased Int;
      Erroroffset : aliased unsigned_long;
   begin
      return Ret : Code do
         Ret.Impl := Pcre2_Compile_8 (As_PCRE2_SPTR8 (Pattern (Pattern'First)'Address),
                                      Pattern'Length,
                                      Unsigned (Options),
                                      Errocode'Access,
                                      Erroroffset'Access,
                                      Context.Impl);

         if Errocode /= 0 then
            Retcode_2_Exception (Errocode);
         end if;
      end return;
   end Compile;


   ------------------
   -- Pattern_Info --
   ------------------

   function Pattern_Info
     (Arg1 : Code;
      Arg2 : Unsigned;
      Arg3 : System.Address) return int
   is
   begin
      return raise Program_Error with "Unimplemented function Pattern_Info";
   end Pattern_Info;

   -----------------------
   -- Callout_Enumerate --
   -----------------------

   function Callout_Enumerate
     (Arg1 : Code;
      Arg2 : access function (Arg1 : access Callout_Enumerate_Block; Arg2 : System.Address) return int;
      Arg3 : System.Address) return int
   is
   begin
      return raise Program_Error with "Unimplemented function Callout_Enumerate";
   end Callout_Enumerate;

   -----------------------
   -- Match_Data_Create --
   -----------------------

   function Create
     (Size    : Positive;
      Context : General_Context'Class := Null_General_Context) return Match_Data
   is
   begin
      return Ret : Match_Data do
         Ret.Impl := Pcre2_Match_Data_Create_8 (Unsigned (Size), Context.Impl);
      end return;
   end Create;

   ------------------------------------
   -- Match_Data_Create_From_Pattern --
   ------------------------------------

   function Create
     (Code    : Pcre.Matcher.Code'Class;
      Context : General_Context'Class := Null_General_Context) return Match_Data
   is
   begin
      return Ret : Match_Data do
         Ret.Impl := Pcre2_Match_Data_Create_From_Pattern_8 (Code.Impl, Context.Impl);
      end return;
   end Create;

   ---------------
   -- Dfa_Match --
   ---------------

   function Dfa_Match
     (Code        : Pcre.Matcher.Code;
      Subject     : String;
      Startoffset : Natural;
      Options     : Match_Options;
      Match_Data  : out Pcre.Matcher.Match_Data'Class;
      Context     : Pcre.Matcher.Match_Context'Class := Null_Match_Context;
      workspace   : Workspace_Type) return int
   is
   begin
      return raise Program_Error with "Unimplemented function Dfa_Match";
   end Dfa_Match;

   -----------
   -- Match --
   -----------
   function "+" (L, R : Match_Options) return Match_Options is
   begin
      return Match_Options (Unsigned (L)+ Unsigned (R));
   end;

   function Match
     (Code        : Pcre.Matcher.Code;
      Subject     : String;
      Startoffset : Natural := 0;
      Options     : Match_Options := Null_Match_Options;
      Match_Data  : out Pcre.Matcher.Match_Data'Class;
      Context     : Match_Context'Class := Null_Match_Context) return int
   is
      Ret : int;
   begin
      Ret := Pcre2_Match_8 (Code.Impl,
                            As_PCRE2_SPTR8 (Subject'Address),
                            Subject'Length,
                            Unsigned_Long (Startoffset),
                            Unsigned (Options),
                            Match_Data.Impl,
                            Context.Impl);
      return Ret;
   end Match;

   --------------
   -- Get_Mark --
   --------------

   function Get_Mark (Match_Data : Pcre.Matcher.Match_Data) return access Character is
   begin
      pragma Compile_Time_Warning (Standard.True, "Get_Mark unimplemented");
      return raise Program_Error with "Unimplemented function Get_Mark";
   end Get_Mark;

   -------------------------
   -- Get_Match_Data_Size --
   -------------------------

   function Get_Match_Data_Size (Match_Data : Pcre.Matcher.Match_Data) return Natural
   is
   begin
      return Natural(Pcre2_Get_Match_Data_Size_8 (Match_Data.Impl));
   end Get_Match_Data_Size;

   -----------------------
   -- Get_Ovector_Count --
   -----------------------

   function Get_Ovector_Count (Match_Data : Pcre.Matcher.Match_Data) return Natural is
   begin
      return Natural(Pcre2_Get_Ovector_Count_8 (Match_Data.Impl));
   end Get_Ovector_Count;

   -------------------------
   -- Get_Ovector_Pointer --
   -------------------------

   function Get_Ovector_Pointer
     (Match_Data : Pcre.Matcher.Match_Data) return access unsigned_long
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Ovector_Pointer unimplemented");
      return
      raise Program_Error with "Unimplemented function Get_Ovector_Pointer";
   end Get_Ovector_Pointer;

   -------------------
   -- Get_Startchar --
   -------------------

   function Get_Startchar (Match_Data : Pcre.Matcher.Match_Data) return unsigned_long is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Startchar unimplemented");
      return raise Program_Error with "Unimplemented function Get_Startchar";
   end Get_Startchar;

   ---------------------------
   -- Substring_Copy_Byname --
   ---------------------------

   function Substring_Copy_Byname
     (Arg1 : Match_Data;
      Arg2 : Character;
      Arg3 : Character;
      Arg4 : unsigned_long) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_Copy_Byname unimplemented");
      return
      raise Program_Error
        with "Unimplemented function Substring_Copy_Byname";
   end Substring_Copy_Byname;

   -----------------------------
   -- Substring_Copy_Bynumber --
   -----------------------------

   function Substring_Copy_Bynumber
     (Arg1 : access Match_Data; Arg2 : Unsigned; Arg3 : access Character;
      Arg4 : access unsigned_long) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_Copy_Bynumber unimplemented");
      return
      raise Program_Error
        with "Unimplemented function Substring_Copy_Bynumber";
   end Substring_Copy_Bynumber;

   --------------------
   -- Substring_Free --
   --------------------

   procedure Substring_Free (Arg1 : access Character) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Substring_Free";
   end Substring_Free;

   --------------------------
   -- Substring_Get_Byname --
   --------------------------

   function Substring_Get_Byname
     (Arg1 : access Match_Data; Arg2 : access Character; Arg3 : System.Address;
      Arg4 : access unsigned_long) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_Get_Byname unimplemented");
      return
      raise Program_Error with "Unimplemented function Substring_Get_Byname";
   end Substring_Get_Byname;

   ----------------------------
   -- Substring_Get_Bynumber --
   ----------------------------

   function Substring_Get_Bynumber
     (Arg1 : access Match_Data; Arg2 : Unsigned; Arg3 : System.Address;
      Arg4 : access unsigned_long) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_Get_Bynumber unimplemented");
      return
      raise Program_Error
        with "Unimplemented function Substring_Get_Bynumber";
   end Substring_Get_Bynumber;

   -----------------------------
   -- Substring_Length_Byname --
   -----------------------------

   function Substring_Length_Byname
     (Arg1 : access Match_Data; Arg2 : access Character;
      Arg3 : access unsigned_long) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_Length_Byname unimplemented");
      return
      raise Program_Error
        with "Unimplemented function Substring_Length_Byname";
   end Substring_Length_Byname;

   -------------------------------
   -- Substring_Length_Bynumber --
   -------------------------------

   function Substring_Length_Bynumber
     (Arg1 : access Match_Data; Arg2 : Unsigned; Arg3 : access unsigned_long)
      return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_Length_Bynumber unimplemented");
      return
      raise Program_Error
        with "Unimplemented function Substring_Length_Bynumber";
   end Substring_Length_Bynumber;

   ------------------------------
   -- Substring_Nametable_Scan --
   ------------------------------

   function Substring_Nametable_Scan
     (Arg1 : access constant Code; Arg2 : access Character;
      Arg3 : System.Address; Arg4 : System.Address) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_Nametable_Scan unimplemented");
      return
      raise Program_Error
        with "Unimplemented function Substring_Nametable_Scan";
   end Substring_Nametable_Scan;

   --------------------------------
   -- Substring_Number_From_Name --
   --------------------------------

   function Substring_Number_From_Name
     (Arg1 : access constant Code; Arg2 : access Character) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_Number_From_Name unimplemented");
      return
      raise Program_Error
        with "Unimplemented function Substring_Number_From_Name";
   end Substring_Number_From_Name;

   -------------------------
   -- Substring_List_Free --
   -------------------------

   procedure Substring_List_Free (Arg1 : System.Address) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_List_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Substring_List_Free";
   end Substring_List_Free;

   ------------------------
   -- Substring_List_Get --
   ------------------------

   function Substring_List_Get
     (Arg1 : access Match_Data; Arg2 : System.Address; Arg3 : System.Address)
      return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Substring_List_Get unimplemented");
      return
      raise Program_Error with "Unimplemented function Substring_List_Get";
   end Substring_List_Get;

   ----------------------
   -- Serialize_Encode --
   ----------------------

   function Serialize_Encode
     (Arg1 : System.Address; Arg2 : int; Arg3 : System.Address;
      Arg4 : access unsigned_long; Arg5 : access General_Context) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Serialize_Encode unimplemented");
      return
      raise Program_Error with "Unimplemented function Serialize_Encode";
   end Serialize_Encode;

   ----------------------
   -- Serialize_Decode --
   ----------------------

   function Serialize_Decode
     (Arg1 : System.Address; Arg2 : int; Arg3 : access Character;
      Arg4 : access General_Context) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Serialize_Decode unimplemented");
      return
      raise Program_Error with "Unimplemented function Serialize_Decode";
   end Serialize_Decode;

   -----------------------------------
   -- Serialize_Get_Number_Of_Codes --
   -----------------------------------

   function Serialize_Get_Number_Of_Codes (Arg1 : access Character) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Serialize_Get_Number_Of_Codes unimplemented");
      return
      raise Program_Error
        with "Unimplemented function Serialize_Get_Number_Of_Codes";
   end Serialize_Get_Number_Of_Codes;

   --------------------
   -- Serialize_Free --
   --------------------

   procedure Serialize_Free (Arg1 : access Character) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Serialize_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Serialize_Free";
   end Serialize_Free;

   ----------------
   -- Substitute --
   ----------------

   procedure Substitute
     (Arg1  : access constant Code; Arg2 : access Character;
      Arg3  : unsigned_long; Arg4 : unsigned_long; Arg5 : Unsigned;
      Arg6  : access Match_Data'Class; Arg7 : access Match_Context'Class;
      Arg8  : access Character; Arg9 : unsigned_long; Arg10 : access Character;
      Arg11 : access unsigned_long)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Substitute unimplemented");
      raise Program_Error with "Unimplemented procedure Substitute";
   end Substitute;

   -----------------
   -- Jit_Compile --
   -----------------

   procedure Jit_Compile (Arg1 : access Code; Arg2 : Unsigned) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Jit_Compile unimplemented");
      raise Program_Error with "Unimplemented procedure Jit_Compile";
   end Jit_Compile;

   ---------------
   -- Jit_Match --
   ---------------

   function Jit_Match
     (Arg1 : access constant Code; Arg2 : access Character;
      Arg3 : unsigned_long; Arg4 : unsigned_long; Arg5 : Unsigned;
      Arg6 : access Match_Data'Class; Arg7 : access Match_Context'Class)
      return int
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Jit_Match unimplemented");
      return raise Program_Error with "Unimplemented function Jit_Match";
   end Jit_Match;

   ----------------------------
   -- Jit_Free_Unused_Memory --
   ----------------------------

   procedure Jit_Free_Unused_Memory (Arg1 : access General_Context) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Jit_Free_Unused_Memory unimplemented");
      raise Program_Error
        with "Unimplemented procedure Jit_Free_Unused_Memory";
   end Jit_Free_Unused_Memory;

   ----------------------
   -- Jit_Stack_Create --
   ----------------------

   function Jit_Stack_Create
     (Arg1 : unsigned_long; Arg2 : unsigned_long;
      Arg3 : access General_Context) return access Jit_Stack'Class
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Jit_Stack_Create unimplemented");
      return
      raise Program_Error with "Unimplemented function Jit_Stack_Create";
   end Jit_Stack_Create;

   ----------------------
   -- Jit_Stack_Assign --
   ----------------------

   procedure Jit_Stack_Assign
     (Arg1 : access Match_Context; Arg2 : Jit_Callback; Arg3 : System.Address)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Jit_Stack_Assign unimplemented");
      raise Program_Error with "Unimplemented procedure Jit_Stack_Assign";
   end Jit_Stack_Assign;

   --------------------
   -- Jit_Stack_Free --
   --------------------

   procedure Jit_Stack_Free (Arg1 : access Jit_Stack) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Jit_Stack_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Jit_Stack_Free";
   end Jit_Stack_Free;

   -----------------------
   -- Get_Error_Message --
   -----------------------

   function Get_Error_Message
     (Arg1 : int; Arg2 : access Character; Arg3 : unsigned_long) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Error_Message unimplemented");
      return
      raise Program_Error with "Unimplemented function Get_Error_Message";
   end Get_Error_Message;

   ----------------
   -- Maketables --
   ----------------

   function Maketables (Arg1 : access General_Context) return access Character
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Maketables unimplemented");
      return raise Program_Error with "Unimplemented function Maketables";
   end Maketables;

   ---------------------
   -- Maketables_Free --
   ---------------------

   procedure Maketables_Free
     (Arg1 : access General_Context; Arg2 : access Character)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Maketables_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Maketables_Free";
   end Maketables_Free;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Object : in out General_Context) is
   begin
      Object.Impl := Pcre2_General_Context_Create_8 (Arg1 => null,
                                                     Arg2 => null,
                                                     Arg3 => System.Null_Address);
   end Initialize;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out General_Context) is
   begin
      Object.Impl := Pcre2_General_Context_Copy_8 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out General_Context) is
   begin
      Pcre2_General_Context_Free_8 (Object.Impl);
   end Finalize;

   ----------------
   -- Initialize --
   ----------------
   function Create (From : General_Context'Class := Null_General_Context) return Compile_Context is
   begin
      return Ret : Compile_Context do
         Ret.Impl := Pcre2_Compile_Context_Create_8 (From.Impl);
      end return;
   end;


   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Compile_Context) is
   begin
      Object.Impl := Pcre2_Compile_Context_Copy_8 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Compile_Context) is
   begin
      Pcre2_Compile_Context_Free_8 (Object.Impl);
   end Finalize;


   function Match_Context_Create (From : General_Context'Class) return Match_Context is
   begin
      return Ret : Match_Context do
         Ret.Impl := Pcre2_Match_Context_Create_8 (From.Impl);
      end return;
   end;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Match_Context) is
   begin
      Object.Impl := Pcre2_Match_Context_Copy_8 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Match_Context) is
   begin
      Pcre2_Match_Context_Free_8 (Object.Impl);
   end Finalize;


   function Convert_Context_Create (From : General_Context'Class) return Convert_Context is
   begin
      return Ret : Convert_Context do
         Ret.Impl := Pcre2_Convert_Context_Create_8 (From.Impl);
      end return;
   end;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Convert_Context) is
   begin
      Object.Impl := Pcre2_Convert_Context_Copy_8 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Convert_Context) is
   begin
      Pcre2_Convert_Context_Free_8 (Object.Impl);
   end Finalize;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Object : in out Code) is
   begin
      null;
   end Initialize;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Code) is
   begin
      Object.Impl := Pcre2_Code_Copy_With_Tables_8 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Code) is
   begin
      Pcre2_Code_Free_8 (Object.Impl);
   end Finalize;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Match_Data) is
   begin
      raise Program_Error with "Unimplemented procedure Adjust";
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Match_Data) is
   begin
      pcre2_match_data_free_8 (Object.Impl);
   end Finalize;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Object : in out Jit_Stack) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Initialize unimplemented");
      raise Program_Error with "Unimplemented procedure Initialize";
   end Initialize;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Jit_Stack) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Adjust unimplemented");
      raise Program_Error with "Unimplemented procedure Adjust";
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Jit_Stack) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Finalize unimplemented");
      raise Program_Error with "Unimplemented procedure Finalize";
   end Finalize;

end Pcre.Matcher;
