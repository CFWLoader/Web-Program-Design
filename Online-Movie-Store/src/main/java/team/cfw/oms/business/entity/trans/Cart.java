package team.cfw.oms.business.entity.trans;

import team.cfw.oms.base.entity.Movie;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by CFWLoader on 11/2/16.
 */
// This is a trans object for store selected item in session.
public class Cart {

    private List<Triple<String, Integer, Movie>> itemList;

    public Cart()
    {
        itemList = new LinkedList<Triple<String, Integer, Movie>>();
    }

    public boolean addItemToCart(String uuid, int quantity, Movie movie)
    {
        Triple<String, Integer, Movie> target = null;

        for(Triple<String, Integer, Movie> triple : itemList)
        {
            if(triple.getX().equals(uuid))
            {
                target = triple;
            }
        }

        if(target != null)
        {
            quantity += target.getY();

            itemList.remove(target);
        }

        itemList.add(new Triple<String, Integer, Movie>(uuid, quantity, movie));

        return true;
    }

    public boolean removeItemFromCart(String uuid)
    {
        Triple<String, Integer, Movie> target = null;

        for(Triple<String, Integer, Movie> triple : itemList)
        {
            if(triple.getX().equals(uuid))
            {
                target = triple;
            }
        }

        if(target != null)
        {
            itemList.remove(target);
        }

        return true;
    }

    public List<Triple <String, Integer, Movie>> getItemList() {
        return itemList;
    }
}
