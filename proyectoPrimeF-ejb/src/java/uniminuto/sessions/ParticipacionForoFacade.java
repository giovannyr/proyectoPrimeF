/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uniminuto.sessions;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import uniminuto.entities.ParticipacionForo;

/**
 *
 * @author Itech
 */
@Stateless
public class ParticipacionForoFacade extends AbstractFacade<ParticipacionForo> {
    @PersistenceContext(unitName = "proyectoPrimeF-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ParticipacionForoFacade() {
        super(ParticipacionForo.class);
    }
    
}
