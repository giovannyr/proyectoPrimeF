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
@Table(name = "ciudad")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ciudad.findAll", query = "SELECT c FROM Ciudad c"),
    @NamedQuery(name = "Ciudad.findById", query = "SELECT c FROM Ciudad c WHERE c.id = :id"),
    @NamedQuery(name = "Ciudad.findByNombre", query = "SELECT c FROM Ciudad c WHERE c.nombre = :nombre"),
    @NamedQuery(name = "Ciudad.findByPais", query = "SELECT c FROM Ciudad c WHERE c.pais = :pais"),
    @NamedQuery(name = "Ciudad.findByContinente", query = "SELECT c FROM Ciudad c WHERE c.continente = :continente")})
public class Ciudad implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "NOMBRE")
    private String nombre;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "PAIS")
    private String pais;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 250)
    @Column(name = "CONTINENTE")
    private String continente;
    @JoinTable(name = "foro_ciudad", joinColumns = {
        @JoinColumn(name = "CIUDAD_ID", referencedColumnName = "ID")}, inverseJoinColumns = {
        @JoinColumn(name = "FORO_ID", referencedColumnName = "ID")})
    @ManyToMany
    private List<Foro> foroList;
    @JoinTable(name = "itinerario_ciudad", joinColumns = {
        @JoinColumn(name = "CIUDAD_ID", referencedColumnName = "ID")}, inverseJoinColumns = {
        @JoinColumn(name = "ITINERARIO_ID", referencedColumnName = "ID")})
    @ManyToMany
    private List<Itinerario> itinerarioList;
    @JoinTable(name = "ciudad_hotel", joinColumns = {
        @JoinColumn(name = "CIUDAD_ID", referencedColumnName = "ID")}, inverseJoinColumns = {
        @JoinColumn(name = "HOTEL_ID", referencedColumnName = "ID")})
    @ManyToMany
    private List<Hotel> hotelList;
    @JoinTable(name = "evento_ciudad", joinColumns = {
        @JoinColumn(name = "CIUDAD_ID", referencedColumnName = "ID")}, inverseJoinColumns = {
        @JoinColumn(name = "EVENTO_ID", referencedColumnName = "ID")})
    @ManyToMany
    private List<Evento> eventoList;
    @JoinColumn(name = "USUARIO_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Usuario usuarioId;

    public Ciudad() {
    }

    public Ciudad(Integer id) {
        this.id = id;
    }

    public Ciudad(Integer id, String nombre, String pais, String continente) {
        this.id = id;
        this.nombre = nombre;
        this.pais = pais;
        this.continente = continente;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getContinente() {
        return continente;
    }

    public void setContinente(String continente) {
        this.continente = continente;
    }

    @XmlTransient
    public List<Foro> getForoList() {
        return foroList;
    }

    public void setForoList(List<Foro> foroList) {
        this.foroList = foroList;
    }

    @XmlTransient
    public List<Itinerario> getItinerarioList() {
        return itinerarioList;
    }

    public void setItinerarioList(List<Itinerario> itinerarioList) {
        this.itinerarioList = itinerarioList;
    }

    @XmlTransient
    public List<Hotel> getHotelList() {
        return hotelList;
    }

    public void setHotelList(List<Hotel> hotelList) {
        this.hotelList = hotelList;
    }

    @XmlTransient
    public List<Evento> getEventoList() {
        return eventoList;
    }

    public void setEventoList(List<Evento> eventoList) {
        this.eventoList = eventoList;
    }

    public Usuario getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(Usuario usuarioId) {
        this.usuarioId = usuarioId;
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
        if (!(object instanceof Ciudad)) {
            return false;
        }
        Ciudad other = (Ciudad) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "uniminuto.entities.Ciudad[ id=" + id + " ]";
    }
    
}
