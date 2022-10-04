/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.util.List;

/**
 *
 * @author Misaki
 * @param <T>
 */
public interface DAO<T> {
    List<T> getAll();
    T get(int id);
    void load();
    void add(T t);
    void update(T t);
    void delete(T t);
}
