pragma Ada_2012;
with Pcre.Low_Level.Pcre2_H;
package body Pcre is
   use Pcre.Low_Level.Pcre2_H;
   EXTRA_ALLOW_SURROGATE_ESCAPES_Impl : constant Extra_Options := PCRE2_EXTRA_ALLOW_SURROGATE_ESCAPES with Export => True,  Link_Name => "Pcre__PCRE2_EXTRA_ALLOW_SURROGATE_ESCAPES";
   EXTRA_BAD_ESCAPE_IS_LITERAL_Impl   : constant Extra_Options := PCRE2_EXTRA_BAD_ESCAPE_IS_LITERAL   with Export => True,  Link_Name => "Pcre__PCRE2_EXTRA_BAD_ESCAPE_IS_LITERAL";
   EXTRA_MATCH_WORD_Impl              : constant Extra_Options := PCRE2_EXTRA_MATCH_WORD              with Export => True,  Link_Name => "Pcre__PCRE2_EXTRA_MATCH_WORD";
   EXTRA_MATCH_LINE_Impl              : constant Extra_Options := PCRE2_EXTRA_MATCH_LINE              with Export => True,  Link_Name => "Pcre__PCRE2_EXTRA_MATCH_LINE";
   EXTRA_ESCAPED_CR_IS_LF_Impl        : constant Extra_Options := PCRE2_EXTRA_ESCAPED_CR_IS_LF        with Export => True,  Link_Name => "Pcre__PCRE2_EXTRA_ESCAPED_CR_IS_LF";
   EXTRA_ALT_BSUX_Impl                : constant Extra_Options := PCRE2_EXTRA_ALT_BSUX                with Export => True,  Link_Name => "Pcre__PCRE2_EXTRA_ALT_BSUX";

   ---------
   -- "+" --
   ---------

   function "+" (L, R : Extra_Options) return Extra_Options is
   begin
      return Extra_Options (Natural (L) + Natural (R));
   end "+";

   ANCHORED_Impl             : constant Compile_Options := PCRE2_ANCHORED with Export => True, Link_Name => "Pcre__PCRE2_ANCHORED";
   ALLOW_EMPTY_CLASS_Impl    : constant Compile_Options := PCRE2_ALLOW_EMPTY_CLASS with Export => True, Link_Name => "Pcre__PCRE2_ALLOW_EMPTY_CLASS";
   ALT_BSUX_Impl             : constant Compile_Options := PCRE2_ALT_BSUX with Export => True, Link_Name => "Pcre__PCRE2_ALT_BSUX";
   ALT_CIRCUMFLEX_Impl       : constant Compile_Options := PCRE2_ALT_CIRCUMFLEX with Export => True, Link_Name => "Pcre__PCRE2_ALT_CIRCUMFLEX";
   ALT_VERBNAMES_Impl        : constant Compile_Options := PCRE2_ALT_VERBNAMES with Export => True, Link_Name => "Pcre__PCRE2_ALT_VERBNAMES";
   AUTO_CALLOUT_Impl         : constant Compile_Options := PCRE2_AUTO_CALLOUT with Export => True, Link_Name => "Pcre__PCRE2_AUTO_CALLOUT";
   CASELESS_Impl             : constant Compile_Options := PCRE2_CASELESS with Export => True, Link_Name => "Pcre__PCRE2_CASELESS";
   DOLLAR_ENDONLY_Impl       : constant Compile_Options := PCRE2_DOLLAR_ENDONLY with Export => True, Link_Name => "Pcre__PCRE2_DOLLAR_ENDONLY";
   DOTALL_Impl               : constant Compile_Options := PCRE2_DOTALL with Export => True, Link_Name => "Pcre__PCRE2_DOTALL";
   DUPNAMES_Impl             : constant Compile_Options := PCRE2_DUPNAMES with Export => True, Link_Name => "Pcre__PCRE2_DUPNAMES";
   ENDANCHORED_Impl          : constant Compile_Options := PCRE2_ENDANCHORED with Export => True, Link_Name => "Pcre__PCRE2_ENDANCHORED";
   EXTENDED_Impl             : constant Compile_Options := PCRE2_EXTENDED with Export => True, Link_Name => "Pcre__PCRE2_EXTENDED";
   FIRSTLINE_Impl            : constant Compile_Options := PCRE2_FIRSTLINE with Export => True, Link_Name => "Pcre__PCRE2_FIRSTLINE";
   LITERAL_Impl              : constant Compile_Options := PCRE2_LITERAL with Export => True, Link_Name => "Pcre__PCRE2_LITERAL";
   MATCH_INVALID_UTF_Impl    : constant Compile_Options := PCRE2_MATCH_INVALID_UTF with Export => True, Link_Name => "Pcre__PCRE2_MATCH_INVALID_UTF";
   MATCH_UNSET_BACKREF_Impl  : constant Compile_Options := PCRE2_MATCH_UNSET_BACKREF with Export => True, Link_Name => "Pcre__PCRE2_MATCH_UNSET_BACKREF";
   MULTILINE_Impl            : constant Compile_Options := PCRE2_MULTILINE with Export => True, Link_Name => "Pcre__PCRE2_MULTILINE";
   NEVER_BACKSLASH_C_Impl    : constant Compile_Options := PCRE2_NEVER_BACKSLASH_C with Export => True, Link_Name => "Pcre__PCRE2_NEVER_BACKSLASH_C";
   NEVER_UCP_Impl            : constant Compile_Options := PCRE2_NEVER_UCP with Export => True, Link_Name => "Pcre__PCRE2_NEVER_UCP";
   NEVER_UTF_Impl            : constant Compile_Options := PCRE2_NEVER_UTF with Export => True, Link_Name => "Pcre__PCRE2_NEVER_UTF";
   NO_AUTO_CAPTURE_Impl      : constant Compile_Options := PCRE2_NO_AUTO_CAPTURE with Export => True, Link_Name => "Pcre__PCRE2_NO_AUTO_CAPTURE";
   NO_AUTO_POSSESS_Impl      : constant Compile_Options := PCRE2_NO_AUTO_POSSESS with Export => True, Link_Name => "Pcre__PCRE2_NO_AUTO_POSSESS";
   NO_DOTSTAR_ANCHOR_Impl    : constant Compile_Options := PCRE2_NO_DOTSTAR_ANCHOR with Export => True, Link_Name => "Pcre__PCRE2_NO_DOTSTAR_ANCHOR";
   NO_START_OPTIMIZE_Impl    : constant Compile_Options := PCRE2_NO_START_OPTIMIZE with Export => True, Link_Name => "Pcre__PCRE2_NO_START_OPTIMIZE";
   NO_UTF_CHECK_Impl         : constant Compile_Options := PCRE2_NO_UTF_CHECK with Export => True, Link_Name => "Pcre__PCRE2_NO_UTF_CHECK";
   UCP_Impl                  : constant Compile_Options := PCRE2_UCP with Export => True, Link_Name => "Pcre__PCRE2_UCP";
   UNGREEDY_Impl             : constant Compile_Options := PCRE2_UNGREEDY with Export => True, Link_Name => "Pcre__PCRE2_UNGREEDY";
   USE_OFFSET_LIMIT_Impl     : constant Compile_Options := PCRE2_USE_OFFSET_LIMIT with Export => True, Link_Name => "Pcre__PCRE2_USE_OFFSET_LIMIT";

   function "+" (L, R : Compile_Options) return Compile_Options is
   begin
      return Compile_Options (Natural (L) + Natural (R));
   end "+";

   --  Match_ANCHORED_Impl             : constant Match_Options := PCRE2_ANCHORED with Export => True,  Link_Name => "Pcre__PCRE2_ANCHORED";
   Match_COPY_MATCHED_SUBJECT_Impl : constant Match_Options := PCRE2_COPY_MATCHED_SUBJECT with Export => True,  Link_Name => "Pcre__PCRE2_COPY_MATCHED_SUBJECT";
   --  Match_ENDANCHORED_Impl          : constant Match_Options := PCRE2_ENDANCHORED with Export => True,  Link_Name => "Pcre__PCRE2_ENDANCHORED";
   Match_NOTBOL_Impl               : constant Match_Options := PCRE2_NOTBOL with Export => True,  Link_Name => "Pcre__PCRE2_NOTBOL";
   Match_NOTEOL_Impl               : constant Match_Options := PCRE2_NOTEOL with Export => True,  Link_Name => "Pcre__PCRE2_NOTEOL";
   Match_NOTEMPTY_Impl             : constant Match_Options := PCRE2_NOTEMPTY with Export => True,  Link_Name => "Pcre__PCRE2_NOTEMPTY";
   Match_NOTEMPTY_ATSTART_Impl     : constant Match_Options := PCRE2_NOTEMPTY_ATSTART with Export => True,  Link_Name => "Pcre__PCRE2_NOTEMPTY_ATSTART";
   Match_NO_JIT_Impl               : constant Match_Options := PCRE2_NO_JIT with Export => True,  Link_Name => "Pcre__PCRE2_NO_JIT";
   --  Match_NO_UTF_CHECK_Impl         : constant Match_Options := PCRE2_NO_UTF_CHECK with Export => True,  Link_Name => "Pcre__PCRE2_NO_UTF_CHECK";
   Match_PARTIAL_HARD_Impl         : constant Match_Options := PCRE2_PARTIAL_HARD with Export => True,  Link_Name => "Pcre__PCRE2_PARTIAL_HARD";
   Match_PARTIAL_SOFT_Impl         : constant Match_Options := PCRE2_PARTIAL_SOFT with Export => True,  Link_Name => "Pcre__PCRE2_PARTIAL_SOFT";

   function "+" (L, R : Match_Options) return Match_Options is
   begin
      return Match_Options (Natural (L) + Natural (R));
   end "+";

end Pcre;
