/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.Cart;
import za.ac.tut.entities.Product;
import za.ac.tut.entities.User;

/**
 *
 * @author 20pre
 */
@Local
public interface CartFacadeLocal {

    void create(Cart cart);

    void edit(Cart cart);

    void remove(Cart cart);

    Cart find(Object id);

    List<Cart> findAll();

    List<Cart> findRange(int[] range);

    int count();
    
    void addToCart(User user, Product product, int quantity);
    
    List<Cart> getUserCart(User user);
    
    void removeFromCart(int cartId);
    
    void updateCartItemQuantity(int cartId, int newQuantity);
    
    void clearCart(User user);
    
}
