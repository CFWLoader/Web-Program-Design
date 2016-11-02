package team.cfw.oms.business.entity;

import javafx.util.Pair;
import team.cfw.oms.base.entity.Movie;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by CFWLoader on 11/2/16.
 */
// This is a transient object for store selected item in session.
public class Cart {

    private List<Pair<String, Integer>> itemList;

    public Cart()
    {
        itemList = new LinkedList<Pair<String, Integer>>();
    }

    public boolean addItemToCart(String uuid, int quantity)
    {
        Pair<String, Integer> target = null;

        for(Pair<String, Integer> pair : itemList)
        {
            if(pair.getKey().equals(uuid))
            {
                target = pair;
            }
        }

        if(target != null)
        {
            quantity += target.getValue();

            itemList.remove(target);
        }

        itemList.add(new Pair<String, Integer>(uuid, quantity));

        return true;
    }

    public boolean removeItemFromCart(String uuid)
    {
        Pair<String, Integer> target = null;

        for(Pair<String, Integer> pair : itemList)
        {
            if(pair.getKey().equals(uuid))
            {
                target = pair;
            }
        }

        if(target != null)
        {
            itemList.remove(target);
        }

        return true;
    }

    public List<Pair<String, Integer>> getItemList() {
        return itemList;
    }
}
