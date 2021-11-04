pragma Ada_2012;

pragma Style_Checks (Off);
pragma Warnings (Off, "-gnatwu");

with Interfaces.C; use Interfaces.C;

with System;



package Pcre.Low_Level.pcre2_h is

   PCRE2_MAJOR : constant := 10;  --  /usr/include/pcre2.h:44
   PCRE2_MINOR : constant := 36;  --  /usr/include/pcre2.h:45

   PCRE2_DATE : constant := 2020-12-8#4#;  --  /usr/include/pcre2.h:47
   --  unsupported macro: PCRE2_EXP_DECL extern "C"

   PCRE2_ANCHORED : constant := 16#80000000#;  --  /usr/include/pcre2.h:105
   PCRE2_NO_UTF_CHECK : constant := 16#40000000#;  --  /usr/include/pcre2.h:106
   PCRE2_ENDANCHORED : constant := 16#20000000#;  --  /usr/include/pcre2.h:107

   PCRE2_ALLOW_EMPTY_CLASS : constant := 16#00000001#;  --  /usr/include/pcre2.h:119
   PCRE2_ALT_BSUX : constant := 16#00000002#;  --  /usr/include/pcre2.h:120
   PCRE2_AUTO_CALLOUT : constant := 16#00000004#;  --  /usr/include/pcre2.h:121
   PCRE2_CASELESS : constant := 16#00000008#;  --  /usr/include/pcre2.h:122
   PCRE2_DOLLAR_ENDONLY : constant := 16#00000010#;  --  /usr/include/pcre2.h:123
   PCRE2_DOTALL : constant := 16#00000020#;  --  /usr/include/pcre2.h:124
   PCRE2_DUPNAMES : constant := 16#00000040#;  --  /usr/include/pcre2.h:125
   PCRE2_EXTENDED : constant := 16#00000080#;  --  /usr/include/pcre2.h:126
   PCRE2_FIRSTLINE : constant := 16#00000100#;  --  /usr/include/pcre2.h:127
   PCRE2_MATCH_UNSET_BACKREF : constant := 16#00000200#;  --  /usr/include/pcre2.h:128
   PCRE2_MULTILINE : constant := 16#00000400#;  --  /usr/include/pcre2.h:129
   PCRE2_NEVER_UCP : constant := 16#00000800#;  --  /usr/include/pcre2.h:130
   PCRE2_NEVER_UTF : constant := 16#00001000#;  --  /usr/include/pcre2.h:131
   PCRE2_NO_AUTO_CAPTURE : constant := 16#00002000#;  --  /usr/include/pcre2.h:132
   PCRE2_NO_AUTO_POSSESS : constant := 16#00004000#;  --  /usr/include/pcre2.h:133
   PCRE2_NO_DOTSTAR_ANCHOR : constant := 16#00008000#;  --  /usr/include/pcre2.h:134
   PCRE2_NO_START_OPTIMIZE : constant := 16#00010000#;  --  /usr/include/pcre2.h:135
   PCRE2_UCP : constant := 16#00020000#;  --  /usr/include/pcre2.h:136
   PCRE2_UNGREEDY : constant := 16#00040000#;  --  /usr/include/pcre2.h:137
   PCRE2_UTF : constant := 16#00080000#;  --  /usr/include/pcre2.h:138
   PCRE2_NEVER_BACKSLASH_C : constant := 16#00100000#;  --  /usr/include/pcre2.h:139
   PCRE2_ALT_CIRCUMFLEX : constant := 16#00200000#;  --  /usr/include/pcre2.h:140
   PCRE2_ALT_VERBNAMES : constant := 16#00400000#;  --  /usr/include/pcre2.h:141
   PCRE2_USE_OFFSET_LIMIT : constant := 16#00800000#;  --  /usr/include/pcre2.h:142
   PCRE2_EXTENDED_MORE : constant := 16#01000000#;  --  /usr/include/pcre2.h:143
   PCRE2_LITERAL : constant := 16#02000000#;  --  /usr/include/pcre2.h:144
   PCRE2_MATCH_INVALID_UTF : constant := 16#04000000#;  --  /usr/include/pcre2.h:145

   PCRE2_EXTRA_ALLOW_SURROGATE_ESCAPES : constant := 16#00000001#;  --  /usr/include/pcre2.h:149
   PCRE2_EXTRA_BAD_ESCAPE_IS_LITERAL : constant := 16#00000002#;  --  /usr/include/pcre2.h:150
   PCRE2_EXTRA_MATCH_WORD : constant := 16#00000004#;  --  /usr/include/pcre2.h:151
   PCRE2_EXTRA_MATCH_LINE : constant := 16#00000008#;  --  /usr/include/pcre2.h:152
   PCRE2_EXTRA_ESCAPED_CR_IS_LF : constant := 16#00000010#;  --  /usr/include/pcre2.h:153
   PCRE2_EXTRA_ALT_BSUX : constant := 16#00000020#;  --  /usr/include/pcre2.h:154

   PCRE2_JIT_COMPLETE : constant := 16#00000001#;  --  /usr/include/pcre2.h:158
   PCRE2_JIT_PARTIAL_SOFT : constant := 16#00000002#;  --  /usr/include/pcre2.h:159
   PCRE2_JIT_PARTIAL_HARD : constant := 16#00000004#;  --  /usr/include/pcre2.h:160
   PCRE2_JIT_INVALID_UTF : constant := 16#00000100#;  --  /usr/include/pcre2.h:161

   PCRE2_NOTBOL : constant := 16#00000001#;  --  /usr/include/pcre2.h:169
   PCRE2_NOTEOL : constant := 16#00000002#;  --  /usr/include/pcre2.h:170
   PCRE2_NOTEMPTY : constant := 16#00000004#;  --  /usr/include/pcre2.h:171
   PCRE2_NOTEMPTY_ATSTART : constant := 16#00000008#;  --  /usr/include/pcre2.h:172
   PCRE2_PARTIAL_SOFT : constant := 16#00000010#;  --  /usr/include/pcre2.h:173
   PCRE2_PARTIAL_HARD : constant := 16#00000020#;  --  /usr/include/pcre2.h:174
   PCRE2_DFA_RESTART : constant := 16#00000040#;  --  /usr/include/pcre2.h:175
   PCRE2_DFA_SHORTEST : constant := 16#00000080#;  --  /usr/include/pcre2.h:176
   PCRE2_SUBSTITUTE_GLOBAL : constant := 16#00000100#;  --  /usr/include/pcre2.h:177
   PCRE2_SUBSTITUTE_EXTENDED : constant := 16#00000200#;  --  /usr/include/pcre2.h:178
   PCRE2_SUBSTITUTE_UNSET_EMPTY : constant := 16#00000400#;  --  /usr/include/pcre2.h:179
   PCRE2_SUBSTITUTE_UNKNOWN_UNSET : constant := 16#00000800#;  --  /usr/include/pcre2.h:180
   PCRE2_SUBSTITUTE_OVERFLOW_LENGTH : constant := 16#00001000#;  --  /usr/include/pcre2.h:181
   PCRE2_NO_JIT : constant := 16#00002000#;  --  /usr/include/pcre2.h:182
   PCRE2_COPY_MATCHED_SUBJECT : constant := 16#00004000#;  --  /usr/include/pcre2.h:183
   PCRE2_SUBSTITUTE_LITERAL : constant := 16#00008000#;  --  /usr/include/pcre2.h:184
   PCRE2_SUBSTITUTE_MATCHED : constant := 16#00010000#;  --  /usr/include/pcre2.h:185
   PCRE2_SUBSTITUTE_REPLACEMENT_ONLY : constant := 16#00020000#;  --  /usr/include/pcre2.h:186

   PCRE2_CONVERT_UTF : constant := 16#00000001#;  --  /usr/include/pcre2.h:190
   PCRE2_CONVERT_NO_UTF_CHECK : constant := 16#00000002#;  --  /usr/include/pcre2.h:191
   PCRE2_CONVERT_POSIX_BASIC : constant := 16#00000004#;  --  /usr/include/pcre2.h:192
   PCRE2_CONVERT_POSIX_EXTENDED : constant := 16#00000008#;  --  /usr/include/pcre2.h:193
   PCRE2_CONVERT_GLOB : constant := 16#00000010#;  --  /usr/include/pcre2.h:194
   PCRE2_CONVERT_GLOB_NO_WILD_SEPARATOR : constant := 16#00000030#;  --  /usr/include/pcre2.h:195
   PCRE2_CONVERT_GLOB_NO_STARSTAR : constant := 16#00000050#;  --  /usr/include/pcre2.h:196

   PCRE2_NEWLINE_CR : constant := 1;  --  /usr/include/pcre2.h:202
   PCRE2_NEWLINE_LF : constant := 2;  --  /usr/include/pcre2.h:203
   PCRE2_NEWLINE_CRLF : constant := 3;  --  /usr/include/pcre2.h:204
   PCRE2_NEWLINE_ANY : constant := 4;  --  /usr/include/pcre2.h:205
   PCRE2_NEWLINE_ANYCRLF : constant := 5;  --  /usr/include/pcre2.h:206
   PCRE2_NEWLINE_NUL : constant := 6;  --  /usr/include/pcre2.h:207

   PCRE2_BSR_UNICODE : constant := 1;  --  /usr/include/pcre2.h:209
   PCRE2_BSR_ANYCRLF : constant := 2;  --  /usr/include/pcre2.h:210

   PCRE2_ERROR_END_BACKSLASH : constant := 101;  --  /usr/include/pcre2.h:215
   PCRE2_ERROR_END_BACKSLASH_C : constant := 102;  --  /usr/include/pcre2.h:216
   PCRE2_ERROR_UNKNOWN_ESCAPE : constant := 103;  --  /usr/include/pcre2.h:217
   PCRE2_ERROR_QUANTIFIER_OUT_OF_ORDER : constant := 104;  --  /usr/include/pcre2.h:218
   PCRE2_ERROR_QUANTIFIER_TOO_BIG : constant := 105;  --  /usr/include/pcre2.h:219
   PCRE2_ERROR_MISSING_SQUARE_BRACKET : constant := 106;  --  /usr/include/pcre2.h:220
   PCRE2_ERROR_ESCAPE_INVALID_IN_CLASS : constant := 107;  --  /usr/include/pcre2.h:221
   PCRE2_ERROR_CLASS_RANGE_ORDER : constant := 108;  --  /usr/include/pcre2.h:222
   PCRE2_ERROR_QUANTIFIER_INVALID : constant := 109;  --  /usr/include/pcre2.h:223
   PCRE2_ERROR_INTERNAL_UNEXPECTED_REPEAT : constant := 110;  --  /usr/include/pcre2.h:224
   PCRE2_ERROR_INVALID_AFTER_PARENS_QUERY : constant := 111;  --  /usr/include/pcre2.h:225
   PCRE2_ERROR_POSIX_CLASS_NOT_IN_CLASS : constant := 112;  --  /usr/include/pcre2.h:226
   PCRE2_ERROR_POSIX_NO_SUPPORT_COLLATING : constant := 113;  --  /usr/include/pcre2.h:227
   PCRE2_ERROR_MISSING_CLOSING_PARENTHESIS : constant := 114;  --  /usr/include/pcre2.h:228
   PCRE2_ERROR_BAD_SUBPATTERN_REFERENCE : constant := 115;  --  /usr/include/pcre2.h:229
   PCRE2_ERROR_NULL_PATTERN : constant := 116;  --  /usr/include/pcre2.h:230
   PCRE2_ERROR_BAD_OPTIONS : constant := 117;  --  /usr/include/pcre2.h:231
   PCRE2_ERROR_MISSING_COMMENT_CLOSING : constant := 118;  --  /usr/include/pcre2.h:232
   PCRE2_ERROR_PARENTHESES_NEST_TOO_DEEP : constant := 119;  --  /usr/include/pcre2.h:233
   PCRE2_ERROR_PATTERN_TOO_LARGE : constant := 120;  --  /usr/include/pcre2.h:234
   PCRE2_ERROR_HEAP_FAILED : constant := 121;  --  /usr/include/pcre2.h:235
   PCRE2_ERROR_UNMATCHED_CLOSING_PARENTHESIS : constant := 122;  --  /usr/include/pcre2.h:236
   PCRE2_ERROR_INTERNAL_CODE_OVERFLOW : constant := 123;  --  /usr/include/pcre2.h:237
   PCRE2_ERROR_MISSING_CONDITION_CLOSING : constant := 124;  --  /usr/include/pcre2.h:238
   PCRE2_ERROR_LOOKBEHIND_NOT_FIXED_LENGTH : constant := 125;  --  /usr/include/pcre2.h:239
   PCRE2_ERROR_ZERO_RELATIVE_REFERENCE : constant := 126;  --  /usr/include/pcre2.h:240
   PCRE2_ERROR_TOO_MANY_CONDITION_BRANCHES : constant := 127;  --  /usr/include/pcre2.h:241
   PCRE2_ERROR_CONDITION_ASSERTION_EXPECTED : constant := 128;  --  /usr/include/pcre2.h:242
   PCRE2_ERROR_BAD_RELATIVE_REFERENCE : constant := 129;  --  /usr/include/pcre2.h:243
   PCRE2_ERROR_UNKNOWN_POSIX_CLASS : constant := 130;  --  /usr/include/pcre2.h:244
   PCRE2_ERROR_INTERNAL_STUDY_ERROR : constant := 131;  --  /usr/include/pcre2.h:245
   PCRE2_ERROR_UNICODE_NOT_SUPPORTED : constant := 132;  --  /usr/include/pcre2.h:246
   PCRE2_ERROR_PARENTHESES_STACK_CHECK : constant := 133;  --  /usr/include/pcre2.h:247
   PCRE2_ERROR_CODE_POINT_TOO_BIG : constant := 134;  --  /usr/include/pcre2.h:248
   PCRE2_ERROR_LOOKBEHIND_TOO_COMPLICATED : constant := 135;  --  /usr/include/pcre2.h:249
   PCRE2_ERROR_LOOKBEHIND_INVALID_BACKSLASH_C : constant := 136;  --  /usr/include/pcre2.h:250
   PCRE2_ERROR_UNSUPPORTED_ESCAPE_SEQUENCE : constant := 137;  --  /usr/include/pcre2.h:251
   PCRE2_ERROR_CALLOUT_NUMBER_TOO_BIG : constant := 138;  --  /usr/include/pcre2.h:252
   PCRE2_ERROR_MISSING_CALLOUT_CLOSING : constant := 139;  --  /usr/include/pcre2.h:253
   PCRE2_ERROR_ESCAPE_INVALID_IN_VERB : constant := 140;  --  /usr/include/pcre2.h:254
   PCRE2_ERROR_UNRECOGNIZED_AFTER_QUERY_P : constant := 141;  --  /usr/include/pcre2.h:255
   PCRE2_ERROR_MISSING_NAME_TERMINATOR : constant := 142;  --  /usr/include/pcre2.h:256
   PCRE2_ERROR_DUPLICATE_SUBPATTERN_NAME : constant := 143;  --  /usr/include/pcre2.h:257
   PCRE2_ERROR_INVALID_SUBPATTERN_NAME : constant := 144;  --  /usr/include/pcre2.h:258
   PCRE2_ERROR_UNICODE_PROPERTIES_UNAVAILABLE : constant := 145;  --  /usr/include/pcre2.h:259
   PCRE2_ERROR_MALFORMED_UNICODE_PROPERTY : constant := 146;  --  /usr/include/pcre2.h:260
   PCRE2_ERROR_UNKNOWN_UNICODE_PROPERTY : constant := 147;  --  /usr/include/pcre2.h:261
   PCRE2_ERROR_SUBPATTERN_NAME_TOO_LONG : constant := 148;  --  /usr/include/pcre2.h:262
   PCRE2_ERROR_TOO_MANY_NAMED_SUBPATTERNS : constant := 149;  --  /usr/include/pcre2.h:263
   PCRE2_ERROR_CLASS_INVALID_RANGE : constant := 150;  --  /usr/include/pcre2.h:264
   PCRE2_ERROR_OCTAL_BYTE_TOO_BIG : constant := 151;  --  /usr/include/pcre2.h:265
   PCRE2_ERROR_INTERNAL_OVERRAN_WORKSPACE : constant := 152;  --  /usr/include/pcre2.h:266
   PCRE2_ERROR_INTERNAL_MISSING_SUBPATTERN : constant := 153;  --  /usr/include/pcre2.h:267
   PCRE2_ERROR_DEFINE_TOO_MANY_BRANCHES : constant := 154;  --  /usr/include/pcre2.h:268
   PCRE2_ERROR_BACKSLASH_O_MISSING_BRACE : constant := 155;  --  /usr/include/pcre2.h:269
   PCRE2_ERROR_INTERNAL_UNKNOWN_NEWLINE : constant := 156;  --  /usr/include/pcre2.h:270
   PCRE2_ERROR_BACKSLASH_G_SYNTAX : constant := 157;  --  /usr/include/pcre2.h:271
   PCRE2_ERROR_PARENS_QUERY_R_MISSING_CLOSING : constant := 158;  --  /usr/include/pcre2.h:272

   PCRE2_ERROR_VERB_ARGUMENT_NOT_ALLOWED : constant := 159;  --  /usr/include/pcre2.h:274
   PCRE2_ERROR_VERB_UNKNOWN : constant := 160;  --  /usr/include/pcre2.h:275
   PCRE2_ERROR_SUBPATTERN_NUMBER_TOO_BIG : constant := 161;  --  /usr/include/pcre2.h:276
   PCRE2_ERROR_SUBPATTERN_NAME_EXPECTED : constant := 162;  --  /usr/include/pcre2.h:277
   PCRE2_ERROR_INTERNAL_PARSED_OVERFLOW : constant := 163;  --  /usr/include/pcre2.h:278
   PCRE2_ERROR_INVALID_OCTAL : constant := 164;  --  /usr/include/pcre2.h:279
   PCRE2_ERROR_SUBPATTERN_NAMES_MISMATCH : constant := 165;  --  /usr/include/pcre2.h:280
   PCRE2_ERROR_MARK_MISSING_ARGUMENT : constant := 166;  --  /usr/include/pcre2.h:281
   PCRE2_ERROR_INVALID_HEXADECIMAL : constant := 167;  --  /usr/include/pcre2.h:282
   PCRE2_ERROR_BACKSLASH_C_SYNTAX : constant := 168;  --  /usr/include/pcre2.h:283
   PCRE2_ERROR_BACKSLASH_K_SYNTAX : constant := 169;  --  /usr/include/pcre2.h:284
   PCRE2_ERROR_INTERNAL_BAD_CODE_LOOKBEHINDS : constant := 170;  --  /usr/include/pcre2.h:285
   PCRE2_ERROR_BACKSLASH_N_IN_CLASS : constant := 171;  --  /usr/include/pcre2.h:286
   PCRE2_ERROR_CALLOUT_STRING_TOO_LONG : constant := 172;  --  /usr/include/pcre2.h:287
   PCRE2_ERROR_UNICODE_DISALLOWED_CODE_POINT : constant := 173;  --  /usr/include/pcre2.h:288
   PCRE2_ERROR_UTF_IS_DISABLED : constant := 174;  --  /usr/include/pcre2.h:289
   PCRE2_ERROR_UCP_IS_DISABLED : constant := 175;  --  /usr/include/pcre2.h:290
   PCRE2_ERROR_VERB_NAME_TOO_LONG : constant := 176;  --  /usr/include/pcre2.h:291
   PCRE2_ERROR_BACKSLASH_U_CODE_POINT_TOO_BIG : constant := 177;  --  /usr/include/pcre2.h:292
   PCRE2_ERROR_MISSING_OCTAL_OR_HEX_DIGITS : constant := 178;  --  /usr/include/pcre2.h:293
   PCRE2_ERROR_VERSION_CONDITION_SYNTAX : constant := 179;  --  /usr/include/pcre2.h:294
   PCRE2_ERROR_INTERNAL_BAD_CODE_AUTO_POSSESS : constant := 180;  --  /usr/include/pcre2.h:295
   PCRE2_ERROR_CALLOUT_NO_STRING_DELIMITER : constant := 181;  --  /usr/include/pcre2.h:296
   PCRE2_ERROR_CALLOUT_BAD_STRING_DELIMITER : constant := 182;  --  /usr/include/pcre2.h:297
   PCRE2_ERROR_BACKSLASH_C_CALLER_DISABLED : constant := 183;  --  /usr/include/pcre2.h:298
   PCRE2_ERROR_QUERY_BARJX_NEST_TOO_DEEP : constant := 184;  --  /usr/include/pcre2.h:299
   PCRE2_ERROR_BACKSLASH_C_LIBRARY_DISABLED : constant := 185;  --  /usr/include/pcre2.h:300
   PCRE2_ERROR_PATTERN_TOO_COMPLICATED : constant := 186;  --  /usr/include/pcre2.h:301
   PCRE2_ERROR_LOOKBEHIND_TOO_LONG : constant := 187;  --  /usr/include/pcre2.h:302
   PCRE2_ERROR_PATTERN_STRING_TOO_LONG : constant := 188;  --  /usr/include/pcre2.h:303
   PCRE2_ERROR_INTERNAL_BAD_CODE : constant := 189;  --  /usr/include/pcre2.h:304
   PCRE2_ERROR_INTERNAL_BAD_CODE_IN_SKIP : constant := 190;  --  /usr/include/pcre2.h:305
   PCRE2_ERROR_NO_SURROGATES_IN_UTF16 : constant := 191;  --  /usr/include/pcre2.h:306
   PCRE2_ERROR_BAD_LITERAL_OPTIONS : constant := 192;  --  /usr/include/pcre2.h:307
   PCRE2_ERROR_SUPPORTED_ONLY_IN_UNICODE : constant := 193;  --  /usr/include/pcre2.h:308
   PCRE2_ERROR_INVALID_HYPHEN_IN_OPTIONS : constant := 194;  --  /usr/include/pcre2.h:309
   PCRE2_ERROR_ALPHA_ASSERTION_UNKNOWN : constant := 195;  --  /usr/include/pcre2.h:310
   PCRE2_ERROR_SCRIPT_RUN_NOT_AVAILABLE : constant := 196;  --  /usr/include/pcre2.h:311
   PCRE2_ERROR_TOO_MANY_CAPTURES : constant := 197;  --  /usr/include/pcre2.h:312
   PCRE2_ERROR_CONDITION_ATOMIC_ASSERTION_EXPECTED : constant := 198;  --  /usr/include/pcre2.h:313

   PCRE2_ERROR_NOMATCH : constant := (-1);  --  /usr/include/pcre2.h:318
   PCRE2_ERROR_PARTIAL : constant := (-2);  --  /usr/include/pcre2.h:319

   PCRE2_ERROR_UTF8_ERR1 : constant := (-3);  --  /usr/include/pcre2.h:323
   PCRE2_ERROR_UTF8_ERR2 : constant := (-4);  --  /usr/include/pcre2.h:324
   PCRE2_ERROR_UTF8_ERR3 : constant := (-5);  --  /usr/include/pcre2.h:325
   PCRE2_ERROR_UTF8_ERR4 : constant := (-6);  --  /usr/include/pcre2.h:326
   PCRE2_ERROR_UTF8_ERR5 : constant := (-7);  --  /usr/include/pcre2.h:327
   PCRE2_ERROR_UTF8_ERR6 : constant := (-8);  --  /usr/include/pcre2.h:328
   PCRE2_ERROR_UTF8_ERR7 : constant := (-9);  --  /usr/include/pcre2.h:329
   PCRE2_ERROR_UTF8_ERR8 : constant := (-10);  --  /usr/include/pcre2.h:330
   PCRE2_ERROR_UTF8_ERR9 : constant := (-11);  --  /usr/include/pcre2.h:331
   PCRE2_ERROR_UTF8_ERR10 : constant := (-12);  --  /usr/include/pcre2.h:332
   PCRE2_ERROR_UTF8_ERR11 : constant := (-13);  --  /usr/include/pcre2.h:333
   PCRE2_ERROR_UTF8_ERR12 : constant := (-14);  --  /usr/include/pcre2.h:334
   PCRE2_ERROR_UTF8_ERR13 : constant := (-15);  --  /usr/include/pcre2.h:335
   PCRE2_ERROR_UTF8_ERR14 : constant := (-16);  --  /usr/include/pcre2.h:336
   PCRE2_ERROR_UTF8_ERR15 : constant := (-17);  --  /usr/include/pcre2.h:337
   PCRE2_ERROR_UTF8_ERR16 : constant := (-18);  --  /usr/include/pcre2.h:338
   PCRE2_ERROR_UTF8_ERR17 : constant := (-19);  --  /usr/include/pcre2.h:339
   PCRE2_ERROR_UTF8_ERR18 : constant := (-20);  --  /usr/include/pcre2.h:340
   PCRE2_ERROR_UTF8_ERR19 : constant := (-21);  --  /usr/include/pcre2.h:341
   PCRE2_ERROR_UTF8_ERR20 : constant := (-22);  --  /usr/include/pcre2.h:342
   PCRE2_ERROR_UTF8_ERR21 : constant := (-23);  --  /usr/include/pcre2.h:343

   PCRE2_ERROR_UTF16_ERR1 : constant := (-24);  --  /usr/include/pcre2.h:347
   PCRE2_ERROR_UTF16_ERR2 : constant := (-25);  --  /usr/include/pcre2.h:348
   PCRE2_ERROR_UTF16_ERR3 : constant := (-26);  --  /usr/include/pcre2.h:349

   PCRE2_ERROR_UTF32_ERR1 : constant := (-27);  --  /usr/include/pcre2.h:353
   PCRE2_ERROR_UTF32_ERR2 : constant := (-28);  --  /usr/include/pcre2.h:354

   PCRE2_ERROR_BADDATA : constant := (-29);  --  /usr/include/pcre2.h:361
   PCRE2_ERROR_MIXEDTABLES : constant := (-30);  --  /usr/include/pcre2.h:362
   PCRE2_ERROR_BADMAGIC : constant := (-31);  --  /usr/include/pcre2.h:363
   PCRE2_ERROR_BADMODE : constant := (-32);  --  /usr/include/pcre2.h:364
   PCRE2_ERROR_BADOFFSET : constant := (-33);  --  /usr/include/pcre2.h:365
   PCRE2_ERROR_BADOPTION : constant := (-34);  --  /usr/include/pcre2.h:366
   PCRE2_ERROR_BADREPLACEMENT : constant := (-35);  --  /usr/include/pcre2.h:367
   PCRE2_ERROR_BADUTFOFFSET : constant := (-36);  --  /usr/include/pcre2.h:368
   PCRE2_ERROR_CALLOUT : constant := (-37);  --  /usr/include/pcre2.h:369
   PCRE2_ERROR_DFA_BADRESTART : constant := (-38);  --  /usr/include/pcre2.h:370
   PCRE2_ERROR_DFA_RECURSE : constant := (-39);  --  /usr/include/pcre2.h:371
   PCRE2_ERROR_DFA_UCOND : constant := (-40);  --  /usr/include/pcre2.h:372
   PCRE2_ERROR_DFA_UFUNC : constant := (-41);  --  /usr/include/pcre2.h:373
   PCRE2_ERROR_DFA_UITEM : constant := (-42);  --  /usr/include/pcre2.h:374
   PCRE2_ERROR_DFA_WSSIZE : constant := (-43);  --  /usr/include/pcre2.h:375
   PCRE2_ERROR_INTERNAL : constant := (-44);  --  /usr/include/pcre2.h:376
   PCRE2_ERROR_JIT_BADOPTION : constant := (-45);  --  /usr/include/pcre2.h:377
   PCRE2_ERROR_JIT_STACKLIMIT : constant := (-46);  --  /usr/include/pcre2.h:378
   PCRE2_ERROR_MATCHLIMIT : constant := (-47);  --  /usr/include/pcre2.h:379
   PCRE2_ERROR_NOMEMORY : constant := (-48);  --  /usr/include/pcre2.h:380
   PCRE2_ERROR_NOSUBSTRING : constant := (-49);  --  /usr/include/pcre2.h:381
   PCRE2_ERROR_NOUNIQUESUBSTRING : constant := (-50);  --  /usr/include/pcre2.h:382
   PCRE2_ERROR_NULL : constant := (-51);  --  /usr/include/pcre2.h:383
   PCRE2_ERROR_RECURSELOOP : constant := (-52);  --  /usr/include/pcre2.h:384
   PCRE2_ERROR_DEPTHLIMIT : constant := (-53);  --  /usr/include/pcre2.h:385
   PCRE2_ERROR_RECURSIONLIMIT : constant := (-53);  --  /usr/include/pcre2.h:386
   PCRE2_ERROR_UNAVAILABLE : constant := (-54);  --  /usr/include/pcre2.h:387
   PCRE2_ERROR_UNSET : constant := (-55);  --  /usr/include/pcre2.h:388
   PCRE2_ERROR_BADOFFSETLIMIT : constant := (-56);  --  /usr/include/pcre2.h:389
   PCRE2_ERROR_BADREPESCAPE : constant := (-57);  --  /usr/include/pcre2.h:390
   PCRE2_ERROR_REPMISSINGBRACE : constant := (-58);  --  /usr/include/pcre2.h:391
   PCRE2_ERROR_BADSUBSTITUTION : constant := (-59);  --  /usr/include/pcre2.h:392
   PCRE2_ERROR_BADSUBSPATTERN : constant := (-60);  --  /usr/include/pcre2.h:393
   PCRE2_ERROR_TOOMANYREPLACE : constant := (-61);  --  /usr/include/pcre2.h:394
   PCRE2_ERROR_BADSERIALIZEDDATA : constant := (-62);  --  /usr/include/pcre2.h:395
   PCRE2_ERROR_HEAPLIMIT : constant := (-63);  --  /usr/include/pcre2.h:396
   PCRE2_ERROR_CONVERT_SYNTAX : constant := (-64);  --  /usr/include/pcre2.h:397
   PCRE2_ERROR_INTERNAL_DUPMATCH : constant := (-65);  --  /usr/include/pcre2.h:398
   PCRE2_ERROR_DFA_UINVALID_UTF : constant := (-66);  --  /usr/include/pcre2.h:399

   PCRE2_INFO_ALLOPTIONS : constant := 0;  --  /usr/include/pcre2.h:404
   PCRE2_INFO_ARGOPTIONS : constant := 1;  --  /usr/include/pcre2.h:405
   PCRE2_INFO_BACKREFMAX : constant := 2;  --  /usr/include/pcre2.h:406
   PCRE2_INFO_BSR : constant := 3;  --  /usr/include/pcre2.h:407
   PCRE2_INFO_CAPTURECOUNT : constant := 4;  --  /usr/include/pcre2.h:408
   PCRE2_INFO_FIRSTCODEUNIT : constant := 5;  --  /usr/include/pcre2.h:409
   PCRE2_INFO_FIRSTCODETYPE : constant := 6;  --  /usr/include/pcre2.h:410
   PCRE2_INFO_FIRSTBITMAP : constant := 7;  --  /usr/include/pcre2.h:411
   PCRE2_INFO_HASCRORLF : constant := 8;  --  /usr/include/pcre2.h:412
   PCRE2_INFO_JCHANGED : constant := 9;  --  /usr/include/pcre2.h:413
   PCRE2_INFO_JITSIZE : constant := 10;  --  /usr/include/pcre2.h:414
   PCRE2_INFO_LASTCODEUNIT : constant := 11;  --  /usr/include/pcre2.h:415
   PCRE2_INFO_LASTCODETYPE : constant := 12;  --  /usr/include/pcre2.h:416
   PCRE2_INFO_MATCHEMPTY : constant := 13;  --  /usr/include/pcre2.h:417
   PCRE2_INFO_MATCHLIMIT : constant := 14;  --  /usr/include/pcre2.h:418
   PCRE2_INFO_MAXLOOKBEHIND : constant := 15;  --  /usr/include/pcre2.h:419
   PCRE2_INFO_MINLENGTH : constant := 16;  --  /usr/include/pcre2.h:420
   PCRE2_INFO_NAMECOUNT : constant := 17;  --  /usr/include/pcre2.h:421
   PCRE2_INFO_NAMEENTRYSIZE : constant := 18;  --  /usr/include/pcre2.h:422
   PCRE2_INFO_NAMETABLE : constant := 19;  --  /usr/include/pcre2.h:423
   PCRE2_INFO_NEWLINE : constant := 20;  --  /usr/include/pcre2.h:424
   PCRE2_INFO_DEPTHLIMIT : constant := 21;  --  /usr/include/pcre2.h:425
   PCRE2_INFO_RECURSIONLIMIT : constant := 21;  --  /usr/include/pcre2.h:426
   PCRE2_INFO_SIZE : constant := 22;  --  /usr/include/pcre2.h:427
   PCRE2_INFO_HASBACKSLASHC : constant := 23;  --  /usr/include/pcre2.h:428
   PCRE2_INFO_FRAMESIZE : constant := 24;  --  /usr/include/pcre2.h:429
   PCRE2_INFO_HEAPLIMIT : constant := 25;  --  /usr/include/pcre2.h:430
   PCRE2_INFO_EXTRAOPTIONS : constant := 26;  --  /usr/include/pcre2.h:431

   PCRE2_CONFIG_BSR : constant := 0;  --  /usr/include/pcre2.h:435
   PCRE2_CONFIG_JIT : constant := 1;  --  /usr/include/pcre2.h:436
   PCRE2_CONFIG_JITTARGET : constant := 2;  --  /usr/include/pcre2.h:437
   PCRE2_CONFIG_LINKSIZE : constant := 3;  --  /usr/include/pcre2.h:438
   PCRE2_CONFIG_MATCHLIMIT : constant := 4;  --  /usr/include/pcre2.h:439
   PCRE2_CONFIG_NEWLINE : constant := 5;  --  /usr/include/pcre2.h:440
   PCRE2_CONFIG_PARENSLIMIT : constant := 6;  --  /usr/include/pcre2.h:441
   PCRE2_CONFIG_DEPTHLIMIT : constant := 7;  --  /usr/include/pcre2.h:442
   PCRE2_CONFIG_RECURSIONLIMIT : constant := 7;  --  /usr/include/pcre2.h:443
   PCRE2_CONFIG_STACKRECURSE : constant := 8;  --  /usr/include/pcre2.h:444
   PCRE2_CONFIG_UNICODE : constant := 9;  --  /usr/include/pcre2.h:445
   PCRE2_CONFIG_UNICODE_VERSION : constant := 10;  --  /usr/include/pcre2.h:446
   PCRE2_CONFIG_VERSION : constant := 11;  --  /usr/include/pcre2.h:447
   PCRE2_CONFIG_HEAPLIMIT : constant := 12;  --  /usr/include/pcre2.h:448
   PCRE2_CONFIG_NEVER_BACKSLASH_C : constant := 13;  --  /usr/include/pcre2.h:449
   PCRE2_CONFIG_COMPILED_WIDTHS : constant := 14;  --  /usr/include/pcre2.h:450
   PCRE2_CONFIG_TABLES_LENGTH : constant := 15;  --  /usr/include/pcre2.h:451
   --  unsupported macro: PCRE2_SIZE size_t
   --  unsupported macro: PCRE2_SIZE_MAX SIZE_MAX
   --  unsupported macro: PCRE2_ZERO_TERMINATED (~(PCRE2_SIZE)0)
   --  unsupported macro: PCRE2_UNSET (~(PCRE2_SIZE)0)

   PCRE2_CALLOUT_STARTMATCH : constant := 16#00000001#;  --  /usr/include/pcre2.h:510
   PCRE2_CALLOUT_BACKTRACK : constant := 16#00000002#;  --  /usr/include/pcre2.h:511
   --  unsupported macro: PCRE2_CONVERT_FUNCTIONS PCRE2_EXP_DECL int PCRE2_CALL_CONVENTION pcre2_pattern_convert(PCRE2_SPTR, PCRE2_SIZE, uint32_t, PCRE2_UCHAR **, PCRE2_SIZE *, pcre2_convert_context *); PCRE2_EXP_DECL void PCRE2_CALL_CONVENTION pcre2_converted_pattern_free(PCRE2_UCHAR *);
   --  unsupported macro: PCRE2_JOIN(a,b) a ## b
   --  arg-macro: procedure PCRE2_GLUE (a, b)
   --    PCRE2_JOIN(a,b)
   --  unsupported macro: PCRE2_UCHAR PCRE2_SUFFIX(PCRE2_UCHAR)
   --  unsupported macro: PCRE2_SPTR PCRE2_SUFFIX(PCRE2_SPTR)
   --  unsupported macro: pcre2_code PCRE2_SUFFIX(pcre2_code_)
   --  unsupported macro: pcre2_jit_callback PCRE2_SUFFIX(pcre2_jit_callback_)
   --  unsupported macro: pcre2_jit_stack PCRE2_SUFFIX(pcre2_jit_stack_)
   --  unsupported macro: pcre2_real_code PCRE2_SUFFIX(pcre2_real_code_)
   --  unsupported macro: pcre2_real_general_context PCRE2_SUFFIX(pcre2_real_general_context_)
   --  unsupported macro: pcre2_real_compile_context PCRE2_SUFFIX(pcre2_real_compile_context_)
   --  unsupported macro: pcre2_real_convert_context PCRE2_SUFFIX(pcre2_real_convert_context_)
   --  unsupported macro: pcre2_real_match_context PCRE2_SUFFIX(pcre2_real_match_context_)
   --  unsupported macro: pcre2_real_jit_stack PCRE2_SUFFIX(pcre2_real_jit_stack_)
   --  unsupported macro: pcre2_real_match_data PCRE2_SUFFIX(pcre2_real_match_data_)
   --  unsupported macro: pcre2_callout_block PCRE2_SUFFIX(pcre2_callout_block_)
   --  unsupported macro: pcre2_callout_enumerate_block PCRE2_SUFFIX(pcre2_callout_enumerate_block_)
   --  unsupported macro: pcre2_substitute_callout_block PCRE2_SUFFIX(pcre2_substitute_callout_block_)
   --  unsupported macro: pcre2_general_context PCRE2_SUFFIX(pcre2_general_context_)
   --  unsupported macro: pcre2_compile_context PCRE2_SUFFIX(pcre2_compile_context_)
   --  unsupported macro: pcre2_convert_context PCRE2_SUFFIX(pcre2_convert_context_)
   --  unsupported macro: pcre2_match_context PCRE2_SUFFIX(pcre2_match_context_)
   --  unsupported macro: pcre2_match_data PCRE2_SUFFIX(pcre2_match_data_)
   --  unsupported macro: pcre2_callout_enumerate PCRE2_SUFFIX(pcre2_callout_enumerate_)
   --  unsupported macro: pcre2_code_copy PCRE2_SUFFIX(pcre2_code_copy_)
   --  unsupported macro: pcre2_code_copy_with_tables PCRE2_SUFFIX(pcre2_code_copy_with_tables_)
   --  unsupported macro: pcre2_code_free PCRE2_SUFFIX(pcre2_code_free_)
   --  unsupported macro: pcre2_compile PCRE2_SUFFIX(pcre2_compile_)
   --  unsupported macro: pcre2_compile_context_copy PCRE2_SUFFIX(pcre2_compile_context_copy_)
   --  unsupported macro: pcre2_compile_context_create PCRE2_SUFFIX(pcre2_compile_context_create_)
   --  unsupported macro: pcre2_compile_context_free PCRE2_SUFFIX(pcre2_compile_context_free_)
   --  unsupported macro: pcre2_config PCRE2_SUFFIX(pcre2_config_)
   --  unsupported macro: pcre2_convert_context_copy PCRE2_SUFFIX(pcre2_convert_context_copy_)
   --  unsupported macro: pcre2_convert_context_create PCRE2_SUFFIX(pcre2_convert_context_create_)
   --  unsupported macro: pcre2_convert_context_free PCRE2_SUFFIX(pcre2_convert_context_free_)
   --  unsupported macro: pcre2_converted_pattern_free PCRE2_SUFFIX(pcre2_converted_pattern_free_)
   --  unsupported macro: pcre2_dfa_match PCRE2_SUFFIX(pcre2_dfa_match_)
   --  unsupported macro: pcre2_general_context_copy PCRE2_SUFFIX(pcre2_general_context_copy_)
   --  unsupported macro: pcre2_general_context_create PCRE2_SUFFIX(pcre2_general_context_create_)
   --  unsupported macro: pcre2_general_context_free PCRE2_SUFFIX(pcre2_general_context_free_)
   --  unsupported macro: pcre2_get_error_message PCRE2_SUFFIX(pcre2_get_error_message_)
   --  unsupported macro: pcre2_get_mark PCRE2_SUFFIX(pcre2_get_mark_)
   --  unsupported macro: pcre2_get_match_data_size PCRE2_SUFFIX(pcre2_get_match_data_size_)
   --  unsupported macro: pcre2_get_ovector_pointer PCRE2_SUFFIX(pcre2_get_ovector_pointer_)
   --  unsupported macro: pcre2_get_ovector_count PCRE2_SUFFIX(pcre2_get_ovector_count_)
   --  unsupported macro: pcre2_get_startchar PCRE2_SUFFIX(pcre2_get_startchar_)
   --  unsupported macro: pcre2_jit_compile PCRE2_SUFFIX(pcre2_jit_compile_)
   --  unsupported macro: pcre2_jit_match PCRE2_SUFFIX(pcre2_jit_match_)
   --  unsupported macro: pcre2_jit_free_unused_memory PCRE2_SUFFIX(pcre2_jit_free_unused_memory_)
   --  unsupported macro: pcre2_jit_stack_assign PCRE2_SUFFIX(pcre2_jit_stack_assign_)
   --  unsupported macro: pcre2_jit_stack_create PCRE2_SUFFIX(pcre2_jit_stack_create_)
   --  unsupported macro: pcre2_jit_stack_free PCRE2_SUFFIX(pcre2_jit_stack_free_)
   --  unsupported macro: pcre2_maketables PCRE2_SUFFIX(pcre2_maketables_)
   --  unsupported macro: pcre2_maketables_free PCRE2_SUFFIX(pcre2_maketables_free_)
   --  unsupported macro: pcre2_match PCRE2_SUFFIX(pcre2_match_)
   --  unsupported macro: pcre2_match_context_copy PCRE2_SUFFIX(pcre2_match_context_copy_)
   --  unsupported macro: pcre2_match_context_create PCRE2_SUFFIX(pcre2_match_context_create_)
   --  unsupported macro: pcre2_match_context_free PCRE2_SUFFIX(pcre2_match_context_free_)
   --  unsupported macro: pcre2_match_data_create PCRE2_SUFFIX(pcre2_match_data_create_)
   --  unsupported macro: pcre2_match_data_create_from_pattern PCRE2_SUFFIX(pcre2_match_data_create_from_pattern_)
   --  unsupported macro: pcre2_match_data_free PCRE2_SUFFIX(pcre2_match_data_free_)
   --  unsupported macro: pcre2_pattern_convert PCRE2_SUFFIX(pcre2_pattern_convert_)
   --  unsupported macro: pcre2_pattern_info PCRE2_SUFFIX(pcre2_pattern_info_)
   --  unsupported macro: pcre2_serialize_decode PCRE2_SUFFIX(pcre2_serialize_decode_)
   --  unsupported macro: pcre2_serialize_encode PCRE2_SUFFIX(pcre2_serialize_encode_)
   --  unsupported macro: pcre2_serialize_free PCRE2_SUFFIX(pcre2_serialize_free_)
   --  unsupported macro: pcre2_serialize_get_number_of_codes PCRE2_SUFFIX(pcre2_serialize_get_number_of_codes_)
   --  unsupported macro: pcre2_set_bsr PCRE2_SUFFIX(pcre2_set_bsr_)
   --  unsupported macro: pcre2_set_callout PCRE2_SUFFIX(pcre2_set_callout_)
   --  unsupported macro: pcre2_set_character_tables PCRE2_SUFFIX(pcre2_set_character_tables_)
   --  unsupported macro: pcre2_set_compile_extra_options PCRE2_SUFFIX(pcre2_set_compile_extra_options_)
   --  unsupported macro: pcre2_set_compile_recursion_guard PCRE2_SUFFIX(pcre2_set_compile_recursion_guard_)
   --  unsupported macro: pcre2_set_depth_limit PCRE2_SUFFIX(pcre2_set_depth_limit_)
   --  unsupported macro: pcre2_set_glob_escape PCRE2_SUFFIX(pcre2_set_glob_escape_)
   --  unsupported macro: pcre2_set_glob_separator PCRE2_SUFFIX(pcre2_set_glob_separator_)
   --  unsupported macro: pcre2_set_heap_limit PCRE2_SUFFIX(pcre2_set_heap_limit_)
   --  unsupported macro: pcre2_set_match_limit PCRE2_SUFFIX(pcre2_set_match_limit_)
   --  unsupported macro: pcre2_set_max_pattern_length PCRE2_SUFFIX(pcre2_set_max_pattern_length_)
   --  unsupported macro: pcre2_set_newline PCRE2_SUFFIX(pcre2_set_newline_)
   --  unsupported macro: pcre2_set_parens_nest_limit PCRE2_SUFFIX(pcre2_set_parens_nest_limit_)
   --  unsupported macro: pcre2_set_offset_limit PCRE2_SUFFIX(pcre2_set_offset_limit_)
   --  unsupported macro: pcre2_set_substitute_callout PCRE2_SUFFIX(pcre2_set_substitute_callout_)
   --  unsupported macro: pcre2_substitute PCRE2_SUFFIX(pcre2_substitute_)
   --  unsupported macro: pcre2_substring_copy_byname PCRE2_SUFFIX(pcre2_substring_copy_byname_)
   --  unsupported macro: pcre2_substring_copy_bynumber PCRE2_SUFFIX(pcre2_substring_copy_bynumber_)
   --  unsupported macro: pcre2_substring_free PCRE2_SUFFIX(pcre2_substring_free_)
   --  unsupported macro: pcre2_substring_get_byname PCRE2_SUFFIX(pcre2_substring_get_byname_)
   --  unsupported macro: pcre2_substring_get_bynumber PCRE2_SUFFIX(pcre2_substring_get_bynumber_)
   --  unsupported macro: pcre2_substring_length_byname PCRE2_SUFFIX(pcre2_substring_length_byname_)
   --  unsupported macro: pcre2_substring_length_bynumber PCRE2_SUFFIX(pcre2_substring_length_bynumber_)
   --  unsupported macro: pcre2_substring_list_get PCRE2_SUFFIX(pcre2_substring_list_get_)
   --  unsupported macro: pcre2_substring_list_free PCRE2_SUFFIX(pcre2_substring_list_free_)
   --  unsupported macro: pcre2_substring_nametable_scan PCRE2_SUFFIX(pcre2_substring_nametable_scan_)
   --  unsupported macro: pcre2_substring_number_from_name PCRE2_SUFFIX(pcre2_substring_number_from_name_)
   --  unsupported macro: pcre2_set_recursion_limit PCRE2_SUFFIX(pcre2_set_recursion_limit_)
   --  unsupported macro: pcre2_set_recursion_memory_management PCRE2_SUFFIX(pcre2_set_recursion_memory_management_)
   --  arg-macro: procedure PCRE2_SUFFIX (a)
   --    PCRE2_GLUE(a, PCRE2_CODE_UNIT_WIDTH)

  --************************************************
  --*       Perl-Compatible Regular Expressions      *
  --************************************************ 

  -- This is the public header file for the PCRE library, second API, to be
  --#included by applications that call PCRE2 functions.
  --           Copyright (c) 2016-2020 University of Cambridge
  -------------------------------------------------------------------------------
  --Redistribution and use in source and binary forms, with or without
  --modification, are permitted provided that the following conditions are met:
  --    * Redistributions of source code must retain the above copyright notice,
  --      this list of conditions and the following disclaimer.
  --    * Redistributions in binary form must reproduce the above copyright
  --      notice, this list of conditions and the following disclaimer in the
  --      documentation and/or other materials provided with the distribution.
  --    * Neither the name of the University of Cambridge nor the names of its
  --      contributors may be used to endorse or promote products derived from
  --      this software without specific prior written permission.
  --THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  --AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  --IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  --ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
  --LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  --CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  --SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  --INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  --CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  --ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  --POSSIBILITY OF SUCH DAMAGE.
  -------------------------------------------------------------------------------
  -- 

  -- The current PCRE version information.  
  -- When an application links to a PCRE DLL in Windows, the symbols that are
  --imported have to be identified as such. When building PCRE2, the appropriate
  --export setting is defined in pcre2_internal.h, which includes this file. So we
  --don't change existing definitions of PCRE2_EXP_DECL.  

  -- By default, we use the standard "extern" declarations.  
  -- When compiling with the MSVC compiler, it is sometimes necessary to include
  --a "calling convention" before exported function names. (This is secondhand
  --information; I know nothing about MSVC myself). For example, something like
  --  void __cdecl function(....)
  --might be needed. In order so make this easy, all the exported functions have
  --PCRE2_CALL_CONVENTION just before their names. It is rarely needed; if not
  --set, we ensure here that it has no effect.  

  -- Have to include limits.h, stdlib.h, and inttypes.h to ensure that size_t and
  --uint8_t, UCHAR_MAX, etc are defined. Some systems that do have inttypes.h do
  --not have stdint.h, which is why we use inttypes.h, which according to the C
  --standard is a superset of stdint.h. If none of these headers are available,
  --the relevant values must be provided by some other means.  

  -- Allow for C++ users compiling this directly.  
  -- The following option bits can be passed to pcre2_compile(), pcre2_match(),
  --or pcre2_dfa_match(). PCRE2_NO_UTF_CHECK affects only the function to which it
  --is passed. Put these bits at the most significant end of the options word so
  --others can be added next to them  

  -- The following option bits can be passed only to pcre2_compile(). However,
  --they may affect compilation, JIT compilation, and/or interpretive execution.
  --The following tags indicate which:
  --C   alters what is compiled by pcre2_compile()
  --J   alters what is compiled by pcre2_jit_compile()
  --M   is inspected during pcre2_match() execution
  --D   is inspected during pcre2_dfa_match() execution
  -- 

  -- An additional compile options word is available in the compile context.  
  -- These are for pcre2_jit_compile().  
  -- These are for pcre2_match(), pcre2_dfa_match(), pcre2_jit_match(), and
  --pcre2_substitute(). Some are allowed only for one of the functions, and in
  --these cases it is noted below. Note that PCRE2_ANCHORED, PCRE2_ENDANCHORED and
  --PCRE2_NO_UTF_CHECK can also be passed to these functions (though
  --pcre2_jit_match() ignores the latter since it bypasses all sanity checks).  

  -- Options for pcre2_pattern_convert().  
  -- Newline and \R settings, for use in compile contexts. The newline values
  --must be kept in step with values set in config.h and both sets must all be
  --greater than zero.  

  -- Error codes for pcre2_compile(). Some of these are also used by
  --pcre2_pattern_convert().  

  -- Error 159 is obsolete and should now never occur  
  -- "Expected" matching error codes: no match and partial match.  
  -- Error codes for UTF-8 validity checks  
  -- Error codes for UTF-16 validity checks  
  -- Error codes for UTF-32 validity checks  
  -- Miscellaneous error codes for pcre2[_dfa]_match(), substring extraction
  --functions, context functions, and serializing functions. They are in numerical
  --order. Originally they were in alphabetical order too, but now that PCRE2 is
  --released, the numbers must not be changed.  

  -- Request types for pcre2_pattern_info()  
  -- Request types for pcre2_config().  
  -- Types for code units in patterns and subject strings.  
   subtype PCRE2_UCHAR8 is unsigned_char;  -- /usr/include/pcre2.h:456

   subtype PCRE2_UCHAR16 is unsigned_short;  -- /usr/include/pcre2.h:457

   subtype PCRE2_UCHAR32 is unsigned;  -- /usr/include/pcre2.h:458

   type PCRE2_SPTR8 is access all PCRE2_UCHAR8;  -- /usr/include/pcre2.h:460

   type PCRE2_SPTR16 is access all PCRE2_UCHAR16;  -- /usr/include/pcre2.h:461

   type PCRE2_SPTR32 is access all PCRE2_UCHAR32;  -- /usr/include/pcre2.h:462

  -- The PCRE2_SIZE type is used for all string lengths and offsets in PCRE2,
  --including pattern offsets for errors and subject offsets after a match. We
  --define special values to indicate zero-terminated strings and unset offsets in
  --the offset vector (ovector).  

  -- Generic types for opaque structures and JIT callback functions. These
  --declarations are defined in a macro that is expanded for each width later.  

  -- The structures for passing out data via callout functions. We use structures
  --so that new fields can be added on the end in future versions, without changing
  --the API of the function, thereby allowing old clients to work without
  --modification. Define the generic versions in a macro; the width-specific
  --versions are generated from this macro below.  

  -- Flags for the callout_flags field. These are cleared after a callout.  
  -- List the generic forms of all other functions in macros, which will be
  --expanded for each width below. Start with functions that give general
  --information.  

  -- Functions for manipulating contexts.  
  -- Functions concerned with compiling a pattern to PCRE internal code.  
  -- Functions that give information about a compiled pattern.  
  -- Functions for running a match and inspecting the result.  
  -- Convenience functions for handling matched substrings.  
  -- Functions for serializing / deserializing compiled patterns.  
  -- Convenience function for match + substitute.  
  -- Functions for converting pattern source strings.  
  -- Functions for JIT processing  
  -- Other miscellaneous functions.  
  -- Define macros that generate width-specific names from generic versions. The
  --three-level macro scheme is necessary to get the macros expanded when we want
  --them to be. First we get the width from PCRE2_LOCAL_WIDTH, which is used for
  --generating three versions of everything below. After that, PCRE2_SUFFIX will be
  --re-defined to use PCRE2_CODE_UNIT_WIDTH, for use when macros such as
  --pcre2_compile are called by application code.  

  -- Data types  
  -- Data blocks  
  -- Functions: the complete list in alphabetical order  
  -- Keep this old function name for backwards compatibility  
  -- Keep this obsolete function for backwards compatibility: it is now a noop.  
  -- Now generate all three sets of width-specific structures and function
  --prototypes.  

   type pcre2_real_general_context_8 is null record;   -- incomplete struct

   subtype pcre2_general_context_8 is pcre2_real_general_context_8;  -- /usr/include/pcre2.h:933

   type pcre2_real_compile_context_8 is null record;   -- incomplete struct

   subtype pcre2_compile_context_8 is pcre2_real_compile_context_8;  -- /usr/include/pcre2.h:933

   type pcre2_real_match_context_8 is null record;   -- incomplete struct

   subtype pcre2_match_context_8 is pcre2_real_match_context_8;  -- /usr/include/pcre2.h:933

   type pcre2_real_convert_context_8 is null record;   -- incomplete struct

   subtype pcre2_convert_context_8 is pcre2_real_convert_context_8;  -- /usr/include/pcre2.h:933

   type pcre2_real_code_8 is null record;   -- incomplete struct

   subtype pcre2_code_8 is pcre2_real_code_8;  -- /usr/include/pcre2.h:933

   type pcre2_real_match_data_8 is null record;   -- incomplete struct

   subtype pcre2_match_data_8 is pcre2_real_match_data_8;  -- /usr/include/pcre2.h:933

   type pcre2_real_jit_stack_8 is null record;   -- incomplete struct

   subtype pcre2_jit_stack_8 is pcre2_real_jit_stack_8;  -- /usr/include/pcre2.h:933

   type pcre2_jit_callback_8 is access function (arg1 : System.Address) return access pcre2_jit_stack_8
   with Convention => C;  -- /usr/include/pcre2.h:933

   type pcre2_callout_block_8 is record
      version : aliased unsigned;  -- /usr/include/pcre2.h:933
      callout_number : aliased unsigned;  -- /usr/include/pcre2.h:933
      capture_top : aliased unsigned;  -- /usr/include/pcre2.h:933
      capture_last : aliased unsigned;  -- /usr/include/pcre2.h:933
      offset_vector : access unsigned_long;  -- /usr/include/pcre2.h:933
      mark : PCRE2_SPTR8;  -- /usr/include/pcre2.h:933
      subject : PCRE2_SPTR8;  -- /usr/include/pcre2.h:933
      subject_length : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      start_match : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      current_position : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      pattern_position : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      next_item_length : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      callout_string_offset : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      callout_string_length : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      callout_string : PCRE2_SPTR8;  -- /usr/include/pcre2.h:933
      callout_flags : aliased unsigned;  -- /usr/include/pcre2.h:933
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pcre2.h:933

   type pcre2_callout_enumerate_block_8 is record
      version : aliased unsigned;  -- /usr/include/pcre2.h:933
      pattern_position : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      next_item_length : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      callout_number : aliased unsigned;  -- /usr/include/pcre2.h:933
      callout_string_offset : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      callout_string_length : aliased unsigned_long;  -- /usr/include/pcre2.h:933
      callout_string : PCRE2_SPTR8;  -- /usr/include/pcre2.h:933
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pcre2.h:933

   type anon_array1633 is array (0 .. 1) of aliased unsigned_long;
   type pcre2_substitute_callout_block_8 is record
      version : aliased unsigned;  -- /usr/include/pcre2.h:933
      input : PCRE2_SPTR8;  -- /usr/include/pcre2.h:933
      output : PCRE2_SPTR8;  -- /usr/include/pcre2.h:933
      output_offsets : aliased anon_array1633;  -- /usr/include/pcre2.h:933
      ovector : access unsigned_long;  -- /usr/include/pcre2.h:933
      oveccount : aliased unsigned;  -- /usr/include/pcre2.h:933
      subscount : aliased unsigned;  -- /usr/include/pcre2.h:933
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pcre2.h:933

   function pcre2_config_8 (arg1 : unsigned; arg2 : System.Address) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_config_8";

   function pcre2_general_context_copy_8 (arg1 : access pcre2_general_context_8) return access pcre2_general_context_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_general_context_copy_8";

   function pcre2_general_context_create_8
     (arg1 : access function (arg1 : unsigned_long; arg2 : System.Address) return System.Address;
      arg2 : access procedure (arg1 : System.Address; arg2 : System.Address);
      arg3 : System.Address) return access pcre2_general_context_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_general_context_create_8";

   procedure pcre2_general_context_free_8 (arg1 : access pcre2_general_context_8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_general_context_free_8";

   function pcre2_compile_context_copy_8 (arg1 : access pcre2_compile_context_8) return access pcre2_compile_context_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_context_copy_8";

   function pcre2_compile_context_create_8 (arg1 : access pcre2_general_context_8) return access pcre2_compile_context_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_context_create_8";

   procedure pcre2_compile_context_free_8 (arg1 : access pcre2_compile_context_8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_context_free_8";

   function pcre2_set_bsr_8 (arg1 : access pcre2_compile_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_bsr_8";

   function pcre2_set_character_tables_8 (arg1 : access pcre2_compile_context_8; arg2 : access unsigned_char) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_character_tables_8";

   function pcre2_set_compile_extra_options_8 (arg1 : access pcre2_compile_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_compile_extra_options_8";

   function pcre2_set_max_pattern_length_8 (arg1 : access pcre2_compile_context_8; arg2 : unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_max_pattern_length_8";

   function pcre2_set_newline_8 (arg1 : access pcre2_compile_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_newline_8";

   function pcre2_set_parens_nest_limit_8 (arg1 : access pcre2_compile_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_parens_nest_limit_8";

   function pcre2_set_compile_recursion_guard_8
     (arg1 : access pcre2_compile_context_8;
      arg2 : access function (arg1 : unsigned; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_compile_recursion_guard_8";

   function pcre2_convert_context_copy_8 (arg1 : access pcre2_convert_context_8) return access pcre2_convert_context_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_convert_context_copy_8";

   function pcre2_convert_context_create_8 (arg1 : access pcre2_general_context_8) return access pcre2_convert_context_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_convert_context_create_8";

   procedure pcre2_convert_context_free_8 (arg1 : access pcre2_convert_context_8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_convert_context_free_8";

   function pcre2_set_glob_escape_8 (arg1 : access pcre2_convert_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_glob_escape_8";

   function pcre2_set_glob_separator_8 (arg1 : access pcre2_convert_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_glob_separator_8";

   function pcre2_pattern_convert_8
     (arg1 : PCRE2_SPTR8;
      arg2 : unsigned_long;
      arg3 : unsigned;
      arg4 : System.Address;
      arg5 : access unsigned_long;
      arg6 : access pcre2_convert_context_8) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_pattern_convert_8";

   procedure pcre2_converted_pattern_free_8 (arg1 : access PCRE2_UCHAR8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_converted_pattern_free_8";

   function pcre2_match_context_copy_8 (arg1 : access pcre2_match_context_8) return access pcre2_match_context_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_context_copy_8";

   function pcre2_match_context_create_8 (arg1 : access pcre2_general_context_8) return access pcre2_match_context_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_context_create_8";

   procedure pcre2_match_context_free_8 (arg1 : access pcre2_match_context_8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_context_free_8";

   function pcre2_set_callout_8
     (arg1 : access pcre2_match_context_8;
      arg2 : access function (arg1 : access pcre2_callout_block_8; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_callout_8";

   function pcre2_set_substitute_callout_8
     (arg1 : access pcre2_match_context_8;
      arg2 : access function (arg1 : access pcre2_substitute_callout_block_8; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_substitute_callout_8";

   function pcre2_set_depth_limit_8 (arg1 : access pcre2_match_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_depth_limit_8";

   function pcre2_set_heap_limit_8 (arg1 : access pcre2_match_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_heap_limit_8";

   function pcre2_set_match_limit_8 (arg1 : access pcre2_match_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_match_limit_8";

   function pcre2_set_offset_limit_8 (arg1 : access pcre2_match_context_8; arg2 : unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_offset_limit_8";

   function pcre2_set_recursion_limit_8 (arg1 : access pcre2_match_context_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_recursion_limit_8";

   function pcre2_set_recursion_memory_management_8
     (arg1 : access pcre2_match_context_8;
      arg2 : access function (arg1 : unsigned_long; arg2 : System.Address) return System.Address;
      arg3 : access procedure (arg1 : System.Address; arg2 : System.Address);
      arg4 : System.Address) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_recursion_memory_management_8";

   function pcre2_compile_8
     (arg1 : PCRE2_SPTR8;
      arg2 : unsigned_long;
      arg3 : unsigned;
      arg4 : access int;
      arg5 : access unsigned_long;
      arg6 : access pcre2_compile_context_8) return access pcre2_code_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_8";

   procedure pcre2_code_free_8 (arg1 : access pcre2_code_8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_code_free_8";

   function pcre2_code_copy_8 (arg1 : access constant pcre2_code_8) return access pcre2_code_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_code_copy_8";

   function pcre2_code_copy_with_tables_8 (arg1 : access constant pcre2_code_8) return access pcre2_code_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_code_copy_with_tables_8";

   function pcre2_pattern_info_8
     (arg1 : access constant pcre2_code_8;
      arg2 : unsigned;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_pattern_info_8";

   function pcre2_callout_enumerate_8
     (arg1 : access constant pcre2_code_8;
      arg2 : access function (arg1 : access pcre2_callout_enumerate_block_8; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_callout_enumerate_8";

   function pcre2_match_data_create_8 (arg1 : unsigned; arg2 : access pcre2_general_context_8) return access pcre2_match_data_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_data_create_8";

   function pcre2_match_data_create_from_pattern_8 (arg1 : access constant pcre2_code_8; arg2 : access pcre2_general_context_8) return access pcre2_match_data_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_data_create_from_pattern_8";

   function pcre2_dfa_match_8
     (arg1 : access constant pcre2_code_8;
      arg2 : PCRE2_SPTR8;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_8;
      arg7 : access pcre2_match_context_8;
      arg8 : access int;
      arg9 : unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_dfa_match_8";

   function pcre2_match_8
     (arg1 : access constant pcre2_code_8;
      arg2 : PCRE2_SPTR8;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_8;
      arg7 : access pcre2_match_context_8) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_8";

   procedure pcre2_match_data_free_8 (arg1 : access pcre2_match_data_8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_data_free_8";

   function pcre2_get_mark_8 (arg1 : access pcre2_match_data_8) return PCRE2_SPTR8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_mark_8";

   function pcre2_get_match_data_size_8 (arg1 : access pcre2_match_data_8) return unsigned_long  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_match_data_size_8";

   function pcre2_get_ovector_count_8 (arg1 : access pcre2_match_data_8) return unsigned  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_ovector_count_8";

   function pcre2_get_ovector_pointer_8 (arg1 : access pcre2_match_data_8) return access unsigned_long  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_ovector_pointer_8";

   function pcre2_get_startchar_8 (arg1 : access pcre2_match_data_8) return unsigned_long  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_startchar_8";

   function pcre2_substring_copy_byname_8
     (arg1 : access pcre2_match_data_8;
      arg2 : PCRE2_SPTR8;
      arg3 : access PCRE2_UCHAR8;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_copy_byname_8";

   function pcre2_substring_copy_bynumber_8
     (arg1 : access pcre2_match_data_8;
      arg2 : unsigned;
      arg3 : access PCRE2_UCHAR8;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_copy_bynumber_8";

   procedure pcre2_substring_free_8 (arg1 : access PCRE2_UCHAR8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_free_8";

   function pcre2_substring_get_byname_8
     (arg1 : access pcre2_match_data_8;
      arg2 : PCRE2_SPTR8;
      arg3 : System.Address;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_get_byname_8";

   function pcre2_substring_get_bynumber_8
     (arg1 : access pcre2_match_data_8;
      arg2 : unsigned;
      arg3 : System.Address;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_get_bynumber_8";

   function pcre2_substring_length_byname_8
     (arg1 : access pcre2_match_data_8;
      arg2 : PCRE2_SPTR8;
      arg3 : access unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_length_byname_8";

   function pcre2_substring_length_bynumber_8
     (arg1 : access pcre2_match_data_8;
      arg2 : unsigned;
      arg3 : access unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_length_bynumber_8";

   function pcre2_substring_nametable_scan_8
     (arg1 : access constant pcre2_code_8;
      arg2 : PCRE2_SPTR8;
      arg3 : System.Address;
      arg4 : System.Address) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_nametable_scan_8";

   function pcre2_substring_number_from_name_8 (arg1 : access constant pcre2_code_8; arg2 : PCRE2_SPTR8) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_number_from_name_8";

   procedure pcre2_substring_list_free_8 (arg1 : System.Address)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_list_free_8";

   function pcre2_substring_list_get_8
     (arg1 : access pcre2_match_data_8;
      arg2 : System.Address;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_list_get_8";

   function pcre2_serialize_encode_8
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access unsigned_long;
      arg5 : access pcre2_general_context_8) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_encode_8";

   function pcre2_serialize_decode_8
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access unsigned_char;
      arg4 : access pcre2_general_context_8) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_decode_8";

   function pcre2_serialize_get_number_of_codes_8 (arg1 : access unsigned_char) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_get_number_of_codes_8";

   procedure pcre2_serialize_free_8 (arg1 : access unsigned_char)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_free_8";

   function pcre2_substitute_8
     (arg1 : access constant pcre2_code_8;
      arg2 : PCRE2_SPTR8;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_8;
      arg7 : access pcre2_match_context_8;
      arg8 : PCRE2_SPTR8;
      arg9 : unsigned_long;
      arg10 : access PCRE2_UCHAR8;
      arg11 : access unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substitute_8";

   function pcre2_jit_compile_8 (arg1 : access pcre2_code_8; arg2 : unsigned) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_compile_8";

   function pcre2_jit_match_8
     (arg1 : access constant pcre2_code_8;
      arg2 : PCRE2_SPTR8;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_8;
      arg7 : access pcre2_match_context_8) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_match_8";

   procedure pcre2_jit_free_unused_memory_8 (arg1 : access pcre2_general_context_8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_free_unused_memory_8";

   function pcre2_jit_stack_create_8
     (arg1 : unsigned_long;
      arg2 : unsigned_long;
      arg3 : access pcre2_general_context_8) return access pcre2_jit_stack_8  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_stack_create_8";

   procedure pcre2_jit_stack_assign_8
     (arg1 : access pcre2_match_context_8;
      arg2 : pcre2_jit_callback_8;
      arg3 : System.Address)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_stack_assign_8";

   procedure pcre2_jit_stack_free_8 (arg1 : access pcre2_jit_stack_8)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_stack_free_8";

   function pcre2_get_error_message_8
     (arg1 : int;
      arg2 : access PCRE2_UCHAR8;
      arg3 : unsigned_long) return int  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_error_message_8";

   function pcre2_maketables_8 (arg1 : access pcre2_general_context_8) return access unsigned_char  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_maketables_8";

   procedure pcre2_maketables_free_8 (arg1 : access pcre2_general_context_8; arg2 : access unsigned_char)  -- /usr/include/pcre2.h:933
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_maketables_free_8";

   type pcre2_real_general_context_16 is null record;   -- incomplete struct

   subtype pcre2_general_context_16 is pcre2_real_general_context_16;  -- /usr/include/pcre2.h:937

   type pcre2_real_compile_context_16 is null record;   -- incomplete struct

   subtype pcre2_compile_context_16 is pcre2_real_compile_context_16;  -- /usr/include/pcre2.h:937

   type pcre2_real_match_context_16 is null record;   -- incomplete struct

   subtype pcre2_match_context_16 is pcre2_real_match_context_16;  -- /usr/include/pcre2.h:937

   type pcre2_real_convert_context_16 is null record;   -- incomplete struct

   subtype pcre2_convert_context_16 is pcre2_real_convert_context_16;  -- /usr/include/pcre2.h:937

   type pcre2_real_code_16 is null record;   -- incomplete struct

   subtype pcre2_code_16 is pcre2_real_code_16;  -- /usr/include/pcre2.h:937

   type pcre2_real_match_data_16 is null record;   -- incomplete struct

   subtype pcre2_match_data_16 is pcre2_real_match_data_16;  -- /usr/include/pcre2.h:937

   type pcre2_real_jit_stack_16 is null record;   -- incomplete struct

   subtype pcre2_jit_stack_16 is pcre2_real_jit_stack_16;  -- /usr/include/pcre2.h:937

   type pcre2_jit_callback_16 is access function (arg1 : System.Address) return access pcre2_jit_stack_16
   with Convention => C;  -- /usr/include/pcre2.h:937

   type pcre2_callout_block_16 is record
      version : aliased unsigned;  -- /usr/include/pcre2.h:937
      callout_number : aliased unsigned;  -- /usr/include/pcre2.h:937
      capture_top : aliased unsigned;  -- /usr/include/pcre2.h:937
      capture_last : aliased unsigned;  -- /usr/include/pcre2.h:937
      offset_vector : access unsigned_long;  -- /usr/include/pcre2.h:937
      mark : PCRE2_SPTR16;  -- /usr/include/pcre2.h:937
      subject : PCRE2_SPTR16;  -- /usr/include/pcre2.h:937
      subject_length : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      start_match : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      current_position : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      pattern_position : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      next_item_length : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      callout_string_offset : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      callout_string_length : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      callout_string : PCRE2_SPTR16;  -- /usr/include/pcre2.h:937
      callout_flags : aliased unsigned;  -- /usr/include/pcre2.h:937
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pcre2.h:937

   type pcre2_callout_enumerate_block_16 is record
      version : aliased unsigned;  -- /usr/include/pcre2.h:937
      pattern_position : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      next_item_length : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      callout_number : aliased unsigned;  -- /usr/include/pcre2.h:937
      callout_string_offset : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      callout_string_length : aliased unsigned_long;  -- /usr/include/pcre2.h:937
      callout_string : PCRE2_SPTR16;  -- /usr/include/pcre2.h:937
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pcre2.h:937

   type pcre2_substitute_callout_block_16 is record
      version : aliased unsigned;  -- /usr/include/pcre2.h:937
      input : PCRE2_SPTR16;  -- /usr/include/pcre2.h:937
      output : PCRE2_SPTR16;  -- /usr/include/pcre2.h:937
      output_offsets : aliased anon_array1633;  -- /usr/include/pcre2.h:937
      ovector : access unsigned_long;  -- /usr/include/pcre2.h:937
      oveccount : aliased unsigned;  -- /usr/include/pcre2.h:937
      subscount : aliased unsigned;  -- /usr/include/pcre2.h:937
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pcre2.h:937

   function pcre2_config_16 (arg1 : unsigned; arg2 : System.Address) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_config_16";

   function pcre2_general_context_copy_16 (arg1 : access pcre2_general_context_16) return access pcre2_general_context_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_general_context_copy_16";

   function pcre2_general_context_create_16
     (arg1 : access function (arg1 : unsigned_long; arg2 : System.Address) return System.Address;
      arg2 : access procedure (arg1 : System.Address; arg2 : System.Address);
      arg3 : System.Address) return access pcre2_general_context_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_general_context_create_16";

   procedure pcre2_general_context_free_16 (arg1 : access pcre2_general_context_16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_general_context_free_16";

   function pcre2_compile_context_copy_16 (arg1 : access pcre2_compile_context_16) return access pcre2_compile_context_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_context_copy_16";

   function pcre2_compile_context_create_16 (arg1 : access pcre2_general_context_16) return access pcre2_compile_context_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_context_create_16";

   procedure pcre2_compile_context_free_16 (arg1 : access pcre2_compile_context_16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_context_free_16";

   function pcre2_set_bsr_16 (arg1 : access pcre2_compile_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_bsr_16";

   function pcre2_set_character_tables_16 (arg1 : access pcre2_compile_context_16; arg2 : access unsigned_char) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_character_tables_16";

   function pcre2_set_compile_extra_options_16 (arg1 : access pcre2_compile_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_compile_extra_options_16";

   function pcre2_set_max_pattern_length_16 (arg1 : access pcre2_compile_context_16; arg2 : unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_max_pattern_length_16";

   function pcre2_set_newline_16 (arg1 : access pcre2_compile_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_newline_16";

   function pcre2_set_parens_nest_limit_16 (arg1 : access pcre2_compile_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_parens_nest_limit_16";

   function pcre2_set_compile_recursion_guard_16
     (arg1 : access pcre2_compile_context_16;
      arg2 : access function (arg1 : unsigned; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_compile_recursion_guard_16";

   function pcre2_convert_context_copy_16 (arg1 : access pcre2_convert_context_16) return access pcre2_convert_context_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_convert_context_copy_16";

   function pcre2_convert_context_create_16 (arg1 : access pcre2_general_context_16) return access pcre2_convert_context_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_convert_context_create_16";

   procedure pcre2_convert_context_free_16 (arg1 : access pcre2_convert_context_16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_convert_context_free_16";

   function pcre2_set_glob_escape_16 (arg1 : access pcre2_convert_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_glob_escape_16";

   function pcre2_set_glob_separator_16 (arg1 : access pcre2_convert_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_glob_separator_16";

   function pcre2_pattern_convert_16
     (arg1 : PCRE2_SPTR16;
      arg2 : unsigned_long;
      arg3 : unsigned;
      arg4 : System.Address;
      arg5 : access unsigned_long;
      arg6 : access pcre2_convert_context_16) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_pattern_convert_16";

   procedure pcre2_converted_pattern_free_16 (arg1 : access PCRE2_UCHAR16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_converted_pattern_free_16";

   function pcre2_match_context_copy_16 (arg1 : access pcre2_match_context_16) return access pcre2_match_context_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_context_copy_16";

   function pcre2_match_context_create_16 (arg1 : access pcre2_general_context_16) return access pcre2_match_context_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_context_create_16";

   procedure pcre2_match_context_free_16 (arg1 : access pcre2_match_context_16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_context_free_16";

   function pcre2_set_callout_16
     (arg1 : access pcre2_match_context_16;
      arg2 : access function (arg1 : access pcre2_callout_block_16; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_callout_16";

   function pcre2_set_substitute_callout_16
     (arg1 : access pcre2_match_context_16;
      arg2 : access function (arg1 : access pcre2_substitute_callout_block_16; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_substitute_callout_16";

   function pcre2_set_depth_limit_16 (arg1 : access pcre2_match_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_depth_limit_16";

   function pcre2_set_heap_limit_16 (arg1 : access pcre2_match_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_heap_limit_16";

   function pcre2_set_match_limit_16 (arg1 : access pcre2_match_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_match_limit_16";

   function pcre2_set_offset_limit_16 (arg1 : access pcre2_match_context_16; arg2 : unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_offset_limit_16";

   function pcre2_set_recursion_limit_16 (arg1 : access pcre2_match_context_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_recursion_limit_16";

   function pcre2_set_recursion_memory_management_16
     (arg1 : access pcre2_match_context_16;
      arg2 : access function (arg1 : unsigned_long; arg2 : System.Address) return System.Address;
      arg3 : access procedure (arg1 : System.Address; arg2 : System.Address);
      arg4 : System.Address) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_recursion_memory_management_16";

   function pcre2_compile_16
     (arg1 : PCRE2_SPTR16;
      arg2 : unsigned_long;
      arg3 : unsigned;
      arg4 : access int;
      arg5 : access unsigned_long;
      arg6 : access pcre2_compile_context_16) return access pcre2_code_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_16";

   procedure pcre2_code_free_16 (arg1 : access pcre2_code_16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_code_free_16";

   function pcre2_code_copy_16 (arg1 : access constant pcre2_code_16) return access pcre2_code_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_code_copy_16";

   function pcre2_code_copy_with_tables_16 (arg1 : access constant pcre2_code_16) return access pcre2_code_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_code_copy_with_tables_16";

   function pcre2_pattern_info_16
     (arg1 : access constant pcre2_code_16;
      arg2 : unsigned;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_pattern_info_16";

   function pcre2_callout_enumerate_16
     (arg1 : access constant pcre2_code_16;
      arg2 : access function (arg1 : access pcre2_callout_enumerate_block_16; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_callout_enumerate_16";

   function pcre2_match_data_create_16 (arg1 : unsigned; arg2 : access pcre2_general_context_16) return access pcre2_match_data_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_data_create_16";

   function pcre2_match_data_create_from_pattern_16 (arg1 : access constant pcre2_code_16; arg2 : access pcre2_general_context_16) return access pcre2_match_data_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_data_create_from_pattern_16";

   function pcre2_dfa_match_16
     (arg1 : access constant pcre2_code_16;
      arg2 : PCRE2_SPTR16;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_16;
      arg7 : access pcre2_match_context_16;
      arg8 : access int;
      arg9 : unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_dfa_match_16";

   function pcre2_match_16
     (arg1 : access constant pcre2_code_16;
      arg2 : PCRE2_SPTR16;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_16;
      arg7 : access pcre2_match_context_16) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_16";

   procedure pcre2_match_data_free_16 (arg1 : access pcre2_match_data_16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_data_free_16";

   function pcre2_get_mark_16 (arg1 : access pcre2_match_data_16) return PCRE2_SPTR16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_mark_16";

   function pcre2_get_match_data_size_16 (arg1 : access pcre2_match_data_16) return unsigned_long  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_match_data_size_16";

   function pcre2_get_ovector_count_16 (arg1 : access pcre2_match_data_16) return unsigned  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_ovector_count_16";

   function pcre2_get_ovector_pointer_16 (arg1 : access pcre2_match_data_16) return access unsigned_long  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_ovector_pointer_16";

   function pcre2_get_startchar_16 (arg1 : access pcre2_match_data_16) return unsigned_long  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_startchar_16";

   function pcre2_substring_copy_byname_16
     (arg1 : access pcre2_match_data_16;
      arg2 : PCRE2_SPTR16;
      arg3 : access PCRE2_UCHAR16;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_copy_byname_16";

   function pcre2_substring_copy_bynumber_16
     (arg1 : access pcre2_match_data_16;
      arg2 : unsigned;
      arg3 : access PCRE2_UCHAR16;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_copy_bynumber_16";

   procedure pcre2_substring_free_16 (arg1 : access PCRE2_UCHAR16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_free_16";

   function pcre2_substring_get_byname_16
     (arg1 : access pcre2_match_data_16;
      arg2 : PCRE2_SPTR16;
      arg3 : System.Address;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_get_byname_16";

   function pcre2_substring_get_bynumber_16
     (arg1 : access pcre2_match_data_16;
      arg2 : unsigned;
      arg3 : System.Address;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_get_bynumber_16";

   function pcre2_substring_length_byname_16
     (arg1 : access pcre2_match_data_16;
      arg2 : PCRE2_SPTR16;
      arg3 : access unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_length_byname_16";

   function pcre2_substring_length_bynumber_16
     (arg1 : access pcre2_match_data_16;
      arg2 : unsigned;
      arg3 : access unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_length_bynumber_16";

   function pcre2_substring_nametable_scan_16
     (arg1 : access constant pcre2_code_16;
      arg2 : PCRE2_SPTR16;
      arg3 : System.Address;
      arg4 : System.Address) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_nametable_scan_16";

   function pcre2_substring_number_from_name_16 (arg1 : access constant pcre2_code_16; arg2 : PCRE2_SPTR16) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_number_from_name_16";

   procedure pcre2_substring_list_free_16 (arg1 : System.Address)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_list_free_16";

   function pcre2_substring_list_get_16
     (arg1 : access pcre2_match_data_16;
      arg2 : System.Address;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_list_get_16";

   function pcre2_serialize_encode_16
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access unsigned_long;
      arg5 : access pcre2_general_context_16) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_encode_16";

   function pcre2_serialize_decode_16
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access unsigned_char;
      arg4 : access pcre2_general_context_16) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_decode_16";

   function pcre2_serialize_get_number_of_codes_16 (arg1 : access unsigned_char) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_get_number_of_codes_16";

   procedure pcre2_serialize_free_16 (arg1 : access unsigned_char)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_free_16";

   function pcre2_substitute_16
     (arg1 : access constant pcre2_code_16;
      arg2 : PCRE2_SPTR16;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_16;
      arg7 : access pcre2_match_context_16;
      arg8 : PCRE2_SPTR16;
      arg9 : unsigned_long;
      arg10 : access PCRE2_UCHAR16;
      arg11 : access unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substitute_16";

   function pcre2_jit_compile_16 (arg1 : access pcre2_code_16; arg2 : unsigned) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_compile_16";

   function pcre2_jit_match_16
     (arg1 : access constant pcre2_code_16;
      arg2 : PCRE2_SPTR16;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_16;
      arg7 : access pcre2_match_context_16) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_match_16";

   procedure pcre2_jit_free_unused_memory_16 (arg1 : access pcre2_general_context_16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_free_unused_memory_16";

   function pcre2_jit_stack_create_16
     (arg1 : unsigned_long;
      arg2 : unsigned_long;
      arg3 : access pcre2_general_context_16) return access pcre2_jit_stack_16  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_stack_create_16";

   procedure pcre2_jit_stack_assign_16
     (arg1 : access pcre2_match_context_16;
      arg2 : pcre2_jit_callback_16;
      arg3 : System.Address)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_stack_assign_16";

   procedure pcre2_jit_stack_free_16 (arg1 : access pcre2_jit_stack_16)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_stack_free_16";

   function pcre2_get_error_message_16
     (arg1 : int;
      arg2 : access PCRE2_UCHAR16;
      arg3 : unsigned_long) return int  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_error_message_16";

   function pcre2_maketables_16 (arg1 : access pcre2_general_context_16) return access unsigned_char  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_maketables_16";

   procedure pcre2_maketables_free_16 (arg1 : access pcre2_general_context_16; arg2 : access unsigned_char)  -- /usr/include/pcre2.h:937
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_maketables_free_16";

   type pcre2_real_general_context_32 is null record;   -- incomplete struct

   subtype pcre2_general_context_32 is pcre2_real_general_context_32;  -- /usr/include/pcre2.h:941

   type pcre2_real_compile_context_32 is null record;   -- incomplete struct

   subtype pcre2_compile_context_32 is pcre2_real_compile_context_32;  -- /usr/include/pcre2.h:941

   type pcre2_real_match_context_32 is null record;   -- incomplete struct

   subtype pcre2_match_context_32 is pcre2_real_match_context_32;  -- /usr/include/pcre2.h:941

   type pcre2_real_convert_context_32 is null record;   -- incomplete struct

   subtype pcre2_convert_context_32 is pcre2_real_convert_context_32;  -- /usr/include/pcre2.h:941

   type pcre2_real_code_32 is null record;   -- incomplete struct

   subtype pcre2_code_32 is pcre2_real_code_32;  -- /usr/include/pcre2.h:941

   type pcre2_real_match_data_32 is null record;   -- incomplete struct

   subtype pcre2_match_data_32 is pcre2_real_match_data_32;  -- /usr/include/pcre2.h:941

   type pcre2_real_jit_stack_32 is null record;   -- incomplete struct

   subtype pcre2_jit_stack_32 is pcre2_real_jit_stack_32;  -- /usr/include/pcre2.h:941

   type pcre2_jit_callback_32 is access function (arg1 : System.Address) return access pcre2_jit_stack_32
   with Convention => C;  -- /usr/include/pcre2.h:941

   type pcre2_callout_block_32 is record
      version : aliased unsigned;  -- /usr/include/pcre2.h:941
      callout_number : aliased unsigned;  -- /usr/include/pcre2.h:941
      capture_top : aliased unsigned;  -- /usr/include/pcre2.h:941
      capture_last : aliased unsigned;  -- /usr/include/pcre2.h:941
      offset_vector : access unsigned_long;  -- /usr/include/pcre2.h:941
      mark : PCRE2_SPTR32;  -- /usr/include/pcre2.h:941
      subject : PCRE2_SPTR32;  -- /usr/include/pcre2.h:941
      subject_length : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      start_match : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      current_position : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      pattern_position : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      next_item_length : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      callout_string_offset : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      callout_string_length : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      callout_string : PCRE2_SPTR32;  -- /usr/include/pcre2.h:941
      callout_flags : aliased unsigned;  -- /usr/include/pcre2.h:941
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pcre2.h:941

   type pcre2_callout_enumerate_block_32 is record
      version : aliased unsigned;  -- /usr/include/pcre2.h:941
      pattern_position : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      next_item_length : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      callout_number : aliased unsigned;  -- /usr/include/pcre2.h:941
      callout_string_offset : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      callout_string_length : aliased unsigned_long;  -- /usr/include/pcre2.h:941
      callout_string : PCRE2_SPTR32;  -- /usr/include/pcre2.h:941
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pcre2.h:941

   type pcre2_substitute_callout_block_32 is record
      version : aliased unsigned;  -- /usr/include/pcre2.h:941
      input : PCRE2_SPTR32;  -- /usr/include/pcre2.h:941
      output : PCRE2_SPTR32;  -- /usr/include/pcre2.h:941
      output_offsets : aliased anon_array1633;  -- /usr/include/pcre2.h:941
      ovector : access unsigned_long;  -- /usr/include/pcre2.h:941
      oveccount : aliased unsigned;  -- /usr/include/pcre2.h:941
      subscount : aliased unsigned;  -- /usr/include/pcre2.h:941
   end record
   with Convention => C_Pass_By_Copy;  -- /usr/include/pcre2.h:941

   function pcre2_config_32 (arg1 : unsigned; arg2 : System.Address) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_config_32";

   function pcre2_general_context_copy_32 (arg1 : access pcre2_general_context_32) return access pcre2_general_context_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_general_context_copy_32";

   function pcre2_general_context_create_32
     (arg1 : access function (arg1 : unsigned_long; arg2 : System.Address) return System.Address;
      arg2 : access procedure (arg1 : System.Address; arg2 : System.Address);
      arg3 : System.Address) return access pcre2_general_context_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_general_context_create_32";

   procedure pcre2_general_context_free_32 (arg1 : access pcre2_general_context_32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_general_context_free_32";

   function pcre2_compile_context_copy_32 (arg1 : access pcre2_compile_context_32) return access pcre2_compile_context_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_context_copy_32";

   function pcre2_compile_context_create_32 (arg1 : access pcre2_general_context_32) return access pcre2_compile_context_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_context_create_32";

   procedure pcre2_compile_context_free_32 (arg1 : access pcre2_compile_context_32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_context_free_32";

   function pcre2_set_bsr_32 (arg1 : access pcre2_compile_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_bsr_32";

   function pcre2_set_character_tables_32 (arg1 : access pcre2_compile_context_32; arg2 : access unsigned_char) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_character_tables_32";

   function pcre2_set_compile_extra_options_32 (arg1 : access pcre2_compile_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_compile_extra_options_32";

   function pcre2_set_max_pattern_length_32 (arg1 : access pcre2_compile_context_32; arg2 : unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_max_pattern_length_32";

   function pcre2_set_newline_32 (arg1 : access pcre2_compile_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_newline_32";

   function pcre2_set_parens_nest_limit_32 (arg1 : access pcre2_compile_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_parens_nest_limit_32";

   function pcre2_set_compile_recursion_guard_32
     (arg1 : access pcre2_compile_context_32;
      arg2 : access function (arg1 : unsigned; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_compile_recursion_guard_32";

   function pcre2_convert_context_copy_32 (arg1 : access pcre2_convert_context_32) return access pcre2_convert_context_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_convert_context_copy_32";

   function pcre2_convert_context_create_32 (arg1 : access pcre2_general_context_32) return access pcre2_convert_context_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_convert_context_create_32";

   procedure pcre2_convert_context_free_32 (arg1 : access pcre2_convert_context_32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_convert_context_free_32";

   function pcre2_set_glob_escape_32 (arg1 : access pcre2_convert_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_glob_escape_32";

   function pcre2_set_glob_separator_32 (arg1 : access pcre2_convert_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_glob_separator_32";

   function pcre2_pattern_convert_32
     (arg1 : PCRE2_SPTR32;
      arg2 : unsigned_long;
      arg3 : unsigned;
      arg4 : System.Address;
      arg5 : access unsigned_long;
      arg6 : access pcre2_convert_context_32) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_pattern_convert_32";

   procedure pcre2_converted_pattern_free_32 (arg1 : access PCRE2_UCHAR32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_converted_pattern_free_32";

   function pcre2_match_context_copy_32 (arg1 : access pcre2_match_context_32) return access pcre2_match_context_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_context_copy_32";

   function pcre2_match_context_create_32 (arg1 : access pcre2_general_context_32) return access pcre2_match_context_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_context_create_32";

   procedure pcre2_match_context_free_32 (arg1 : access pcre2_match_context_32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_context_free_32";

   function pcre2_set_callout_32
     (arg1 : access pcre2_match_context_32;
      arg2 : access function (arg1 : access pcre2_callout_block_32; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_callout_32";

   function pcre2_set_substitute_callout_32
     (arg1 : access pcre2_match_context_32;
      arg2 : access function (arg1 : access pcre2_substitute_callout_block_32; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_substitute_callout_32";

   function pcre2_set_depth_limit_32 (arg1 : access pcre2_match_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_depth_limit_32";

   function pcre2_set_heap_limit_32 (arg1 : access pcre2_match_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_heap_limit_32";

   function pcre2_set_match_limit_32 (arg1 : access pcre2_match_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_match_limit_32";

   function pcre2_set_offset_limit_32 (arg1 : access pcre2_match_context_32; arg2 : unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_offset_limit_32";

   function pcre2_set_recursion_limit_32 (arg1 : access pcre2_match_context_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_recursion_limit_32";

   function pcre2_set_recursion_memory_management_32
     (arg1 : access pcre2_match_context_32;
      arg2 : access function (arg1 : unsigned_long; arg2 : System.Address) return System.Address;
      arg3 : access procedure (arg1 : System.Address; arg2 : System.Address);
      arg4 : System.Address) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_set_recursion_memory_management_32";

   function pcre2_compile_32
     (arg1 : PCRE2_SPTR32;
      arg2 : unsigned_long;
      arg3 : unsigned;
      arg4 : access int;
      arg5 : access unsigned_long;
      arg6 : access pcre2_compile_context_32) return access pcre2_code_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_compile_32";

   procedure pcre2_code_free_32 (arg1 : access pcre2_code_32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_code_free_32";

   function pcre2_code_copy_32 (arg1 : access constant pcre2_code_32) return access pcre2_code_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_code_copy_32";

   function pcre2_code_copy_with_tables_32 (arg1 : access constant pcre2_code_32) return access pcre2_code_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_code_copy_with_tables_32";

   function pcre2_pattern_info_32
     (arg1 : access constant pcre2_code_32;
      arg2 : unsigned;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_pattern_info_32";

   function pcre2_callout_enumerate_32
     (arg1 : access constant pcre2_code_32;
      arg2 : access function (arg1 : access pcre2_callout_enumerate_block_32; arg2 : System.Address) return int;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_callout_enumerate_32";

   function pcre2_match_data_create_32 (arg1 : unsigned; arg2 : access pcre2_general_context_32) return access pcre2_match_data_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_data_create_32";

   function pcre2_match_data_create_from_pattern_32 (arg1 : access constant pcre2_code_32; arg2 : access pcre2_general_context_32) return access pcre2_match_data_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_data_create_from_pattern_32";

   function pcre2_dfa_match_32
     (arg1 : access constant pcre2_code_32;
      arg2 : PCRE2_SPTR32;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_32;
      arg7 : access pcre2_match_context_32;
      arg8 : access int;
      arg9 : unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_dfa_match_32";

   function pcre2_match_32
     (arg1 : access constant pcre2_code_32;
      arg2 : PCRE2_SPTR32;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_32;
      arg7 : access pcre2_match_context_32) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_32";

   procedure pcre2_match_data_free_32 (arg1 : access pcre2_match_data_32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_match_data_free_32";

   function pcre2_get_mark_32 (arg1 : access pcre2_match_data_32) return PCRE2_SPTR32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_mark_32";

   function pcre2_get_match_data_size_32 (arg1 : access pcre2_match_data_32) return unsigned_long  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_match_data_size_32";

   function pcre2_get_ovector_count_32 (arg1 : access pcre2_match_data_32) return unsigned  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_ovector_count_32";

   function pcre2_get_ovector_pointer_32 (arg1 : access pcre2_match_data_32) return access unsigned_long  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_ovector_pointer_32";

   function pcre2_get_startchar_32 (arg1 : access pcre2_match_data_32) return unsigned_long  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_startchar_32";

   function pcre2_substring_copy_byname_32
     (arg1 : access pcre2_match_data_32;
      arg2 : PCRE2_SPTR32;
      arg3 : access PCRE2_UCHAR32;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_copy_byname_32";

   function pcre2_substring_copy_bynumber_32
     (arg1 : access pcre2_match_data_32;
      arg2 : unsigned;
      arg3 : access PCRE2_UCHAR32;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_copy_bynumber_32";

   procedure pcre2_substring_free_32 (arg1 : access PCRE2_UCHAR32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_free_32";

   function pcre2_substring_get_byname_32
     (arg1 : access pcre2_match_data_32;
      arg2 : PCRE2_SPTR32;
      arg3 : System.Address;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_get_byname_32";

   function pcre2_substring_get_bynumber_32
     (arg1 : access pcre2_match_data_32;
      arg2 : unsigned;
      arg3 : System.Address;
      arg4 : access unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_get_bynumber_32";

   function pcre2_substring_length_byname_32
     (arg1 : access pcre2_match_data_32;
      arg2 : PCRE2_SPTR32;
      arg3 : access unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_length_byname_32";

   function pcre2_substring_length_bynumber_32
     (arg1 : access pcre2_match_data_32;
      arg2 : unsigned;
      arg3 : access unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_length_bynumber_32";

   function pcre2_substring_nametable_scan_32
     (arg1 : access constant pcre2_code_32;
      arg2 : PCRE2_SPTR32;
      arg3 : System.Address;
      arg4 : System.Address) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_nametable_scan_32";

   function pcre2_substring_number_from_name_32 (arg1 : access constant pcre2_code_32; arg2 : PCRE2_SPTR32) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_number_from_name_32";

   procedure pcre2_substring_list_free_32 (arg1 : System.Address)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_list_free_32";

   function pcre2_substring_list_get_32
     (arg1 : access pcre2_match_data_32;
      arg2 : System.Address;
      arg3 : System.Address) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substring_list_get_32";

   function pcre2_serialize_encode_32
     (arg1 : System.Address;
      arg2 : int;
      arg3 : System.Address;
      arg4 : access unsigned_long;
      arg5 : access pcre2_general_context_32) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_encode_32";

   function pcre2_serialize_decode_32
     (arg1 : System.Address;
      arg2 : int;
      arg3 : access unsigned_char;
      arg4 : access pcre2_general_context_32) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_decode_32";

   function pcre2_serialize_get_number_of_codes_32 (arg1 : access unsigned_char) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_get_number_of_codes_32";

   procedure pcre2_serialize_free_32 (arg1 : access unsigned_char)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_serialize_free_32";

   function pcre2_substitute_32
     (arg1 : access constant pcre2_code_32;
      arg2 : PCRE2_SPTR32;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_32;
      arg7 : access pcre2_match_context_32;
      arg8 : PCRE2_SPTR32;
      arg9 : unsigned_long;
      arg10 : access PCRE2_UCHAR32;
      arg11 : access unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_substitute_32";

   function pcre2_jit_compile_32 (arg1 : access pcre2_code_32; arg2 : unsigned) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_compile_32";

   function pcre2_jit_match_32
     (arg1 : access constant pcre2_code_32;
      arg2 : PCRE2_SPTR32;
      arg3 : unsigned_long;
      arg4 : unsigned_long;
      arg5 : unsigned;
      arg6 : access pcre2_match_data_32;
      arg7 : access pcre2_match_context_32) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_match_32";

   procedure pcre2_jit_free_unused_memory_32 (arg1 : access pcre2_general_context_32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_free_unused_memory_32";

   function pcre2_jit_stack_create_32
     (arg1 : unsigned_long;
      arg2 : unsigned_long;
      arg3 : access pcre2_general_context_32) return access pcre2_jit_stack_32  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_stack_create_32";

   procedure pcre2_jit_stack_assign_32
     (arg1 : access pcre2_match_context_32;
      arg2 : pcre2_jit_callback_32;
      arg3 : System.Address)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_stack_assign_32";

   procedure pcre2_jit_stack_free_32 (arg1 : access pcre2_jit_stack_32)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_jit_stack_free_32";

   function pcre2_get_error_message_32
     (arg1 : int;
      arg2 : access PCRE2_UCHAR32;
      arg3 : unsigned_long) return int  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_get_error_message_32";

   function pcre2_maketables_32 (arg1 : access pcre2_general_context_32) return access unsigned_char  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_maketables_32";

   procedure pcre2_maketables_free_32 (arg1 : access pcre2_general_context_32; arg2 : access unsigned_char)  -- /usr/include/pcre2.h:941
   with Import => True, 
        Convention => C, 
        External_Name => "pcre2_maketables_free_32";

  -- Undefine the list macros; they are no longer needed.  
  -- PCRE2_CODE_UNIT_WIDTH must be defined. If it is 8, 16, or 32, redefine
  --PCRE2_SUFFIX to use it. If it is 0, undefine the other macros and make
  --PCRE2_SUFFIX a no-op. Otherwise, generate an error.  

  -- extern "C"  
  -- End of pcre2.h  
end Pcre.Low_Level.pcre2_h;

pragma Style_Checks (On);
pragma Warnings (On, "-gnatwu");
