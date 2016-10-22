/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Usuario;

import java.util.Date;

/**
 *
 * @author nicop
 */
public class infoSesion{

    private String nickname;
    private String nombre;
    private String apellido;
    private String email;
    private Date fechaN;
    private String foto;

    public infoSesion(){
        this.nickname = nickname = "";
        this.nombre = "";
        this.apellido = "";
        this.email = "";
        this.fechaN = null;
        this.foto = "";
    }
    
    public infoSesion(String nickname, String nombre, String apellido, String email, Date fechaN, String foto) {
        this.nickname = nickname;
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.fechaN = fechaN;
        this.foto = foto;
    }

    /**
     * @return the nickname
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * @param nickname the nickname to set
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the fechaN
     */
    public Date getFechaN() {
        return fechaN;
    }

    /**
     * @param fechaN the fechaN to set
     */
    public void setFechaN(Date fechaN) {
        this.fechaN = fechaN;
    }

    /**
     * @return the foto
     */
    public String getFoto() {
        return foto;
    }

    /**
     * @param foto the foto to set
     */
    public void setFoto(String foto) {
        this.foto = foto;
    }
    
}
