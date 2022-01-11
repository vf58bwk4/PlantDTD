import java.util.ArrayList;
import java.util.Objects;
import java.util.stream.Collectors;

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.ParserRuleContext;

public class FirstAttempt {

    static SimpleEntity getEntityFromTree(SQLParser.StatementContext stmCtx) {
        var result = new SimpleEntity();
        // TODO: add collection of CREATE VIEW
        var ctsCtx = stmCtx
                .schema_statement()
                .schema_create()
                .create_table_statement();

        var ids = ctsCtx.schema_qualified_name().identifier();
        // result.name = ids
        // .stream()
        // .map(ic -> ic.getText())
        // .collect(Collectors.joining("."));
        result.name = ids.get(ids.size() - 1).getText();

        result.attributes = ctsCtx
                .define_table()
                .define_columns()
                .table_column_def()
                .stream()
                .filter(tcdn -> Objects.nonNull(tcdn.table_column_definition()))
                .map(tcdn -> new SimpleEntity.SimpleAttribute(tcdn.table_column_definition().identifier().getText()))
                .collect(Collectors.toCollection(ArrayList::new));

        return result;
    }

    public static void printAllSQLEntities(SQLParser.SqlContext sql) {
        if (sql == null) {
            // TODO: implement conventional loggers
            System.err.println("** SQL: tree is empty");
            return;
        }
        var pumlPrinter = new PrinterPlantuml();
        for (var stmCtx : sql.statement()) {
            try {
                var entity = getEntityFromTree(stmCtx);
                System.out.println(pumlPrinter.toPumlEntity(entity));
                // System.out.println(entity.toString());
            } catch (NullPointerException e) {
                e.printStackTrace();
            }

        }
    }

    public static void execute(String fn) {
        try {
            var cs = CharStreams.fromFileName(fn);

            ParserRuleContext tree;
            LexerPos enterLP, currLP = new LexerPos();

            do {
                enterLP = new LexerPos(currLP);

                // TODO: create auxiliary class for parser configuration
                var jsonParser = new ImpatientParser<JSONLexer, JSONParser>(
                        "JSON", cs,
                        JSONLexer::new,
                        JSONParser::new,
                        JSONParser::parse);
                tree = jsonParser.parse(currLP);
                System.out.println(tree.toStringTree(jsonParser.parser));
                System.err.println("** JSON: " + currLP.toString() + "\n");

                var sqlParser = new ImpatientParser<SQLLexer, SQLParser>(
                        "SQL", cs,
                        SQLLexer::new,
                        SQLParser::new,
                        SQLParser::parse);
                tree = sqlParser.parse(currLP);
                // System.out.println(tree.toStringTree(sqlParser.parser));
                printAllSQLEntities((SQLParser.SqlContext) tree);
                System.err.println("** SQL: " + currLP.toString() + "\n");

                var arrowsParser = new ImpatientParser<ArrowsLexer, ArrowsParser>(
                        "Arrows", cs,
                        ArrowsLexer::new,
                        ArrowsParser::new,
                        ArrowsParser::parse);
                tree = arrowsParser.parse(currLP);
                System.out.println(tree.toStringTree(arrowsParser.parser));
                System.err.println("** Arrows: " + currLP.toString() + "\n");

            } while (!currLP.compare(enterLP));

            // // JSONListener listener = new JSONBaseListener();
            // // ParseTreeWalker walker = new ParseTreeWalker();
            // // walker.walk(listener,tree);
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
