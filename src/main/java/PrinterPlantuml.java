public class PrinterPlantuml {

    public String toPumlEntity(SimpleEntity se) {
        return _toPumlSmth(se, "entity");
    }

    public String toPumlClass(SimpleEntity se) {
        return _toPumlSmth(se, "class");
    }

    private String _toPumlSmth(SimpleEntity se, String smth) {
        StringBuilder result = new StringBuilder().append(smth).append(" ").append(se.name).append(" {\n");
        se.attributes.stream().forEach(att -> {
            result.append(" ").append(att.name).append("\n");
        });
        result.append("}\n");

        return result.toString();
    }
}
