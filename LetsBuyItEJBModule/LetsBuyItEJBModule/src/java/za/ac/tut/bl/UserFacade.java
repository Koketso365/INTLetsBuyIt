/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.bl;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import za.ac.tut.entities.User;

/**
 *
 * @author 20pre
 */
@Stateless
public class UserFacade extends AbstractFacade<User> implements UserFacadeLocal {

    @PersistenceContext(unitName = "LetsBuyItEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UserFacade() {
        super(User.class);
    }
    
    @Override
    public void registerUser(User user) {
        em.persist(user);
    }

    @Override
    public User login(String username, String password,String role) {
         try {
        return em.createQuery("SELECT u FROM User u WHERE u.username = :username AND u.password = :password AND u.role = :role", User.class)
                 .setParameter("username", username)
                 .setParameter("password", password)
                 .setParameter("role", role)
                 .getSingleResult();
    } catch (NoResultException e) {
        return null;
    }
    }

    @Override
    public User findByUsername(String username) {
        try {
            return em.createQuery(
                "SELECT u FROM User u WHERE u.username = :username", User.class)
                .setParameter("username", username)
                .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public User findById(Long userId) {
        return em.find(User.class, userId);
    }
    
}
