/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.util.List;

/**
 * @param <T>
 * @author Misaki
 */
public interface DAO<T> {
    List<T> getAll();

    T get(int id);

    boolean load();

    boolean add(T t);

    boolean update(T t);

    boolean delete(T t);
}
