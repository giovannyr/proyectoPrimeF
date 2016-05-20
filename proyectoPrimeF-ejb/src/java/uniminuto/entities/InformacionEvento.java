/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uniminuto.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Itech
 */
@Entity
@Table(name = "informacion_evento")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "InformacionEvento.findAll", query = "SELECT i FROM InformacionEvento i"),
    @NamedQuery(name = "InformacionEvento.findById", query = "SELECT i FROM InformacionEvento i WHERE i.id = :id"),
    @NamedQuery(name = "InformacionEvento.findByTipoRecurso", query = "SELECT i FROM InformacionEvento i WHERE i.tipoRecurso = :tipoRecurso")})
public class InformacionEvento implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "TIPO_RECURSO")
    private String tipoRecurso;
    @JoinTable(name = "recurso_informacion_evento", joinColumns = {
        @JoinColumn(name = "INFORMACION_EVENTO_ID", referencedColumnName = "ID")}, inverseJoinColumns = {
        @JoinColumn(name = "RECURSO_ID", referencedColumnName = "ID")})
    @ManyToMany
    private List<Recurso> recursoList;
    @JoinColumn(name = "EVENTO_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Evento eventoId;

    public InformacionEvento() {
    }

    public InformacionEvento(Integer id) {
        this.id = id;
    }

    public InformacionEvento(Integer id, String tipoRecurso) {
        this.id = id;
        this.tipoRecurso = tipoRecurso;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTipoRecurso() {
        return tipoRecurso;
    }

    public void setTipoRecurso(String tipoRecurso) {
        this.tipoRecurso = tipoRecurso;
    }

    @XmlTransient
    public List<Recurso> getRecursoList() {
        return recursoList;
    }

    public void setRecursoList(List<Recurso> recursoList) {
        this.recursoList = recursoList;
    }

    public Evento getEventoId() {
        return eventoId;
    }

    public void setEventoId(Evento eventoId) {
        this.eventoId = eventoId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof InformacionEvento)) {
            return false;
        }
        InformacionEvento other = (InformacionEvento) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "uniminuto.entities.InformacionEvento[ id=" + id + " ]";
    }
    
}
