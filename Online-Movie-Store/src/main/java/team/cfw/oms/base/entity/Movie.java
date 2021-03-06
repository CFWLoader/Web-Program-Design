package team.cfw.oms.base.entity;

import org.hibernate.annotations.GenericGenerator;
import team.cfw.oms.business.entity.Order;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by CFWLoader on 10/25/16.
 */
@Entity
public class Movie {

    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid")
    private String id;

    private String movieName;

    private double price;

    private String linkAddress;

    private String picAddress;

    @Column(columnDefinition = "LONGTEXT")
    private String description;

    @ManyToMany(fetch = FetchType.LAZY)
    private Set<Order> orders;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getLinkAddress() {
        return linkAddress;
    }

    public void setLinkAddress(String linkAddress) {
        this.linkAddress = linkAddress;
    }

    public String getPicAddress() {
        return picAddress;
    }

    public void setPicAddress(String picAddress) {
        this.picAddress = picAddress;
    }

    public Set<Order> getOrders() {
        return orders;
    }

    public void setOrders(Set<Order> orders) {
        this.orders = orders;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
