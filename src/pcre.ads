--  ==========================================================================
--
--  This packag provide a thick binding to the pcre2 library
--    https://www.pcre.org/
--
--  ==========================================================================
private with Interfaces.C;
package Pcre is

   type Extra_Options is private;
   NULL_Extra_Options            : constant Extra_Options;
   EXTRA_ALLOW_SURROGATE_ESCAPES : constant Extra_Options;
   EXTRA_BAD_ESCAPE_IS_LITERAL   : constant Extra_Options;
   EXTRA_MATCH_WORD              : constant Extra_Options;
   EXTRA_MATCH_LINE              : constant Extra_Options;
   EXTRA_ESCAPED_CR_IS_LF        : constant Extra_Options;
   EXTRA_ALT_BSUX                : constant Extra_Options;
   function "+" (L, R : Extra_Options) return Extra_Options;
   function "-" (L, R : Extra_Options) return Extra_Options is abstract;
   function "*" (L, R : Extra_Options) return Extra_Options is abstract;
   function "/" (L, R : Extra_Options) return Extra_Options is abstract;
   function "mod" (L, R : Extra_Options) return Extra_Options is abstract;


   type Compile_Options is private;
   Null_Compile_Options : constant Compile_Options;
   ANCHORED             : constant Compile_Options; --  Force pattern anchoring
   ALLOW_EMPTY_CLASS    : constant Compile_Options; --  Allow empty classes
   ALT_BSUX             : constant Compile_Options; --  Alternative handling of \u, \U, and \x
   ALT_CIRCUMFLEX       : constant Compile_Options; --  Alternative handling of ^ in multiline mode
   ALT_VERBNAMES        : constant Compile_Options; --  Process backslashes in verb names
   AUTO_CALLOUT         : constant Compile_Options; --  Compile automatic callouts
   CASELESS             : constant Compile_Options; --  Do caseless matching
   DOLLAR_ENDONLY       : constant Compile_Options; --  $ not to match newline at end
   DOTALL               : constant Compile_Options; --  . matches anything including NL
   DUPNAMES             : constant Compile_Options; --  Allow duplicate names for subpatterns
   ENDANCHORED          : constant Compile_Options; --  Pattern can match only at end of subject
   EXTENDED             : constant Compile_Options; --  Ignore white space and # comments
   FIRSTLINE            : constant Compile_Options; --  Force matching to be before newline
   LITERAL              : constant Compile_Options; --  Pattern characters are all literal
   MATCH_INVALID_UTF    : constant Compile_Options; --  Enable support for matching invalid UTF
   MATCH_UNSET_BACKREF  : constant Compile_Options; --  Match unset backreferences
   MULTILINE            : constant Compile_Options; --  ^ and $ match newlines within data
   NEVER_BACKSLASH_C    : constant Compile_Options; --  Lock out the use of \C in patterns
   NEVER_UCP            : constant Compile_Options; --  Lock out UCP, e.g. via (*UCP)
   NEVER_UTF            : constant Compile_Options; --  Lock out UTF, e.g. via (*UTF)
   NO_AUTO_CAPTURE      : constant Compile_Options; --  Disable numbered capturing paren-theses (named ones available)
   NO_AUTO_POSSESS      : constant Compile_Options; --  Disable auto-possessification
   NO_DOTSTAR_ANCHOR    : constant Compile_Options; --  Disable automatic anchoring for .*
   NO_START_OPTIMIZE    : constant Compile_Options; --  Disable match-time start optimizations
   NO_UTF_CHECK         : constant Compile_Options; --  Do not check the pattern for UTF validity (only relevant if UTF is set)
   UCP                  : constant Compile_Options; --  Use Unicode properties for \d, \w, etc.
   UNGREEDY             : constant Compile_Options; --  Invert greediness of quantifiers
   USE_OFFSET_LIMIT     : constant Compile_Options; --  Enable offset limit for unanchored matching
   UTF                  : constant Compile_Options; --  Treat pattern and subjects as UTF strings
   function "+" (L, R : Compile_Options) return Compile_Options;


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

   type Config_Settings is  mod 2 ** 32;
   CONFIG_BSR               : constant Config_Settings := 0 with Annotate => (Src, PCRE2_CONFIG_BSR);
   CONFIG_JIT               : constant Config_Settings := 1 with Annotate => (Src, PCRE2_CONFIG_JIT);
   CONFIG_JITTARGET         : constant Config_Settings := 2 with Annotate => (Src, PCRE2_CONFIG_JITTARGET);
   CONFIG_LINKSIZE          : constant Config_Settings := 3 with Annotate => (Src, PCRE2_CONFIG_LINKSIZE);
   CONFIG_MATCHLIMIT        : constant Config_Settings := 4 with Annotate => (Src, PCRE2_CONFIG_MATCHLIMIT);
   CONFIG_NEWLINE           : constant Config_Settings := 5 with Annotate => (Src, PCRE2_CONFIG_NEWLINE);
   CONFIG_PARENSLIMIT       : constant Config_Settings := 6 with Annotate => (Src, PCRE2_CONFIG_PARENSLIMIT);
   CONFIG_DEPTHLIMIT        : constant Config_Settings := 7 with Annotate => (Src, PCRE2_CONFIG_DEPTHLIMIT);
   CONFIG_RECURSIONLIMIT    : constant Config_Settings := 7 with Annotate => (Src, PCRE2_CONFIG_RECURSIONLIMIT);
   CONFIG_STACKRECURSE      : constant Config_Settings := 8 with Annotate => (Src, PCRE2_CONFIG_STACKRECURSE);
   CONFIG_UNICODE           : constant Config_Settings := 9 with Annotate => (Src, PCRE2_CONFIG_UNICODE);
   CONFIG_UNICODE_VERSION   : constant Config_Settings := 10 with Annotate => (Src, PCRE2_CONFIG_UNICODE_VERSION);
   CONFIG_VERSION           : constant Config_Settings := 11 with Annotate => (Src, PCRE2_CONFIG_VERSION);
   CONFIG_HEAPLIMIT         : constant Config_Settings := 12 with Annotate => (Src, PCRE2_CONFIG_HEAPLIMIT);
   CONFIG_NEVER_BACKSLASH_C : constant Config_Settings := 13 with Annotate => (Src, PCRE2_CONFIG_NEVER_BACKSLASH_C);
   CONFIG_COMPILED_WIDTHS   : constant Config_Settings := 14 with Annotate => (Src, PCRE2_CONFIG_COMPILED_WIDTHS);
   CONFIG_TABLES_LENGTH     : constant Config_Settings := 15 with Annotate => (Src, PCRE2_CONFIG_TABLES_LENGTH);

   PCRE_ERROR : exception;


private
   procedure Retcode_2_Exception (Code : Interfaces.C.Int);
   --  Note there is some trickery just to guarantie that the values are from the lowlevelcode.
   --
   type Extra_Options  is mod 2 ** 32;
   NULL_Extra_Options            : constant Extra_Options := 0;
   EXTRA_ALLOW_SURROGATE_ESCAPES : constant Extra_Options := 16#0000_0001# with Annotate => (Src, PCRE2_EXTRA_ALLOW_SURROGATE_ESCAPES);
   EXTRA_BAD_ESCAPE_IS_LITERAL   : constant Extra_Options := 16#0000_0002# with Annotate => (Src, PCRE2_EXTRA_BAD_ESCAPE_IS_LITERAL);
   EXTRA_MATCH_WORD              : constant Extra_Options := 16#0000_0004# with Annotate => (Src, PCRE2_EXTRA_MATCH_WORD);
   EXTRA_MATCH_LINE              : constant Extra_Options := 16#0000_0008# with Annotate => (Src, PCRE2_EXTRA_MATCH_LINE);
   EXTRA_ESCAPED_CR_IS_LF        : constant Extra_Options := 16#0000_0010# with Annotate => (Src, PCRE2_EXTRA_ESCAPED_CR_IS_LF);
   EXTRA_ALT_BSUX                : constant Extra_Options := 16#0000_0020# with Annotate => (Src, PCRE2_EXTRA_ALT_BSUX);


   type Compile_Options is mod 2 ** 32;
   Null_Compile_Options : constant Compile_Options := 0;
   ANCHORED            : constant Compile_Options := 16#8000_0000# with Annotate => (Src, PCRE2_ANCHORED);
   ALLOW_EMPTY_CLASS   : constant Compile_Options := 16#0000_0001# with Annotate => (Src, PCRE2_ALLOW_EMPTY_CLASS);
   ALT_BSUX            : constant Compile_Options := 16#0000_0002# with Annotate => (Src, PCRE2_ALT_BSUX);
   ALT_CIRCUMFLEX      : constant Compile_Options := 16#0020_0000# with Annotate => (Src, PCRE2_ALT_CIRCUMFLEX);
   ALT_VERBNAMES       : constant Compile_Options := 16#0040_0000# with Annotate => (Src, PCRE2_ALT_VERBNAMES);
   AUTO_CALLOUT        : constant Compile_Options := 16#0000_0004# with Annotate => (Src, PCRE2_AUTO_CALLOUT);
   CASELESS            : constant Compile_Options := 16#0000_0008# with Annotate => (Src, PCRE2_CASELESS);
   DOLLAR_ENDONLY      : constant Compile_Options := 16#0000_0010# with Annotate => (Src, PCRE2_DOLLAR_ENDONLY);
   DOTALL              : constant Compile_Options := 16#0000_0020# with Annotate => (Src, PCRE2_DOTALL);
   DUPNAMES            : constant Compile_Options := 16#0000_0040# with Annotate => (Src, PCRE2_DUPNAMES);
   ENDANCHORED         : constant Compile_Options := 16#2000_0000# with Annotate => (Src, PCRE2_ENDANCHORED);
   EXTENDED            : constant Compile_Options := 16#0000_0080# with Annotate => (Src, PCRE2_EXTENDED);
   FIRSTLINE           : constant Compile_Options := 16#0000_0100# with Annotate => (Src, PCRE2_FIRSTLINE);
   LITERAL             : constant Compile_Options := 16#0200_0000# with Annotate => (Src, PCRE2_LITERAL);
   MATCH_INVALID_UTF   : constant Compile_Options := 16#0400_0000# with Annotate => (Src, PCRE2_MATCH_INVALID_UTF);
   MATCH_UNSET_BACKREF : constant Compile_Options := 16#0000_0200# with Annotate => (Src, PCRE2_MATCH_UNSET_BACKREF);
   MULTILINE           : constant Compile_Options := 16#0000_0400# with Annotate => (Src, PCRE2_MULTILINE);
   NEVER_BACKSLASH_C   : constant Compile_Options := 16#0010_0000# with Annotate => (Src, PCRE2_NEVER_BACKSLASH_C);
   NEVER_UCP           : constant Compile_Options := 16#0000_0800# with Annotate => (Src, PCRE2_NEVER_UCP);
   NEVER_UTF           : constant Compile_Options := 16#0000_1000# with Annotate => (Src, PCRE2_NEVER_UTF);
   NO_AUTO_CAPTURE     : constant Compile_Options := 16#0000_2000# with Annotate => (Src, PCRE2_NO_AUTO_CAPTURE);
   NO_AUTO_POSSESS     : constant Compile_Options := 16#0000_4000# with Annotate => (Src, PCRE2_NO_AUTO_POSSESS);
   NO_DOTSTAR_ANCHOR   : constant Compile_Options := 16#0000_8000# with Annotate => (Src, PCRE2_NO_DOTSTAR_ANCHOR);
   NO_START_OPTIMIZE   : constant Compile_Options := 16#0001_0000# with Annotate => (Src, PCRE2_NO_START_OPTIMIZE);
   NO_UTF_CHECK        : constant Compile_Options := 16#4000_0000# with Annotate => (Src, PCRE2_NO_UTF_CHECK);
   UCP                 : constant Compile_Options := 16#0002_0000# with Annotate => (Src, PCRE2_UCP);
   UNGREEDY            : constant Compile_Options := 16#0004_0000# with Annotate => (Src, PCRE2_UNGREEDY);
   USE_OFFSET_LIMIT    : constant Compile_Options := 16#0080_0000# with Annotate => (Src, PCRE2_USE_OFFSET_LIMIT);
   UTF                 : constant Compile_Options := 16#0008_0000# with Annotate => (Src, PCRE2_UTF);


   type Match_Options is mod 2 ** 32;
   Null_Match_Options         : constant Match_Options := 16#00000000#;
   Match_ANCHORED             : constant Match_Options := 16#80000000# with Annotate => (Src, PCRE2_ANCHORED); --  Match only at the first position
   Match_COPY_MATCHED_SUBJECT : constant Match_Options := 16#00000001# with Annotate => (Src, PCRE2_UTF); --  On success, make a private subject copy
   Match_ENDANCHORED          : constant Match_Options := 16#00000001# with Annotate => (Src, PCRE2_UTF); --  Pattern can match only at end of subject
   Match_NOTBOL               : constant Match_Options := 16#00000001# with Annotate => (Src, PCRE2_NOTBOL); --  Subject string is not the beginning of a line
   Match_NOTEOL               : constant Match_Options := 16#00000002# with Annotate => (Src, PCRE2_NOTEOL); --  Subject string is not the end of a line
   Match_NOTEMPTY             : constant Match_Options := 16#00000004# with Annotate => (Src, PCRE2_NOTEMPTY); --  An empty string is not a valid match
   Match_NOTEMPTY_ATSTART     : constant Match_Options := 16#00000008# with Annotate => (Src, PCRE2_NOTEMPTY_ATSTART); --  An empty string at the start of the subject is not a valid match
   Match_NO_JIT               : constant Match_Options := 16#00002000# with Annotate => (Src, PCRE2_NO_JIT); --  Do not use JIT matching
   Match_NO_UTF_CHECK         : constant Match_Options := 16#40000000# with Annotate => (Src, PCRE2_NO_UTF_CHECK); --  Do not check the subject for UTF validity (only relevant if UTF was set at compile time)
   Match_PARTIAL_HARD         : constant Match_Options := 16#00000020# with Annotate => (Src, PCRE2_PARTIAL_HARD); --  Return ERROR_PARTIAL for a partial match even if there is a full match
   Match_PARTIAL_SOFT         : constant Match_Options := 16#00000010# with Annotate => (Src, PCRE2_PARTIAL_SOFT); --  Return ERROR_PARTIAL for a partial match if no full matches are found



end Pcre;
