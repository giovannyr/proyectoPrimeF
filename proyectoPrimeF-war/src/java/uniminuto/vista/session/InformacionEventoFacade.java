/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uniminuto.vista.session;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import uniminuto.entities.InformacionEvento;

/**
 *
 * @author Itech
 */
@Stateless
public class InformacionEventoFacade extends AbstractFacade<InformacionEvento> {
    @PersistenceContext(unitName = "proyectoPrimeF-warPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public InformacionEventoFacade() {
        super(InformacionEvento.class);
    }
    
}
