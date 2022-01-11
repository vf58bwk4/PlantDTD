import java.util.function.Function;

import org.antlr.v4.runtime.BailErrorStrategy;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.Parser;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.misc.ParseCancellationException;

public class ImpatientParser<TL extends Lexer, TP extends Parser> {
    private String name;
    private TL lexer;
    public TP parser;
    private Function<TP, ParserRuleContext> action;

    ImpatientParser(
            String parserName,
            CharStream cs,
            Function<CharStream, TL> lexerFabrique,
            Function<TokenStream, TP> parserFabrique,
            Function<TP, ParserRuleContext> parseAction) {
        this.name = parserName;
        this.lexer = lexerFabrique.apply(cs);
        this.parser = parserFabrique.apply(new CommonTokenStream(this.lexer));
        this.parser.setErrorHandler(new BailErrorStrategy());
        this.action = parseAction;
    }

    ParserRuleContext parse(LexerPos lp) {
        lp.toLexer(this.lexer);

        ParserRuleContext tree = null;
        try {
            tree = this.action.apply(this.parser);

            System.err.println("** " + this.name + ": Normal");
        } catch (ParseCancellationException e) {
            RecognitionException re = (RecognitionException) e.getCause();
            if (re != null) {
                tree = (ParserRuleContext) re.getCtx();
                ParserRuleContext p = tree.getParent();
                while (p != null) {
                    tree = p;
                    p = p.getParent();
                }

                var offending = re.getOffendingToken();
                System.err.println("** " + this.name
                        + ": Offending Token = " + offending.getText()
                        // + ", TokenSource = " + offending.getTokenSource().getClass().getName()
                        // + ", index = " + offending.getTokenIndex()
                        // + ", InputStream = " + offending.getInputStream().getClass().getName()
                        + " at " + offending.getStartIndex());
                offending.getInputStream().seek(re.getOffendingToken().getStartIndex());
            }

            System.err.println("** " + this.name + ": Exception");
        }

        lp.fromLexer(this.lexer);
        return tree;
    }
}
