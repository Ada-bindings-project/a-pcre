pragma Ada_2012;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;
with Pcre.Low_Level.Linker_Options_8;
package body Pcre.Matcher is
   function As_PCRE2_SPTR8 is new Ada.Unchecked_Conversion (System.Address, PCRE2_SPTR8);

   function Get_Error_Message (Code : int) return String is
      Ret    : int;
      Buffer : String (1 .. 1024);
   begin
      Ret := Pcre2_Get_Error_Message_8 (Code, As_PCRE2_SPTR8 (Buffer'Address), Buffer'Length);
      return Buffer (Buffer'First .. Natural (Ret));
   end;

   ------------
   -- Config --
   ------------

   function Config (What : Config_Settings) return Config_Type is
      Dummy : int;
   begin
      return Ret : Config_Type (What, Natural (Pcre2_Config_8 (Unsigned (What), System.Null_Address))) do
         Dummy := Pcre2_Config_8 (Unsigned (What), (case What is
                                     when CONFIG_BSR                     => Ret.BSR'Address,
                                     when CONFIG_COMPILED_WIDTHS         => Ret.COMPILED_WIDTHS'Address,
                                     when CONFIG_DEPTHLIMIT              => Ret.DEPTHLIMIT'Address,
                                     when CONFIG_HEAPLIMIT               => Ret.HEAPLIMIT'Address,
                                     when CONFIG_JIT                     => Ret.JIT'Address,
                                     when CONFIG_JITTARGET               => Ret.JITTARGET'Address,
                                     when CONFIG_LINKSIZE                => Ret.LINKSIZE'Address,
                                     when CONFIG_MATCHLIMIT              => Ret.MATCHLIMIT'Address,
                                     when CONFIG_NEVER_BACKSLASH_C       => Ret.NEVER_BACKSLASH_C'Address,
                                     when CONFIG_NEWLINE                 => Ret.NEWLINE'Address,
                                     when CONFIG_UNICODE                 => Ret.UNICODE'Address,
                                     when CONFIG_UNICODE_VERSION         => Ret.UNICODE_VERSION'Address,
                                     when CONFIG_VERSION                 => Ret.Version'Address,
                                     when others                         => System.Null_Address));
      end return;
   end;

   -------------
   -- Set_Bsr --
   -------------

   Bsr_Type_Maping : constant array (Bsr_Type) of Unsigned := (ANYCRLF => PCRE2_BSR_ANYCRLF,
                                                               UNICODE => PCRE2_BSR_UNICODE);
   procedure Set (Context : Compile_Context; Bsr : Bsr_Type)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Bsr_8 (Context.Impl, Bsr_Type_Maping (Bsr)));
   end Set;

   --------------------------
   -- Set_Character_Tables --
   --------------------------

   procedure Set_Character_Tables
     (Context : Compile_Context; To : Character_Tables)
   is
      Data : aliased Unsigned_Char with Address => To.all'Address;
   begin
      Retcode_2_Exception (Pcre2_Set_Character_Tables_8 (Context.Impl, To));
   end Set_Character_Tables;

   -------------------------------
   -- Set_Compile_Extra_Options --
   -------------------------------

   procedure Set_Compile_Extra_Options
     (Context : Compile_Context; Options : Extra_Options)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Compile_Extra_Options_8 (Context.Impl, Unsigned (Options)));
   end Set_Compile_Extra_Options;

   ----------------------------
   -- Set_Max_Pattern_Length --
   ----------------------------

   procedure Set_Max_Pattern_Length
     (Context : Compile_Context; Length : Natural)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Max_Pattern_Length_8 (Context.Impl, unsigned_long (Length)));
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
     (Context : Compile_Context; Limit : Positive)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Parens_Nest_Limit_8 (Context.Impl, UNSIGNED (Limit)));
   end Set_Parens_Nest_Limit;

   ---------------------------------
   -- Set_Compile_Recursion_Guard --
   ---------------------------------
   function Compile_Recursion_Guard (Arg1 : Unsigned; Arg2 : System.Address) return int is
      pragma Unreferenced (Arg1, Arg2);
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

   procedure Set_Glob_Escape (Context : Convert_Context; Escape_Character : Character)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Glob_Escape_8 (Context.Impl, Character'Pos (Escape_Character)));
   end Set_Glob_Escape;

   ------------------------
   -- Set_Glob_Separator --
   ------------------------

   procedure Set_Glob_Separator
     (Context : Convert_Context; Separator : Glob_Separator)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Glob_Separator_8 (Context.Impl, Glob_Separator'Pos (Separator)));
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
     (Context             : Match_Context;
      Callout_Function    : access function (Arg1 : access Callout_Block; Callout_Data : System.Address) return int;
      Callout_Data        : System.Address)
   is
   begin
      raise Program_Error with "Unimplemented procedure Set_Callout";
   end Set_Callout;

   ----------------------------
   -- Set_Substitute_Callout --
   ----------------------------

   procedure Set_Substitute_Callout
     (Context             : Match_Context;
      Callout_Function    : access function (Arg1 : access Substitute_Callout_Block; Callout_Data : System.Address) return int;
      Callout_Data        : System.Address)
   is
   begin
      raise Program_Error with "Unimplemented procedure Set_Substitute_Callout";
   end Set_Substitute_Callout;

   ---------------------
   -- Set_Depth_Limit --
   ---------------------

   procedure Set_Depth_Limit (Context : Match_Context; Value : Natural) is
   begin
      Retcode_2_Exception (Pcre2_Set_Depth_Limit_8 (Context.Impl, Unsigned (Value)));
   end Set_Depth_Limit;

   --------------------
   -- Set_Heap_Limit --
   --------------------

   procedure Set_Heap_Limit (Context : access Match_Context; Limit : System.Storage_Elements.Storage_Count) is
   begin
      Retcode_2_Exception (Pcre2_Set_Heap_Limit_8 (Context.Impl, Unsigned (Limit)));
   end Set_Heap_Limit;

   ---------------------
   -- Set_Match_Limit --
   ---------------------

   procedure Set_Match_Limit (Context : access Match_Context; Limit : Natural) is
   begin
      Retcode_2_Exception (Pcre2_Set_Match_Limit_8 (Context.Impl, Unsigned (Limit)));
   end Set_Match_Limit;

   ----------------------
   -- Set_Offset_Limit --
   ----------------------

   procedure Set_Offset_Limit
     (Context : access Match_Context; Limit : Natural)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Offset_Limit_8 (Context.Impl, unsigned_long (Limit)));
   end Set_Offset_Limit;

   -------------------------
   -- Set_Recursion_Limit --
   -------------------------

   procedure Set_Recursion_Limit (Arg1 : access Match_Context; Arg2 : Natural)
   is
   begin
      Retcode_2_Exception (Pcre2_Set_Recursion_Limit_8 (Arg1.Impl, Unsigned (Arg2)));
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
     (Pattern : String;           --  A string containing expression to be compiled
      Options : Compile_Options := Null_Compile_Options;
      Context : Compile_Context'Class := Null_Compile_Context) return Code
   is
      Errocode    : aliased int;
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

   procedure Compile (Into    : in out Code;
                      Pattern : String;
                      Options : Compile_Options := Null_Compile_Options;
                      Context : Compile_Context'Class := Null_Compile_Context) is
      Errocode    : aliased int;
      Erroroffset : aliased unsigned_long;
   begin
      Finalize (Into);
      Into.Impl := Pcre2_Compile_8 (As_PCRE2_SPTR8 (Pattern (Pattern'First)'Address),
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
     (Code  : Pcre.Matcher.Code;
      What  : Unsigned;
      Where : System.Address) return int
   is
   begin
      return raise Program_Error with "Unimplemented function Pattern_Info";
   end Pattern_Info;

   -----------------------
   -- Callout_Enumerate --
   -----------------------

   function Callout_Enumerate
     (Code         : Pcre.Matcher.Code;
      Callback     : access function (Arg1 : access Callout_Enumerate_Block; Callout_Data : System.Address) return int;
      Callout_Data : System.Address) return int
   is
   begin
      return raise Program_Error with "Unimplemented function Callout_Enumerate";
   end Callout_Enumerate;

   -----------------------
   -- Match_Data_Create --
   -----------------------
   procedure Initialize (Match_Data : in out Pcre.Matcher.Match_Data;
                         Size       : Positive;
                         Context    : General_Context'Class := Null_General_Context)is
   begin
      Match_Data.Impl := Pcre2_Match_Data_Create_8 (Unsigned (Size), Context.Impl);
   end;

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

   procedure Initialize (Match_Data : in out Pcre.Matcher.Match_Data;
                         Code       : Pcre.Matcher.Code'Class;
                         Context    : General_Context'Class := Null_General_Context)is
   begin
      Match_Data.Impl := Pcre2_Match_Data_Create_From_Pattern_8 (Code.Impl, Context.Impl);
   end;

   ---------------
   -- Dfa_Match --
   ---------------

   function Match
     (Code        : Pcre.Matcher.Code;
      Data        : String;
      Match_Data  : in out Pcre.Matcher.Match_Data'Class;
      Data_First  : Integer      := -1;
      Data_Last   : Positive     := Positive'Last;
      Options     : Match_Options := Null_Match_Options;
      Context     : Pcre.Matcher.Match_Context'Class := Null_Match_Context;
      Workspace   : Workspace_Type) return Integer
   is
      Ret : int;
   begin
      if Match_Data.Impl = null then
         Match_Data.Initialize (Code);
      end if;
      Ret := Pcre2_Dfa_Match_8 (Code.Impl,
                                As_PCRE2_SPTR8 (Data'Address),
                                unsigned_long (if Data_Last = Positive'Last then Data'Length else Data_Last - Data'First),
                                unsigned_long (if Data_First = -1 then 0 else Data_First - Data'First),
                                Unsigned (Options),
                                Match_Data.Impl,
                                Context.Impl,
                                Workspace.Data (Workspace.Data'First)'Unrestricted_Access,
                                Workspace.Data'Length);
      if Ret < -1 then
         Retcode_2_Exception (Ret);
      end if;
      return Integer (Ret);
   end Match;

   -----------
   -- Match --
   -----------


   function Match
     (Code        : Pcre.Matcher.Code; -- the compiled pattern
      Data        : String;
      Match_Data  : in out Pcre.Matcher.Match_Data'Class;
      Data_First  : Integer      := -1;
      Data_Last   : Positive     := Positive'Last;
      Options     : Match_Options := Null_Match_Options;
      Context     : Match_Context'Class := Null_Match_Context) return Integer
   is
      Ret : int;
   begin
      if Match_Data.Impl = null then
         Match_Data.Initialize (Code);
      end if;
      Ret := Pcre2_Match_8 (Code.Impl,
                            As_PCRE2_SPTR8 (Data'Address),
                            unsigned_long (if Data_Last = Positive'Last then Data'Length else Data_Last - Data'First),
                            unsigned_long (if Data_First = -1 then 0 else Data_First - Data'First),
                            Unsigned (Options),
                            Match_Data.Impl,
                            Context.Impl);
      if Ret < -1 then
         Retcode_2_Exception (Ret);
      end if;
      return Integer (Ret);
   end Match;
   procedure Match
     (Code        : Pcre.Matcher.Code; -- the compiled pattern
      Data        : String;
      Match_Data  : in out Pcre.Matcher.Match_Data'Class;
      Data_First  : Integer      := -1;
      Data_Last   : Positive     := Positive'Last;
      Options     : Match_Options := Null_Match_Options;
      Context     : Match_Context'Class := Null_Match_Context) is
      Dummy : Integer;
   begin
      Dummy := Match (Code, Data,  Match_Data, Data_First, Data_Last, Options, Context);
   end;

   procedure Match
     (Code        : String; -- the compiled pattern
      Data        : String;
      Match_Data  : in out Pcre.Matcher.Match_Data'Class;
      Data_First  : Integer      := -1;
      Data_Last   : Positive     := Positive'Last;
      Options     : Match_Options := Null_Match_Options;
      Context     : Match_Context'Class := Null_Match_Context) is
   begin
      Match (Compile (Code), Data, Match_Data, Data_First, Data_Last, Options, Context);
   end;

   --------------
   -- Get_Mark --
   --------------

   function Get_Mark (Match_Data : Pcre.Matcher.Match_Data) return access Character is
   begin
      return raise Program_Error with "Unimplemented function Get_Mark";
   end Get_Mark;

   -------------------------
   -- Get_Match_Data_Size --
   -------------------------

   function Get_Size (Match_Data : Pcre.Matcher.Match_Data) return Natural
   is
   begin
      return Natural (Pcre2_Get_Match_Data_Size_8 (Match_Data.Impl));
   end Get_Size;

   -----------------------
   -- Get_Ovector_Count --
   -----------------------

   function Get_Ovector_Count (Match_Data : Pcre.Matcher.Match_Data) return Natural is
   begin
      return Natural (Pcre2_Get_Ovector_Count_8 (Match_Data.Impl));
   end Get_Ovector_Count;

   -------------------------
   -- Get_Ovector_Pointer --
   -------------------------

   function Get_Ovector_Pointer
     (Match_Data : Pcre.Matcher.Match_Data) return access unsigned_long
   is
   begin
      return
      raise Program_Error with "Unimplemented function Get_Ovector_Pointer";
   end Get_Ovector_Pointer;

   -------------------
   -- Get_Startchar --
   -------------------

   function Get_Startchar (Match_Data : Pcre.Matcher.Match_Data) return unsigned_long is
   begin
      return raise Program_Error with "Unimplemented function Get_Startchar";
   end Get_Startchar;

   ---------------------------
   -- Substring_Copy_Byname --
   ---------------------------

   procedure Substring
     (Match_Data : Pcre.Matcher.Match_Data;
      Name       : String;
      Buffer     : out String;
      Last       : out Natural)
   is
      L_Buffer : aliased PCRE2_UCHAR8 with Import => True , Address => Buffer'Address;
      L_Last   : aliased unsigned_long := Buffer'Length;
   begin
      Retcode_2_Exception (Pcre2_Substring_Copy_Byname_8 (Match_Data.Impl,
                           Arg2 => As_PCRE2_SPTR8 (Name'Address),
                           Arg3 => L_Buffer'Access,
                           Arg4 => L_Last'Access));
      Last := Natural (L_Last) + Buffer'First - 1;
   end Substring;

   function Substring
     (Match_Data : Pcre.Matcher.Match_Data;
      Name       : String) return String is
      Buffer : String (1 .. 1024);
      Last   : Natural;
   begin
      Match_Data.Substring (Name, Buffer, Last);
      return Buffer (Buffer'First .. Last);
   end Substring;


   -----------------------------
   -- Substring_Copy_Bynumber --
   -----------------------------

   procedure Substring
     (Match_Data : Pcre.Matcher.Match_Data;
      Number     : Natural;
      Buffer     : out String;
      Last       : out Natural)
   is
      L_Buffer : aliased PCRE2_UCHAR8 with Import => True , Address => Buffer'Address;
      L_Last   : aliased unsigned_long := Buffer'Length;
   begin
      Retcode_2_Exception (Pcre2_Substring_Copy_Bynumber_8 (Match_Data.Impl,
                           Arg2 => Unsigned (Number),
                           Arg3 => L_Buffer'Access,
                           Arg4 => L_Last'Access));
      Last := Natural (L_Last) + Buffer'First - 1;
   end Substring;

   function Substring
     (Match_Data : Pcre.Matcher.Match_Data;
      Number     : Natural) return String  is
      Buffer : String (1 .. 1024);
      Last   : Natural;
   begin
      Match_Data.Substring (Number, Buffer, Last);
      return Buffer (Buffer'First .. Last);
   end Substring;
   function Constant_Indexing (Self : Match_Data ; Index : Natural) return String is
   begin
      return Self.Substring (Index);
   end;

   --------------------
   -- Substring_Free --
   --------------------

   procedure Substring_Free (Arg1 : access Character) is
   begin
      raise Program_Error with "Unimplemented procedure Substring_Free";
   end Substring_Free;

   -----------------------------
   -- Substring_Length_Byname --
   -----------------------------

   function Substring_Length
     (Match_Data : Pcre.Matcher.Match_Data;
      Name       : String) return Natural
   is
      Ret : aliased unsigned_long;
   begin
      Retcode_2_Exception (Pcre2_Substring_Length_Byname_8 (Match_Data.Impl,
                           As_PCRE2_SPTR8 (Name'Address),
                           Ret'Access));
      return Natural (Ret);
   end Substring_Length;

   -------------------------------
   -- Substring_Length_Bynumber --
   -------------------------------

   function Substring_Length
     (Match_Data : Pcre.Matcher.Match_Data;
      Number     : Natural) return Natural
   is
      Ret : aliased unsigned_long;
   begin
      Retcode_2_Exception (Pcre2_Substring_Length_Bynumber_8 (Match_Data.Impl,
                           Unsigned (Number),
                           Ret'Access));
      return Natural (Ret);
   end Substring_Length;

   ------------------------------
   -- Substring_Nametable_Scan --
   ------------------------------

   procedure Substring_Nametable_Scan
     (Code  : Pcre.Matcher.Code;
      Name  : String;
      First : System.Address;
      Last  : System.Address)
   is
      Ret  : Interfaces.C.int;

   begin
      Ret := Pcre2_Substring_Nametable_Scan_8 (Code.Impl,
                                               As_PCRE2_SPTR8 (Name'Address),
                                               First, Last);
      Retcode_2_Exception (Ret);
   end Substring_Nametable_Scan;

   --------------------------------
   -- Substring_Number_From_Name --
   --------------------------------

   function Number_From_Name
     (Code  : Pcre.Matcher.Code; Name  : String) return Natural
   is
      Ret : int;
   begin
      Ret := Pcre2_Substring_Number_From_Name_8 (Code.Impl,
                                                 As_PCRE2_SPTR8 (Name'Address));
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
     (Match_Data : Pcre.Matcher.Match_Data;
      Arg2       : System.Address;
      Arg3       : System.Address) return int
   is
      pragma Unreferenced (Match_Data, Arg2, Arg3);
   begin
      return
      raise Program_Error with "Unimplemented function Substring_List_Get";
   end Substring_List_Get;

   function Get (Match_Data : Pcre.Matcher.Match_Data'Class) return Substring_List is
   begin
      return Ret : Substring_List do
         Ret.Lengthsptr := System.Null_Address;
         Ret.Listptr    := System.Null_Address;
      end return;
   end;

   -----------------------------------
   -- Serialize_Get_Number_Of_Codes --
   -----------------------------------

   function Serialize_Get_Number_Of_Codes (Arg1 : access Character) return int
   is
      pragma Unreferenced (Arg1);
   begin
      return
      raise Program_Error
        with "Unimplemented function Serialize_Get_Number_Of_Codes";
   end Serialize_Get_Number_Of_Codes;

   --------------------
   -- Serialize_Free --
   --------------------

   procedure Serialize_Free (Arg1 : access Character) is
   begin
      raise Program_Error with "Unimplemented procedure Serialize_Free";
   end Serialize_Free;

   ----------------
   -- Substitute --
   ----------------

   procedure Substitute
     (Code              : Pcre.Matcher.Code;
      Subject           : String;
      Startoffset       : unsigned_long;
      Options           : Unsigned;
      Match_Data        : Pcre.Matcher.Match_Data'Class;
      Context           : Match_Context'Class;
      Replacement       : String;
      Outputbuffer      : out String;
      Last              : out unsigned_long)
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
     (Arg1 : access constant Code; Arg2 : access Character;
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

   function Maketables (Context :  General_Context) return Character_Tables
   is
   begin
      return raise Program_Error with "Unimplemented function Maketables";
   end Maketables;

   ---------------------
   -- Maketables_Free --
   ---------------------

   procedure Maketables_Free
     (Context :  General_Context; Tables : Character_Tables)
   is
   begin
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
      if Object.Impl /= null then
         Pcre2_General_Context_Free_8 (Object.Impl);
         Object.Impl := null;
      end if;
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
      if Object.Impl /= null then
         Pcre2_Compile_Context_Free_8 (Object.Impl);
         Object.Impl := null;
      end if;
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
      if Object.Impl /= null then
         Pcre2_Match_Context_Free_8 (Object.Impl);
         Object.Impl := null;
      end if;
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
      if Object.Impl /= null then
         Pcre2_Convert_Context_Free_8 (Object.Impl);
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
      Object.Impl := Pcre2_Code_Copy_With_Tables_8 (Object.Impl);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Code) is
   begin
      if Object.Impl /= null then
         Pcre2_Code_Free_8 (Object.Impl);
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
         Pcre2_Match_Data_Free_8 (Object.Impl);
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
      use Ada.Streams;
      Last   : aliased unsigned_long;
      Ret    : int;
   begin
      unsigned_long'Read (S, Last);
      declare
         type Buffer_Type is array (1 .. Last) of aliased Unsigned_Char;
         Buffer : Buffer_Type;
      begin
         Buffer_Type'Read (S, Buffer);
         Ret := Pcre2_Serialize_Decode_8 (Arg1 => Item.Impl'Address,
                                          Arg2 => 1,
                                          Arg3 => Buffer (Buffer'First)'Access,
                                          Arg4 => Context.Impl);
      end;
      if Ret < 0 then
         Retcode_2_Exception (Ret);
      end if;
   end;

   procedure Write (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : in Code; Context : General_Context'Class) is
      use Ada.Streams;
      type Buffer_Type is new Ada.Streams.Stream_Element_Array (1 .. 1024 * 1024);
      type Buffer_Type_Access is access all Buffer_Type with Storage_Size => 0;
      Buffer : Buffer_Type_Access;
      Last   : aliased unsigned_long := Buffer_Type'Length;
      Ret    : int;
   begin
      Ret := Pcre2_Serialize_Encode_8 (Arg1 => Item.Impl'Address,
                                       Arg2 => 1,
                                       Arg3 => Buffer'Address,
                                       Arg4 => Last'Access,
                                       Arg5 => Context.Impl);
      if Ret < 0 then
         Retcode_2_Exception (Ret);
      end if;
      unsigned_long'Write (S, Last);
      Buffer_Type'Write (S, Buffer (Buffer'First .. Ada.Streams.Stream_Element_Offset (Last)));
   end;

   procedure Read (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : out Code) is
   begin
      Read (S, Item, Null_General_Context);
   end;

   procedure Write (S : not null access Ada.Streams.Root_Stream_Type'Class; Item : in Code) is
   begin
      Write (S, Item, Null_General_Context);
   end;



   procedure Finalize   (Object : in out Substring_List) is
   begin
      Pcre2_Substring_List_Free_8 (Object.Listptr);
      Pcre2_Substring_List_Free_8 (Object.Lengthsptr);
      Object.Listptr := System.Null_Address;
      Object.Lengthsptr := System.Null_Address;
   end;

end Pcre.Matcher;
