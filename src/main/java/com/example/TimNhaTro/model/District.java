package com.example.TimNhaTro.model;

import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name="districts")
public class District {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Long idDistrict;

    private String name;

    private String prefix;

    // @ManyToOne, @OneToOne default fetchType : EAGER
    @ManyToOne
    @JoinColumn(name = "province_id")
    @EqualsAndHashCode.Exclude
    @ToString.Exclude
    private Province province;

    public Long getIdDistrict() {
        return idDistrict;
    }

    public void setIdDistrict(Long idDistrict) {
        this.idDistrict = idDistrict;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrefix() {
        return prefix;
    }

    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public Province getProvince() {
        return province;
    }
    public void setProvince(Province province) {
        this.province = province;
    }
}
