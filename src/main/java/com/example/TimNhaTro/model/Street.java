package com.example.TimNhaTro.model;

import javax.persistence.*;
import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="streets")
public class Street {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long idStreet;

    private Long districtId;

    private Long interfaceStreetId;

    public Long getIdStreet() {
        return idStreet;
    }

    public void setIdStreet(Long idStreet) {
        this.idStreet = idStreet;
    }

    public Long getDistrictId() {
        return districtId;
    }

    public void setDistrictId(Long districtId) {
        this.districtId = districtId;
    }

    public Long getInterfaceStreetId() {
        return interfaceStreetId;
    }

    public void setInterfaceStreetId(Long interfaceStreetId) {
        this.interfaceStreetId = interfaceStreetId;
    }
}
