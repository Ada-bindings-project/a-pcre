pragma Ada_2012;
package body Pcre.Matcher is
   procedure Retcode_2_Exception (Code : int ) is
   begin
      if Code /= 0 then
         raise Program_Error with Code'Img;
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

   Bsr_Type_Maping : array (Bsr_Type) of Unsigned := (ANYCRLF => PCRE2_BSR_ANYCRLF,
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
     (Arg1 : Compile_Context; Arg2 : unsigned_long)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Max_Pattern_Length_8 (Arg1.Impl, Arg2));
   end Set_Max_Pattern_Length;

   -----------------
   -- Set_Newline --
   -----------------
   NEW_LINE_MAP : constant array (NEW_LINE_TYPE) of Unsigned :=
                    (Cr => PCRE2_NEWLINE_CR,
                     Lf   => PCRE2_NEWLINE_LF,
                     Crlf    => PCRE2_NEWLINE_CRLF,
                     Anycrlf => PCRE2_NEWLINE_ANYCRLF,
                     Any     => PCRE2_NEWLINE_ANY,
                     Nul     => PCRE2_NEWLINE_NUL);
   procedure Set_Newline
     (Arg1 : Compile_Context; Arg2 : NEW_LINE_TYPE)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Newline_8 (Arg1.Impl, NEW_LINE_MAP(Arg2)));
   end Set_Newline;

   ---------------------------
   -- Set_Parens_Nest_Limit --
   ---------------------------

   procedure Set_Parens_Nest_Limit
     (Arg1 : Compile_Context; Arg2 : Positive)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Parens_Nest_Limit_8 (Arg1.Impl, UNSIGNED (Arg2)));
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
     (Arg1  : access Compile_Context;
      Guard : not null Recursion_Guard_Interface_Access)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Compile_Recursion_Guard_8 (Arg1.Impl, Arg2, Arg1.all'Address));
   end Set_Compile_Recursion_Guard;


   ---------------------
   -- Set_Glob_Escape --
   ---------------------

   procedure Set_Glob_Escape (Arg1 : access Convert_Context; Arg2 : Unsigned)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Glob_Escape unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Glob_Escape";
   end Set_Glob_Escape;

   ------------------------
   -- Set_Glob_Separator --
   ------------------------

   procedure Set_Glob_Separator
     (Arg1 : access Convert_Context; Arg2 : Unsigned)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Glob_Separator unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Glob_Separator";
   end Set_Glob_Separator;

   ---------------------
   -- Pattern_Convert --
   ---------------------

   function Pattern_Convert
     (Arg1 : access Character; Arg2 : unsigned_long; Arg3 : Unsigned;
      Arg4 : System.Address; Arg5 : access unsigned_long;
      Arg6 : access Convert_Context) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Pattern_Convert unimplemented");
      return raise Program_Error with "Unimplemented function Pattern_Convert";
   end Pattern_Convert;

   ----------------------------
   -- Converted_Pattern_Free --
   ----------------------------

   procedure Converted_Pattern_Free (Arg1 : access Character) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Converted_Pattern_Free unimplemented");
      raise Program_Error
        with "Unimplemented procedure Converted_Pattern_Free";
   end Converted_Pattern_Free;

   ------------------------
   -- Match_Context_Copy --
   ------------------------

   function Match_Context_Copy
     (Arg1 : access Match_Context) return access Match_Context
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Match_Context_Copy unimplemented");
      return
        raise Program_Error with "Unimplemented function Match_Context_Copy";
   end Match_Context_Copy;

   --------------------------
   -- Match_Context_Create --
   --------------------------

   function Match_Context_Create
     (Arg1 : access General_Context) return access Match_Context'Class
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Match_Context_Create unimplemented");
      return
        raise Program_Error with "Unimplemented function Match_Context_Create";
   end Match_Context_Create;

   ------------------------
   -- Match_Context_Free --
   ------------------------

   procedure Match_Context_Free (Arg1 : access Match_Context) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Match_Context_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Match_Context_Free";
   end Match_Context_Free;

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
      pragma Compile_Time_Warning (Standard.True, "Set_Callout unimplemented");
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
      pragma Compile_Time_Warning
        (Standard.True, "Set_Substitute_Callout unimplemented");
      raise Program_Error
        with "Unimplemented procedure Set_Substitute_Callout";
   end Set_Substitute_Callout;

   ---------------------
   -- Set_Depth_Limit --
   ---------------------

   procedure Set_Depth_Limit (Arg1 : access Match_Context; Arg2 : Unsigned) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Depth_Limit unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Depth_Limit";
   end Set_Depth_Limit;

   --------------------
   -- Set_Heap_Limit --
   --------------------

   procedure Set_Heap_Limit (Arg1 : access Match_Context; Arg2 : Unsigned) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Heap_Limit unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Heap_Limit";
   end Set_Heap_Limit;

   ---------------------
   -- Set_Match_Limit --
   ---------------------

   procedure Set_Match_Limit (Arg1 : access Match_Context; Arg2 : Unsigned) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Match_Limit unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Match_Limit";
   end Set_Match_Limit;

   ----------------------
   -- Set_Offset_Limit --
   ----------------------

   procedure Set_Offset_Limit
     (Arg1 : access Match_Context; Arg2 : unsigned_long)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Offset_Limit unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Offset_Limit";
   end Set_Offset_Limit;

   -------------------------
   -- Set_Recursion_Limit --
   -------------------------

   procedure Set_Recursion_Limit (Arg1 : access Match_Context; Arg2 : Unsigned)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Recursion_Limit unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Recursion_Limit";
   end Set_Recursion_Limit;

   -------------------------------------
   -- Set_Recursion_Memory_Management --
   -------------------------------------

   procedure Set_Recursion_Memory_Management
     (Arg1 : access Match_Context;
      Arg2 : access function
        (Arg1 : unsigned_long; Arg2 : System.Address) return System.Address;
      Arg3 : access procedure (Arg1 : System.Address; Arg2 : System.Address);
      Arg4 : System.Address)
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Recursion_Memory_Management unimplemented");
      raise Program_Error
        with "Unimplemented procedure Set_Recursion_Memory_Management";
   end Set_Recursion_Memory_Management;

   -------------
   -- Compile --
   -------------

   function Compile
     (Arg1 : access Character; Arg2 : unsigned_long; Arg3 : Unsigned;
      Arg4 : access int; Arg5 : access unsigned_long;
      Arg6 : access Compile_Context) return access Code'Class
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Compile unimplemented");
      return raise Program_Error with "Unimplemented function Compile";
   end Compile;

   ---------------
   -- Code_Free --
   ---------------

   procedure Code_Free (Arg1 : access Code) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Code_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Code_Free";
   end Code_Free;

   ---------------
   -- Code_Copy --
   ---------------

   function Code_Copy (Arg1 : access constant Code) return access Code is
   begin
      pragma Compile_Time_Warning (Standard.True, "Code_Copy unimplemented");
      return raise Program_Error with "Unimplemented function Code_Copy";
   end Code_Copy;

   ---------------------------
   -- Code_Copy_With_Tables --
   ---------------------------

   function Code_Copy_With_Tables
     (Arg1 : access constant Code) return access Code
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Code_Copy_With_Tables unimplemented");
      return
        raise Program_Error
          with "Unimplemented function Code_Copy_With_Tables";
   end Code_Copy_With_Tables;

   ------------------
   -- Pattern_Info --
   ------------------

   function Pattern_Info
     (Arg1 : access constant Code; Arg2 : Unsigned; Arg3 : System.Address)
      return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Pattern_Info unimplemented");
      return raise Program_Error with "Unimplemented function Pattern_Info";
   end Pattern_Info;

   -----------------------
   -- Callout_Enumerate --
   -----------------------

   function Callout_Enumerate
     (Arg1 : access constant Code;
      Arg2 : access function
        (Arg1 : access Callout_Enumerate_Block; Arg2 : System.Address)
         return int;
      Arg3 : System.Address) return int
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Callout_Enumerate unimplemented");
      return
        raise Program_Error with "Unimplemented function Callout_Enumerate";
   end Callout_Enumerate;

   -----------------------
   -- Match_Data_Create --
   -----------------------

   function Match_Data_Create
     (Arg1 : Unsigned; Arg2 : access General_Context)
      return access Match_Data'Class
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Match_Data_Create unimplemented");
      return
        raise Program_Error with "Unimplemented function Match_Data_Create";
   end Match_Data_Create;

   ------------------------------------
   -- Match_Data_Create_From_Pattern --
   ------------------------------------

   function Match_Data_Create_From_Pattern
     (Arg1 : access constant Code; Arg2 : access General_Context'Class)
      return access Match_Data'Class
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Match_Data_Create_From_Pattern unimplemented");
      return
        raise Program_Error
          with "Unimplemented function Match_Data_Create_From_Pattern";
   end Match_Data_Create_From_Pattern;

   ---------------
   -- Dfa_Match --
   ---------------

   function Dfa_Match
     (Arg1 : access constant Code; Arg2 : access Character;
      Arg3 : unsigned_long; Arg4 : unsigned_long; Arg5 : Unsigned;
      Arg6 : access Match_Data'Class; Arg7 : access Match_Context'Class;
      Arg8 : access int; Arg9 : unsigned_long) return int
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Dfa_Match unimplemented");
      return raise Program_Error with "Unimplemented function Dfa_Match";
   end Dfa_Match;

   -----------
   -- Match --
   -----------

   function Match
     (Arg1 : access constant Code; Arg2 : access Character;
      Arg3 : unsigned_long; Arg4 : unsigned_long; Arg5 : Unsigned;
      Arg6 : access Match_Data'Class; Arg7 : access Match_Context'Class)
      return int
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Match unimplemented");
      return raise Program_Error with "Unimplemented function Match";
   end Match;

   ---------------------
   -- Match_Data_Free --
   ---------------------

   procedure Match_Data_Free (Arg1 : access Match_Data) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Match_Data_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Match_Data_Free";
   end Match_Data_Free;

   --------------
   -- Get_Mark --
   --------------

   function Get_Mark (Arg1 : access Match_Data) return access Character is
   begin
      pragma Compile_Time_Warning (Standard.True, "Get_Mark unimplemented");
      return raise Program_Error with "Unimplemented function Get_Mark";
   end Get_Mark;

   -------------------------
   -- Get_Match_Data_Size --
   -------------------------

   function Get_Match_Data_Size (Arg1 : access Match_Data) return unsigned_long
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Match_Data_Size unimplemented");
      return
        raise Program_Error with "Unimplemented function Get_Match_Data_Size";
   end Get_Match_Data_Size;

   -----------------------
   -- Get_Ovector_Count --
   -----------------------

   function Get_Ovector_Count (Arg1 : access Match_Data) return Unsigned is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Ovector_Count unimplemented");
      return
        raise Program_Error with "Unimplemented function Get_Ovector_Count";
   end Get_Ovector_Count;

   -------------------------
   -- Get_Ovector_Pointer --
   -------------------------

   function Get_Ovector_Pointer
     (Arg1 : access Match_Data) return access unsigned_long
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

   function Get_Startchar (Arg1 : access Match_Data) return unsigned_long is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Startchar unimplemented");
      return raise Program_Error with "Unimplemented function Get_Startchar";
   end Get_Startchar;

   ---------------------------
   -- Substring_Copy_Byname --
   ---------------------------

   function Substring_Copy_Byname
     (Arg1 : access Match_Data; Arg2 : access Character;
      Arg3 : access Character; Arg4 : access unsigned_long) return int
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
      Object.Impl := pcre2_general_context_copy_8 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out General_Context) is
   begin
      pcre2_general_context_free_8 (Object.Impl);
   end Finalize;

   ----------------
   -- Initialize --
   ----------------
   function Create (From : General_Context'Class) return Compile_Context is
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
      pragma Compile_Time_Warning (Standard.True, "Adjust unimplemented");
      raise Program_Error with "Unimplemented procedure Adjust";
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Code) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Finalize unimplemented");
      raise Program_Error with "Unimplemented procedure Finalize";
   end Finalize;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Object : in out Match_Data) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Initialize unimplemented");
      raise Program_Error with "Unimplemented procedure Initialize";
   end Initialize;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Match_Data) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Adjust unimplemented");
      raise Program_Error with "Unimplemented procedure Adjust";
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Match_Data) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Finalize unimplemented");
      raise Program_Error with "Unimplemented procedure Finalize";
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
