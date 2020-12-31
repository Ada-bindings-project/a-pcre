--  Do not edit!
--   This file is generated from: pcre-matcher.adb

pragma Ada_2012;
with Ada.Unchecked_Conversion;
with Pcre.Low_Level.Linker_Options_16;
package body Pcre.Wide_Matcher is
   function As_PCRE2_SPTR16 is new Ada.Unchecked_Conversion (System.Address, PCRE2_SPTR16);

   function Get_Error_Message (Code : int) return Wide_String is
      Ret    : int;
      Buffer : Wide_String (1 .. 1024);
   begin
      Ret := Pcre2_Get_Error_Message_16 (Code, As_PCRE2_SPTR16 (Buffer'Address), Buffer'Length);
      return Buffer (Buffer'First .. Natural (Ret));
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
   procedure Set (Context : Compile_Context; Bsr : Bsr_Type)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Bsr_16 (Context.Impl, Bsr_Type_Maping (Bsr)));
   end Set;

   --------------------------
   -- Set_Wide_Character_Tables --
   --------------------------

   procedure Set_Wide_Character_Tables
     (Context : Compile_Context; To : Wide_Character_Tables)
   is
      Data : aliased Unsigned_Char with Address => To.all'Address;
   begin
      Retcode_2_Exception (Pcre2_Set_Character_Tables_16 (Context.Impl, To));
   end Set_Wide_Character_Tables;

   -------------------------------
   -- Set_Compile_Extra_Options --
   -------------------------------

   procedure Set_Compile_Extra_Options
     (Context : Compile_Context; Options : Extra_Options)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Compile_Extra_Options_16 (Context.Impl, Unsigned (Options)));
   end Set_Compile_Extra_Options;

   ----------------------------
   -- Set_Max_Pattern_Length --
   ----------------------------

   procedure Set_Max_Pattern_Length
     (Context : Compile_Context; Length : Natural)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Max_Pattern_Length_16 (Context.Impl, unsigned_long (Length)));
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
      Retcode_2_Exception (Pcre2_Set_Newline_16 (Context.Impl, NEW_LINE_MAP (Arg2)));
   end Set_Newline;

   ---------------------------
   -- Set_Parens_Nest_Limit --
   ---------------------------

   procedure Set_Parens_Nest_Limit
     (Context : Compile_Context; Limit : Positive)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Parens_Nest_Limit_16 (Context.Impl, UNSIGNED (Limit)));
   end Set_Parens_Nest_Limit;

   ---------------------------------
   -- Set_Compile_Recursion_Guard --
   ---------------------------------
   function Compile_Recursion_Guard (Arg1 : Unsigned; Arg2 : System.Address) return int is
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
      --  Retcode_2_Exception (Pcre2_Set_Compile_Recursion_Guard_16 (Arg1.Impl, Arg2, Arg1.all'Address));
   end Set_Compile_Recursion_Guard;


   ---------------------
   -- Set_Glob_Escape --
   ---------------------

   procedure Set_Glob_Escape (Context : Convert_Context; Escape_Wide_Character : Wide_Character)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Glob_Escape_16 (Context.Impl, Wide_Character'Pos (Escape_Wide_Character)));
   end Set_Glob_Escape;

   ------------------------
   -- Set_Glob_Separator --
   ------------------------

   procedure Set_Glob_Separator
     (Context : Convert_Context; Separator : Glob_Separator)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Glob_Separator_16 (Context.Impl, Glob_Separator'Pos (Separator)));
   end Set_Glob_Separator;

   ---------------------
   -- Pattern_Convert --
   ---------------------

   procedure Pattern_Convert
     (Pattern   : Wide_String;
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

   procedure Converted_Pattern_Free (Arg1 : access Wide_Character) is
   begin
      --  pragma Compile_Time_Warning(Standard.True, "Converted_Pattern_Free unimplemented");
      raise Program_Error with "Unimplemented procedure Converted_Pattern_Free";
   end Converted_Pattern_Free;



   -----------------
   -- Set_Callout --
   -----------------

   procedure Set_Callout
     (Context : access Match_Context;
      Arg2    : access function (Arg1 : access Callout_Block; Arg2 : System.Address) return int;
      Arg3    : System.Address)
   is
   begin
      raise Program_Error with "Unimplemented procedure Set_Callout";
   end Set_Callout;

   ----------------------------
   -- Set_Substitute_Callout --
   ----------------------------

   procedure Set_Substitute_Callout
     (Context : access Match_Context;
      Arg2    : access function (Arg1 : access Substitute_Callout_Block; Arg2 : System.Address) return int;
      Arg3    : System.Address)
   is
   begin
      raise Program_Error with "Unimplemented procedure Set_Substitute_Callout";
   end Set_Substitute_Callout;

   ---------------------
   -- Set_Depth_Limit --
   ---------------------

   procedure Set_Depth_Limit (Context : Match_Context; value : Natural) is
   begin
      Retcode_2_Exception (Pcre2_Set_Depth_Limit_16 (Context.Impl, Unsigned (value)));
   end Set_Depth_Limit;

   --------------------
   -- Set_Heap_Limit --
   --------------------

   procedure Set_Heap_Limit (Context : access Match_Context; Limit : System.Storage_Elements.Storage_Count) is
   begin
      Retcode_2_Exception (Pcre2_Set_Heap_Limit_16 (Context.Impl, Unsigned (Limit)));
   end Set_Heap_Limit;

   ---------------------
   -- Set_Match_Limit --
   ---------------------

   procedure Set_Match_Limit (Context : access Match_Context; Limit : Natural) is
   begin
      Retcode_2_Exception (Pcre2_Set_Match_Limit_16 (Context.Impl, Unsigned (Limit)));
   end Set_Match_Limit;

   ----------------------
   -- Set_Offset_Limit --
   ----------------------

   procedure Set_Offset_Limit
     (Context : access Match_Context; Limit : Natural)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Offset_Limit_16 (Context.Impl, unsigned_long (Limit)));
   end Set_Offset_Limit;

   -------------------------
   -- Set_Recursion_Limit --
   -------------------------

   procedure Set_Recursion_Limit (Arg1 : access Match_Context; Arg2 : Natural)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Recursion_Limit_16 (Arg1.Impl, Unsigned (Arg2)));
   end Set_Recursion_Limit;

   -------------------------------------
   -- Set_Recursion_Memory_Management --
   -------------------------------------

   procedure Set_Recursion_Memory_Management
     (Context : access Match_Context;
      Arg2    : access function (Arg1 : unsigned_long; Arg2 : System.Address) return System.Address;
      Arg3    : access procedure (Arg1 : System.Address; Arg2 : System.Address);
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
     (Pattern : Wide_String;           --  A string containing expression to be compiled
      Options : Compile_Options := Null_Compile_Options;
      Context : Compile_Context'Class := Null_Compile_Context) return Code
   is
      Errocode    : aliased int;
      Erroroffset : aliased unsigned_long;
   begin
      return Ret : Code do
         Ret.Impl := Pcre2_Compile_16 (As_PCRE2_SPTR16 (Pattern (Pattern'First)'Address),
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

   procedure Compile (Into : in out Code;
                      Pattern : Wide_String;
                      Options : Compile_Options := Null_Compile_Options;
                      Context : Compile_Context'Class := Null_Compile_Context) is
      Errocode    : aliased int;
      Erroroffset : aliased unsigned_long;
   begin
      Finalize (Into);
      Into.Impl := Pcre2_Compile_16 (As_PCRE2_SPTR16 (Pattern (Pattern'First)'Address),
                                    Pattern'Length,
                                    Unsigned (Options),
                                    Errocode'Access,
                                    Erroroffset'Access,
                                    Context.Impl);

      if Errocode /= 0 then
         Retcode_2_Exception (Errocode);
      end if;

   end;

   ------------------
   -- Pattern_Info --
   ------------------

   function Pattern_Info
     (Arg1 : Code;
      What : Unsigned;
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
   procedure Initialize (Match_Data : in out Pcre.Wide_Matcher.Match_Data;
                         Size       : Positive;
                         Context    : General_Context'Class := Null_General_Context)is
   begin
      Match_Data.Impl := Pcre2_Match_Data_Create_16 (Unsigned (Size), Context.Impl);
   end;

   function Create
     (Size    : Positive;
      Context : General_Context'Class := Null_General_Context) return Match_Data
   is
   begin
      return Ret : Match_Data do
         Ret.Impl := Pcre2_Match_Data_Create_16 (Unsigned (Size), Context.Impl);
      end return;
   end Create;

   ------------------------------------
   -- Match_Data_Create_From_Pattern --
   ------------------------------------

   function Create
     (Code    : Pcre.Wide_Matcher.Code'Class;
      Context : General_Context'Class := Null_General_Context) return Match_Data
   is
   begin
      return Ret : Match_Data do
         Ret.Impl := Pcre2_Match_Data_Create_From_Pattern_16 (Code.Impl, Context.Impl);
      end return;
   end Create;

   procedure Initialize (Match_Data : in out Pcre.Wide_Matcher.Match_Data;
                         Code       : Pcre.Wide_Matcher.Code'Class;
                         Context    : General_Context'Class := Null_General_Context)is
   begin
      Match_Data.Impl := Pcre2_Match_Data_Create_From_Pattern_16 (Code.Impl, Context.Impl);
   end;

   ---------------
   -- Dfa_Match --
   ---------------

   function Match
     (Code        : Pcre.Wide_Matcher.Code;
      Subject     : Wide_String;
      Startoffset : Natural;
      Options     : Match_Options;
      Match_Data  : out Pcre.Wide_Matcher.Match_Data'Class;
      Context     : Pcre.Wide_Matcher.Match_Context'Class := Null_Match_Context;
      Workspace   : Workspace_Type) return Integer
   is
      Ret : int;
   begin
      if Match_Data.Impl = null then
         Match_Data.Initialize (Code);
      end if;
      Ret := Pcre2_Dfa_Match_16 (Code.Impl,
                                As_PCRE2_SPTR16 (Subject'Address),
                                Subject'Length,
                                unsigned_long (Startoffset),
                                Unsigned (Options),
                                Match_Data.Impl,
                                Context.Impl,
                                Workspace.Data (Workspace.Data'First)'Unrestricted_Access,
                                Workspace.Data'Length);
      if Ret <= -1 then
         Retcode_2_Exception (Ret);
      end if;
      return Integer (Ret);
   end Match;

   -----------
   -- Match --
   -----------


   function Match
     (Code        : Pcre.Wide_Matcher.Code;
      Subject     : Wide_String;
      Startoffset : Natural := 0;
      Options     : Match_Options := Null_Match_Options;
      Match_Data  : in out Pcre.Wide_Matcher.Match_Data'Class;
      Context     : Match_Context'Class := Null_Match_Context) return Integer
   is
      Ret : int;
   begin
      if Match_Data.Impl = null then
         Match_Data.Initialize (Code);
      end if;
      Ret := Pcre2_Match_16 (Code.Impl,
                            As_PCRE2_SPTR16 (Subject'Address),
                            Subject'Length,
                            unsigned_long (Startoffset),
                            Unsigned (Options),
                            Match_Data.Impl,
                            Context.Impl);
      if Ret <= -1 then
         Retcode_2_Exception (Ret);
      end if;
      return Integer (Ret);
   end Match;

   --------------
   -- Get_Mark --
   --------------

   function Get_Mark (Match_Data : Pcre.Wide_Matcher.Match_Data) return access Wide_Character is
   begin
      return raise Program_Error with "Unimplemented function Get_Mark";
   end Get_Mark;

   -------------------------
   -- Get_Match_Data_Size --
   -------------------------

   function Get_Size (Match_Data : Pcre.Wide_Matcher.Match_Data) return Natural
   is
   begin
      return Natural (Pcre2_Get_Match_Data_Size_16 (Match_Data.Impl));
   end Get_Size;

   -----------------------
   -- Get_Ovector_Count --
   -----------------------

   function Get_Ovector_Count (Match_Data : Pcre.Wide_Matcher.Match_Data) return Natural is
   begin
      return Natural (Pcre2_Get_Ovector_Count_16 (Match_Data.Impl));
   end Get_Ovector_Count;

   -------------------------
   -- Get_Ovector_Pointer --
   -------------------------

   function Get_Ovector_Pointer
     (Match_Data : Pcre.Wide_Matcher.Match_Data) return access unsigned_long
   is
   begin
      return
      raise Program_Error with "Unimplemented function Get_Ovector_Pointer";
   end Get_Ovector_Pointer;

   -------------------
   -- Get_Startchar --
   -------------------

   function Get_Startchar (Match_Data : Pcre.Wide_Matcher.Match_Data) return unsigned_long is
   begin
      return raise Program_Error with "Unimplemented function Get_Startchar";
   end Get_Startchar;

   ---------------------------
   -- Substring_Copy_Byname --
   ---------------------------

   procedure Substring
     (Match_Data : Pcre.Wide_Matcher.Match_Data;
      Name       : Wide_String;
      Buffer     : out Wide_String;
      Last       : out Natural)
   is
      L_Buffer : aliased PCRE2_UCHAR16 with Import => True , Address => Buffer'Address;
      L_Last   : aliased unsigned_long := Buffer'Length;
   begin
      Retcode_2_Exception (Pcre2_Substring_Copy_Byname_16 (Match_Data.Impl,
                           Arg2 => As_PCRE2_SPTR16 (Name'Address),
                           Arg3 => L_Buffer'Access,
                           Arg4 => L_Last'Access));
      Last := Natural (L_Last) + Buffer'First - 1;
   end Substring;

   function Substring
     (Match_Data : Pcre.Wide_Matcher.Match_Data;
      Name       : Wide_String) return Wide_String is
      Buffer : Wide_String (1 .. 1024);
      Last   : Natural;
   begin
      Match_Data.Substring (Name, Buffer, Last);
      return Buffer (Buffer'First .. Last);
   end Substring;


   -----------------------------
   -- Substring_Copy_Bynumber --
   -----------------------------

   procedure Substring
     (Match_Data : Pcre.Wide_Matcher.Match_Data;
      Number     : Natural;
      Buffer     : out Wide_String;
      Last       : out Natural)
   is
      L_Buffer : aliased PCRE2_UCHAR16 with Import => True , Address => Buffer'Address;
      L_Last   : aliased unsigned_long := Buffer'Length;
   begin
      Retcode_2_Exception (pcre2_substring_copy_bynumber_16 (Match_Data.Impl,
                           Arg2 => Unsigned (Number),
                           Arg3 => L_Buffer'Access,
                           Arg4 => L_Last'Access));
      Last := Natural (L_Last) + Buffer'First - 1;
   end Substring;

   function Substring
     (Match_Data : Pcre.Wide_Matcher.Match_Data;
      Number     : Natural) return Wide_String  is
      Buffer : Wide_String (1 .. 1024);
      Last   : Natural;
   begin
      Match_Data.Substring (Number, Buffer, Last);
      return Buffer (Buffer'First .. Last);
   end Substring;
   function Constant_Indexing (Self : Match_Data ; Index : Natural) return Wide_String is
   begin
      return Self.Substring (Index);
   end;

   --------------------
   -- Substring_Free --
   --------------------

   procedure Substring_Free (Arg1 : access Wide_Character) is
   begin
      raise Program_Error with "Unimplemented procedure Substring_Free";
   end Substring_Free;

   -----------------------------
   -- Substring_Length_Byname --
   -----------------------------

   function Substring_Length
     (Match_Data : Pcre.Wide_Matcher.Match_Data;
      Name       : Wide_String) return Natural
   is
      Ret : aliased unsigned_long;
   begin
      Retcode_2_Exception (Pcre2_Substring_Length_Byname_16 (Match_Data.Impl,
                           As_PCRE2_SPTR16 (Name'Address),
                           Ret'Access));
      return Natural (Ret);
   end Substring_Length;

   -------------------------------
   -- Substring_Length_Bynumber --
   -------------------------------

   function Substring_Length
     (Match_Data : Pcre.Wide_Matcher.Match_Data;
      Number     : Natural) return Natural
   is
      Ret : aliased unsigned_long;
   begin
      Retcode_2_Exception (pcre2_substring_length_bynumber_16 (Match_Data.Impl,
                           Unsigned (Number),
                           Ret'Access));
      return Natural (Ret);
   end Substring_Length;

   ------------------------------
   -- Substring_Nametable_Scan --
   ------------------------------

   procedure Substring_Nametable_Scan
     (Code  : Pcre.Wide_Matcher.Code;
      Name  : Wide_String;
      First : System.Address;
      Last  : System.Address)
   is
      Ret  : Interfaces.C.int;

   begin
      Ret := Pcre2_Substring_Nametable_Scan_16 (Code.Impl,
                                               As_PCRE2_SPTR16 (Name'Address),
                                               First, Last);
      Retcode_2_Exception (Ret);
   end Substring_Nametable_Scan;

   --------------------------------
   -- Substring_Number_From_Name --
   --------------------------------

   function Number_From_Name
     (Code  : Pcre.Wide_Matcher.Code; Name  : Wide_String) return Natural
   is
      Ret : int;
   begin
      Ret := Pcre2_Substring_Number_From_Name_16 (Code.Impl,
                                                 As_PCRE2_SPTR16 (Name'Address));
      return Natural (Ret);
   end Number_From_Name;

   -------------------------
   -- Substring_List_Free --
   -------------------------

   procedure Substring_List_Free (Arg1 : System.Address) is
   begin
      raise Program_Error with "Unimplemented procedure Substring_List_Free";
   end Substring_List_Free;

   ------------------------
   -- Substring_List_Get --
   ------------------------
   function Substring_List_Get
     (Match_Data : Pcre.Wide_Matcher.Match_Data;
      Arg2       : System.Address;
      Arg3       : System.Address) return int
   is
   begin
      return
      raise Program_Error with "Unimplemented function Substring_List_Get";
   end Substring_List_Get;

   function Get (Match_Data : Pcre.Wide_Matcher.Match_Data'Class) return Substring_List is
   begin
      return Ret : Substring_List do
         null;
      end return;
   end;

   ----------------------
   -- Serialize_Encode --
   ----------------------

   function Serialize_Encode
     (codes : System.Address;
      Arg2 : int;
      Arg3 : System.Address;
      Arg4 : access unsigned_long;
      Context : access General_Context) return int
   is
   begin
      return
      raise Program_Error with "Unimplemented function Serialize_Encode";
   end Serialize_Encode;

   ----------------------
   -- Serialize_Decode --
   ----------------------

   function Serialize_Decode
     (Arg1 : System.Address; Arg2 : int; Arg3 : access Wide_Character;
      Arg4 : access General_Context) return int
   is
   begin
      return
      raise Program_Error with "Unimplemented function Serialize_Decode";
   end Serialize_Decode;

   -----------------------------------
   -- Serialize_Get_Number_Of_Codes --
   -----------------------------------

   function Serialize_Get_Number_Of_Codes (Arg1 : access Wide_Character) return int
   is
   begin
      return
      raise Program_Error
        with "Unimplemented function Serialize_Get_Number_Of_Codes";
   end Serialize_Get_Number_Of_Codes;

   --------------------
   -- Serialize_Free --
   --------------------

   procedure Serialize_Free (Arg1 : access Wide_Character) is
   begin
      raise Program_Error with "Unimplemented procedure Serialize_Free";
   end Serialize_Free;

   ----------------
   -- Substitute --
   ----------------

   procedure Substitute
     (Arg1       : access constant Code;
      Arg2       : access Wide_Character;
      Arg3       : unsigned_long;
      Arg4       : unsigned_long;
      Arg5       : Unsigned;
      Match_Data : Pcre.Wide_Matcher.Match_Data'Class;
      Arg7       : access Match_Context'Class;
      Arg8       : access Wide_Character;
      Arg9       : unsigned_long;
      Arg10      : access Wide_Character;
      Arg11      : access unsigned_long)
   is
   begin
      raise Program_Error with "Unimplemented procedure Substitute";
   end Substitute;

   -----------------
   -- Jit_Compile --
   -----------------

   procedure Jit_Compile (Arg1 : access Code; Arg2 : Unsigned) is
   begin
      raise Program_Error with "Unimplemented procedure Jit_Compile";
   end Jit_Compile;

   ---------------
   -- Jit_Match --
   ---------------

   function Jit_Match
     (Arg1 : access constant Code; Arg2 : access Wide_Character;
      Arg3 : unsigned_long; Arg4 : unsigned_long; Arg5 : Unsigned;
      Arg6 : access Match_Data'Class; Arg7 : access Match_Context'Class)
      return int
   is
   begin
      return raise Program_Error with "Unimplemented function Jit_Match";
   end Jit_Match;

   ----------------------------
   -- Jit_Free_Unused_Memory --
   ----------------------------

   procedure Jit_Free_Unused_Memory (Arg1 : access General_Context) is
   begin
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
      raise Program_Error with "Unimplemented procedure Jit_Stack_Assign";
   end Jit_Stack_Assign;

   --------------------
   -- Jit_Stack_Free --
   --------------------

   procedure Jit_Stack_Free (Arg1 : access Jit_Stack) is
   begin
      raise Program_Error with "Unimplemented procedure Jit_Stack_Free";
   end Jit_Stack_Free;

   ----------------
   -- Maketables --
   ----------------

   function Maketables (Context :  General_Context) return Wide_Character_Tables
   is
   begin
      return raise Program_Error with "Unimplemented function Maketables";
   end Maketables;

   ---------------------
   -- Maketables_Free --
   ---------------------

   procedure Maketables_Free
     (Context :  General_Context; Tables : Wide_Character_Tables)
   is
   begin
      raise Program_Error with "Unimplemented procedure Maketables_Free";
   end Maketables_Free;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Object : in out General_Context) is
   begin
      Object.Impl := Pcre2_General_Context_Create_16 (Arg1 => null,
                                                     Arg2 => null,
                                                     Arg3 => System.Null_Address);
   end Initialize;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out General_Context) is
   begin
      Object.Impl := Pcre2_General_Context_Copy_16 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out General_Context) is
   begin
      if Object.Impl /= null then
         Pcre2_General_Context_Free_16 (Object.Impl);
         Object.Impl := null;
      end if;
   end Finalize;

   ----------------
   -- Initialize --
   ----------------
   function Create (From : General_Context'Class := Null_General_Context) return Compile_Context is
   begin
      return Ret : Compile_Context do
         Ret.Impl := Pcre2_Compile_Context_Create_16 (From.Impl);
      end return;
   end;


   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Compile_Context) is
   begin
      Object.Impl := Pcre2_Compile_Context_Copy_16 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Compile_Context) is
   begin
      if Object.Impl /= null then
         Pcre2_Compile_Context_Free_16 (Object.Impl);
         Object.Impl := null;
      end if;
   end Finalize;


   function Match_Context_Create (From : General_Context'Class) return Match_Context is
   begin
      return Ret : Match_Context do
         Ret.Impl := Pcre2_Match_Context_Create_16 (From.Impl);
      end return;
   end;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Match_Context) is
   begin
      Object.Impl := Pcre2_Match_Context_Copy_16 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Match_Context) is
   begin
      if Object.Impl /= null then
         Pcre2_Match_Context_Free_16 (Object.Impl);
         Object.Impl := null;
      end if;
   end Finalize;


   function Convert_Context_Create (From : General_Context'Class) return Convert_Context is
   begin
      return Ret : Convert_Context do
         Ret.Impl := Pcre2_Convert_Context_Create_16 (From.Impl);
      end return;
   end;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Convert_Context) is
   begin
      Object.Impl := Pcre2_Convert_Context_Copy_16 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Convert_Context) is
   begin
      if Object.Impl /= null then
         Pcre2_Convert_Context_Free_16 (Object.Impl);
         Object.Impl := null;
      end if;
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
      Object.Impl := Pcre2_Code_Copy_With_Tables_16 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Code) is
   begin
      if Object.Impl /= null then
         Pcre2_Code_Free_16 (Object.Impl);
         Object.Impl := null;
      end if;
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
      if Object.Impl /= null then
         Pcre2_Match_Data_Free_16 (Object.Impl);
         Object.Impl := null;
      end if;
   end Finalize;

   ----------------
   -- Initialize --
   ----------------

   procedure Initialize (Object : in out Jit_Stack) is
   begin
      raise Program_Error with "Unimplemented procedure Initialize";
   end Initialize;

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Object : in out Jit_Stack) is
   begin
      raise Program_Error with "Unimplemented procedure Adjust";
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Jit_Stack) is
   begin
      raise Program_Error with "Unimplemented procedure Finalize";
   end Finalize;

   function Length (Self : Match_Data) return Natural is
   begin
      return Get_Ovector_Count (Self);
   end;

   procedure Read (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : out Code; Context : General_Context'Class) is
   begin
      null;
   end;

   procedure Read (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : out Code) is
   begin
      Read (S, Item, Null_General_Context);
   end;

   procedure Write (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : in Code) is
   begin
      Write (S, Item, Null_General_Context);
   end;

   procedure Write (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : in Code; Context : General_Context'Class) is
   begin
      null;
   end;

   procedure Finalize   (Object : in out Substring_List) is
   begin
      pcre2_substring_list_free_16 (Object.Listptr);
      Pcre2_Substring_List_Free_16 (Object.Lengthsptr);
      Object.Listptr := System.Null_Address;
      Object.Lengthsptr := System.Null_Address;
   end;

end Pcre.Wide_Matcher;
