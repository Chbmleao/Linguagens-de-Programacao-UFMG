fun concat nil = ""
 |  concat (h::t) = h ^ concat t;
concat ["ab", "cd", "ef"];

fun concat2 L = foldr (fn(str, item) => str ^ item) "" L;
concat2 ["ab", "cd", "ef"];

