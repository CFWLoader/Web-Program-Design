package team.cfw.oms.business.entity.trans;

/**
 * Created by CFWLoader on 11/16/16.
 */
public class Triple<X, Y, Z> {

    private final X x;

    private final Y y;

    private final Z z;

    public Triple(X x, Y y, Z z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public X getX() {
        return x;
    }

    public Y getY() {
        return y;
    }

    public Z getZ() {
        return z;
    }
}
