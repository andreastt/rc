-- Matches colour scheme used by Emacs in inverted face mode.

local lexers = vis.lexers

lexers.STYLE_DEFAULT = "back:default,fore:white"
lexers.STYLE_NOTHING = "back:black"
lexers.STYLE_CLASS = "fore:red,bold"
lexers.STYLE_COMMENT = "fore:#f0853e"
lexers.STYLE_CONSTANT = "fore:#9ffcd6"
lexers.STYLE_DEFINITION = "fore:red"
lexers.STYLE_ERROR = "fore:red,italics"
lexers.STYLE_FUNCTION = "fore:#aff7a2"
lexers.STYLE_KEYWORD = "fore:#72fbfd,bold"
lexers.STYLE_LABEL = "fore:#9ffcd6"
lexers.STYLE_NUMBER = "fore:white"
lexers.STYLE_OPERATOR = "fore:white"
lexers.STYLE_REGEX = "fore:green"
lexers.STYLE_STRING = "fore:#eda987,italic"
lexers.STYLE_PREPROCESSOR = "fore:#b3c4dc,bold"
lexers.STYLE_TAG = "fore:red,bold"
lexers.STYLE_TYPE = "fore:#6fc2ef,bold"
lexers.STYLE_VARIABLE = "fore:#ecdd8e,bold"
lexers.STYLE_WHITESPACE = ""
lexers.STYLE_EMBEDDED = "back:red,bold"
lexers.STYLE_IDENTIFIER = "fore:white"

lexers.STYLE_LINENUMBER = "fore:white"
lexers.STYLE_LINENUMBER_CURSOR = lexers.STYLE_LINENUMBER
lexers.STYLE_CURSOR = "fore:black,back:white"
lexers.STYLE_CURSOR_PRIMARY = "fore:white,back:red"
lexers.STYLE_CURSOR_LINE = "underlined"
lexers.STYLE_COLOR_COLUMN = "back:red"
lexers.STYLE_SELECTION = "back:#0017c5"
lexers.STYLE_STATUS = "reverse"
lexers.STYLE_STATUS_FOCUSED = "reverse,bold"
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = "fore:default,back:default,bold"
lexers.STYLE_EOF = ""
