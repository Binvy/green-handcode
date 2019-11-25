package com.binvi.repository.impl;

import com.binvi.entity.Person;
import com.binvi.repository.PersonRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/5/14 23:41
 */
@Repository
public class PersonRepositoryImpl implements PersonRepository {

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.openSession();
    }

    @Override
    public Person load(Long id) {
        return getCurrentSession().load(Person.class, id);
    }

    @Override
    public Person get(Long id) {
        return getCurrentSession().get(Person.class, id);
    }

    @Override
    public List<Person> findAll() {
        return null;
    }

    @Override
    public void persist(Person person) {
        getCurrentSession().persist(person);
    }

    @Override
    public Long save(Person person) {
        return (Long)getCurrentSession().save(person);
    }

    @Override
    public void saveOrUpdate(Person person) {
        getCurrentSession().saveOrUpdate(person);
    }

    @Override
    public void delete(Long id) {
        Person person = load(id);
        getCurrentSession().delete(person);
    }

    @Override
    public void flush() {
        getCurrentSession().flush();
    }
}
