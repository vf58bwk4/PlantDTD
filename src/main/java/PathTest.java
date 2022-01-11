import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.ParserRuleContext;

public class PathTest {
    public static void execute(String fn) {
        try {
            var cs = CharStreams.fromFileName(fn);

            ParserRuleContext tree;
            LexerPos lp = new LexerPos();

            var arrowsParser = new ImpatientParser<ArrowsLexer, ArrowsParser>(
                    "Arrows", cs,
                    ArrowsLexer::new,
                    ArrowsParser::new,
                    ArrowsParser::parse);
            tree = arrowsParser.parse(lp);
            System.out.println(tree.toStringTree(arrowsParser.parser));
            System.err.println("** PATH = " + lp.toString() + "\n");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void usage() {
        System.out.println("There will be usage information here.");
    }

    public static void main(String[] args) {
        if (args.length < 1) {
            usage();
        } else {
            execute(args[0]);
        }
    }
}
