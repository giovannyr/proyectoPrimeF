/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uniminuto.vista.session;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import uniminuto.entities.Itinerario;

/**
 *
 * @author Itech
 */
@Stateless
public class ItinerarioFacade extends AbstractFacade<Itinerario> {
    @PersistenceContext(unitName = "proyectoPrimeF-warPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ItinerarioFacade() {
        super(Itinerario.class);
    }
    
}
