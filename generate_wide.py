#!/usr/bin/env python
import os
from os.path import *
def gen(src,tgt,replace):
    if exists(tgt):
        os.chmod(tgt,0o666)
    with open(src) as inf:
        with open(tgt,"w") as outf:
            outf.write("--  Do not edit!\n--   This file is generated from: %s\n\n" % basename(src))
            for line in inf:
                for r in replace:
                    if r in line:
                        line=line.replace(r,replace[r])
                outf.write(line)
    os.chmod(tgt,0o444)
replace={"Pcre.Matcher": "Pcre.Wide_Matcher",
         "Character": "Wide_Character",
         "_8": "_16",
         "SPTR8":"SPTR16",
         "PCRE2_UCHAR8":"PCRE2_UCHAR16",
         "String": "Wide_String",
         "Pcre2_Set_Wide_Character_Tables_16":"Pcre2_Set_Character_Tables_16"}

gen("src/pcre-matcher.ads", "src/gen/pcre-wide_matcher.ads",replace)
gen("src/pcre-matcher.adb", "src/gen/pcre-wide_matcher.adb",replace)
                    
replace={"Pcre.Matcher": "Pcre.Wide_Wide_Matcher",
         "Character": "Wide_Wide_Character",
         "_8": "_32",
         "SPTR8":"SPTR32",
         "PCRE2_UCHAR8":"PCRE2_UCHAR32",
         "String": "Wide_Wide_String",
         "Pcre2_Set_Wide_Wide_Character_Tables_32":"Pcre2_Set_Character_Tables_32"}

gen("src/pcre-matcher.ads", "src/gen/pcre-wide_wide_matcher.ads",replace)
gen("src/pcre-matcher.adb", "src/gen/pcre-wide_wide_matcher.adb",replace)
