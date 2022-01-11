grammar Arrows;

@lexer::members {
@Override
public void recover(LexerNoViableAltException e) {
	_hitEOF = true;
	System.err.println("** Arrows: EOF");
}

// @Override
// public void notifyListeners(LexerNoViableAltException e) {
// }
}

@parser::members {
public static ParserRuleContext parse(ArrowsParser parser) { return parser.arrows(); }
}

// port    : '$' ENTITY (child)* (':' COMPASS)?;
// child   : '.' ID | '[' (ID | NUMBER) ']';

// ENTITY  : ID;
// COMPASS : 'n' | 's' | 'e' | 'w' | 'c' | '_';
// ID      : [_a-zA-Z][_a-zA-Z0-9]* ;
// NUMBER  : [0-9]+ ;
// WS      : [ \t\n\r]+ -> skip ;

arrows  : (arrow)*;
arrow   : orig=port '->' dest=port;
port    : '$' ENTITY=ID (child)* (':' compass)?;
child   : '.' ID | '[' (ID|NUMBER) ']';
compass : COMPASS='n' | 'ne' | 'nw' | 's' | 'se' | 'sw' | 'e' | 'w' | 'c' | '_';

ID      : [_a-zA-Z][_a-zA-Z0-9]* ;
NUMBER  : [0-9]+ ;
WS      : [ \t\n\r]+ -> skip ;
