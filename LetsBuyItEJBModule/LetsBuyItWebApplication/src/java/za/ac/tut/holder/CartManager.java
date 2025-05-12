package za.ac.tut.holder;

import za.ac.tut.entities.Product;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

public class CartManager {
    @SuppressWarnings("unchecked")
    public static List<Product> getCart(HttpSession session) {
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    public static void addToCart(List<Product> cart, Product product) {
        cart.add(product);
    }
}
