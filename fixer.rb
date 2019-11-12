line = '1,2,3,4,5,"He said "thanks" to the cashier"'
p line
# "1,2,3,4,5,\"He said \"thanks\" to the cashier\""

parts = line.split(",", 6)
p parts
# ["1", "2", "3", "4", "5", "\"He said \"thanks\" to the cashier\""]

text = parts[5]
p text
"\"He said \"thanks\" to the cashier\""

text = text[1...-1]
p text
# "He said \"thanks\" to the cashier"

text.gsub!('"', '""')
p text
# "He said \"\"thanks\"\" to the cashier"

parts[5] = text
p parts
# ["1", "2", "3", "4", "5", "He said \"\"thanks\"\" to the cashier"]

line = parts.join(",")
p line
# "1,2,3,4,5,He said \"\"thanks\"\" to the cashier"

line = '"' + line + '"'
p line
# "\"1,2,3,4,5,He said \"\"thanks\"\" to the cashier\""

# escapes double-quotes in the last field of a CSV line
# assume only the last field is a string
# all others are non-string values
# n is the number of fields
def fix(line, n)    
    parts = line.split(",", n)
    text = parts[-1]             
    text = text[1...-1]          # strip outer double-quotes
    text.gsub!('"', '""')        # escape double-quotes
    parts[-1] = text             
    '"' + parts.join(",") + '"'  # add the outer double-quotes
end

line = '1,2,3,4,5,"He said "thanks" to the cashier"'
p fix(line, 6)
# "\"1,2,3,4,5,He said \"\"thanks\"\" to the cashier\""
