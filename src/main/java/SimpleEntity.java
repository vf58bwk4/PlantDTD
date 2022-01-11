import java.util.ArrayList;
import java.util.stream.Collectors;

public class SimpleEntity {
    String name;
    ArrayList<SimpleAttribute> attributes;

    public static class SimpleAttribute {
        String name;

        SimpleAttribute(String name) {
            this.name = name;
        }
    }

    SimpleEntity() {
    }

    SimpleEntity(String name) {
        this.name = name;
    }

    SimpleEntity addAttr(SimpleAttribute attr) {
        attributes.add(attr);
        return this;
    }

    @Override
    public String toString() {
        return this.name + " (" + attributes.stream().map(a -> a.name).collect(Collectors.joining(" ")) + ")";
    }
}
