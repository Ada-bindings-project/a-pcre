import re


def Update_Constants(target_path, source_path):
    mapping = {}
    with open(source_path) as inf:
        for line in inf:
            matches = re.match(r"\s+(PCRE2_\S+)\s*:\s*constant\s*:=\s*(\(|)(\S+?)(\)|);\s+--\s+.*", line)
            if matches:
                mapping[matches.group(1)] = matches.group(3)

    outbuffer = []
    with open(target_path) as inf:
        for line in inf:
            matches = re.match(r"(\s+\w+\s*:\s*constant\s+\w+\s*:=\s*)(\S+?)(\s+with\s*Annotate\s*=>\s*\(\s*src\s*,\s*(\w+).*)", line,re.I)
            if matches:
                outbuffer.append(matches.group(1) + mapping[matches.group(4)] + matches.group(3) + "\n")
            else:
                outbuffer.append(line)
    with open(target_path, "w") as outf:
        outf.write("".join(outbuffer))
Update_Constants("src/pcre.ads", "src/gen/pcre-low_level-pcre2_h.ads")
