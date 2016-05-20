/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uniminuto.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Itech
 */
@Entity
@Table(name = "participacion_foro")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ParticipacionForo.findAll", query = "SELECT p FROM ParticipacionForo p"),
    @NamedQuery(name = "ParticipacionForo.findById", query = "SELECT p FROM ParticipacionForo p WHERE p.id = :id"),
    @NamedQuery(name = "ParticipacionForo.findByFecha", query = "SELECT p FROM ParticipacionForo p WHERE p.fecha = :fecha")})
public class ParticipacionForo implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ID")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "PARTICIPACION")
    private String participacion;
    @Basic(optional = false)
    @NotNull
    @Column(name = "FECHA")
    @Temporal(TemporalType.TIMESTAMP)
    private Date fecha;
    @JoinColumn(name = "FORO_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Foro foroId;
    @JoinColumn(name = "USUARIO_ID", referencedColumnName = "ID")
    @ManyToOne(optional = false)
    private Usuario usuarioId;

    public ParticipacionForo() {
    }

    public ParticipacionForo(Integer id) {
        this.id = id;
    }

    public ParticipacionForo(Integer id, String participacion, Date fecha) {
        this.id = id;
        this.participacion = participacion;
        this.fecha = fecha;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getParticipacion() {
        return participacion;
    }

    public void setParticipacion(String participacion) {
        this.participacion = participacion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Foro getForoId() {
        return foroId;
    }

    public void setForoId(Foro foroId) {
        this.foroId = foroId;
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
        if (!(object instanceof ParticipacionForo)) {
            return false;
        }
        ParticipacionForo other = (ParticipacionForo) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "uniminuto.entities.ParticipacionForo[ id=" + id + " ]";
    }
    
}
