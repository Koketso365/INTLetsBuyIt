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
import za.ac.tut.entities.Product;

/**
 *
 * @author 20pre
 */
@Stateless
public class ProductFacade extends AbstractFacade<Product> implements ProductFacadeLocal {

    @PersistenceContext(unitName = "LetsBuyItEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }


    @Override
    public List<Product> getAllProducts() {
        return em.createQuery("SELECT p FROM Product p", Product.class)
                 .getResultList();
    }

    @Override
    public Product findProductById(int productId) {
        return em.find(Product.class, productId);
    }

    @Override
    public void updateProduct(Product product) {
        em.merge(product);
    }

    @Override
    public void deleteProduct(int productId) {
        Product product = em.find(Product.class, productId);
        if (product != null) {
            em.remove(product);
        }
    }
    
}
