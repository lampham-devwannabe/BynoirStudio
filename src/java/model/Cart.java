/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author lamph
 */
@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Cart {

    private List<Items> itemList;
    int id;
   
    public Cart() {
        itemList = new ArrayList<>();
    }

    public Cart(List<Items> itemList) {
        this.itemList = itemList;
    }

    public List<Items> getItemList() {
        return itemList;
    }

    public void setItemList(List<Items> itemList) {
        this.itemList = itemList;
    }

    private Items getItemByProductId(int product_id) {
        for (Items i : itemList) {
            if (i.getProduct().getProduct_id() == product_id) {
                return i;
            }
        }
        return null;
    }

    public int getItemQuantityInCart(int product_id) {
        return getItemByProductId(product_id).getQuantity();
    }

    public void addItemToCart(Items i) {
        if (getItemByProductId(i.getProduct().getProduct_id()) != null) {
            Items m = getItemByProductId(i.getProduct().getProduct_id());
            m.setQuantity(m.getQuantity() + i.getQuantity());
        } else {
            itemList.add(i);
        }
    }

    public void removeItemFromCart(int product_id) {
        if (getItemByProductId(product_id) != null) {
            itemList.remove(getItemByProductId(product_id));
        }
    }

    public double getTotalMoney() {
        double temp = 0;
        for (Items i : itemList) {
            temp += (i.getPrice() * i.getQuantity());
        }
        return temp;
    }

    private Products getProductById(int product_id, List<Products> productList) {
        for (Products p : productList) {
            if (p.getProduct_id() == product_id) {
                return p;
            }
        }
        return null;
    }
    
    public static void main(String[] args) {
        Products p = new Products(30, 3, "test", 30000, "", "");
        Products p1 = new Products(31, 5, "gag", 35000, "", "");
        Items i = new Items(p, 2, p.getProduct_price() * 1.1);
        Items i1 = new Items(p1, 3, p1.getProduct_price() * 1.1);
        Cart c = new Cart();
        c.addItemToCart(i);
        c.addItemToCart(i1);
        System.out.println(c.getTotalMoney());
    }
}
