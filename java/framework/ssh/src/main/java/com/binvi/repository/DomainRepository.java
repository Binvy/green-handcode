package com.binvi.repository;

import java.io.Serializable;
import java.util.List;

public interface DomainRepository<T, PK extends Serializable> {

    T load(PK id);

    T get(PK id);

    List<T> findAll();

    void persist(T t);

    PK save(T t);

    void saveOrUpdate(T t);

    void delete(PK id);

    void flush();

}
