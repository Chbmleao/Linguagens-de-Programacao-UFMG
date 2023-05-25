class WrapperNullException extends Exception {
    public WrapperNullException(String message) {
        super(message);
    }
}

class Wrapper<E> {
    private E o;
    Wrapper() {this.o = null;}
    Wrapper(E o) {this.o = o;}
    E get() throws WrapperNullException {
        if (this.o == null) {
            throw new WrapperNullException("WrapperNullException: Can't get a null wrapper!");
        }
        return o;
    }
}

public class Test {
    public static void main(String a[]) {
        Wrapper<String> w = new Wrapper<String>();
        try {
            System.out.println(w.get().toString());
        } catch (WrapperNullException wn) {
            System.out.println(wn);
        }
    }
}