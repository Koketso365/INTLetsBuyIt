/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import za.ac.tut.entities.Cart;
import za.ac.tut.entities.Product;
import za.ac.tut.entities.User;

/**
 *
 * @author 20pre
 */
@Stateless
public class CartFacade extends AbstractFacade<Cart> implements CartFacadeLocal {

    @PersistenceContext(unitName = "LetsBuyItEJBModulePU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CartFacade() {
        super(Cart.class);
    }
    
    @Override
    public void addToCart(User user, Product product, int quantity) {
        Cart cartItem = new Cart();
        cartItem.setUser(user);
        cartItem.setProduct(product);
        cartItem.setQuantity(quantity);
        em.persist(cartItem);
    }

    @Override
    public List<Cart> getUserCart(User user) {
        return em.createQuery("SELECT c FROM Cart c WHERE c.user = :user", Cart.class)
                 .setParameter("user", user)
                 .getResultList();
    }

    @Override
    public void removeFromCart(int cartId) {
        Cart cartItem = em.find(Cart.class, cartId);
        if (cartItem != null) {
            em.remove(cartItem);
        }
    }

    @Override
    public void updateCartItemQuantity(int cartId, int newQuantity) 
    {
        Cart cartItem = em.find(Cart.class, cartId);
        if (cartItem != null) {
            cartItem.setQuantity(newQuantity);
            em.merge(cartItem);
        }
    }

    @Override
    public void clearCart(User user) {
        List<Cart> cartItems = getUserCart(user);
        for (Cart item : cartItems) {
            em.remove(em.contains(item) ? item : em.merge(item));
        }
    }
    
}
