import org.antlr.v4.runtime.Lexer;

public class LexerPos {
    private int line;
    private int pos;

    LexerPos() {
        this.line = 0;
        this.pos = 0;
    }

    LexerPos(Lexer lexer) {
        this.fromLexer(lexer);
    }

    LexerPos(LexerPos lp) {
        this.set(lp);
    }

    int getLine() {
        return line;
    }

    int getPos() {
        return pos;
    }

    boolean compare(LexerPos lp) {
        return (this.line == lp.getLine())
                && (this.pos == lp.getPos());
    }

    LexerPos set(LexerPos lp) {
        this.line = lp.getLine();
        this.pos = lp.getPos();
        return this;
    }

    LexerPos fromLexer(Lexer lexer) {
        this.line = lexer.getInterpreter().getLine();
        this.pos = lexer.getInterpreter().getCharPositionInLine();
        return this;
    }

    LexerPos toLexer(Lexer lexer) {
        lexer.getInterpreter().setLine(this.getLine());
        lexer.getInterpreter().setCharPositionInLine(this.getPos());
        return this;
    }

    @Override
    public String toString() {
        return "[" + this.line + "," + this.pos + "]";
    }
}
