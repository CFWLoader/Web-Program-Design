package team.cfw.oms.base.util;

import team.cfw.oms.business.entity.Cart;

import javax.servlet.http.HttpSession;

/**
 * Created by Evan on 2016/1/17.
 */
public class AppContext {

    static String baseUrl = "http://localhost:8080";

    public static String getBaseUrl() {
        return baseUrl;
    }

    public static void setBaseUrl(String baseUrl) {
        AppContext.baseUrl = baseUrl;
    }

    public static Cart getCart(HttpSession session)
    {
        Cart cart = (Cart) session.getAttribute("cart");

        if(cart == null)
        {
            cart = new Cart();

            session.setAttribute("cart", cart);
        }

        return cart;
    }
}
