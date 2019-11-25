package com.binvi.service.impl;

import com.binvi.entity.Person;
import com.binvi.repository.PersonRepository;
import com.binvi.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author binvi
 * @version 1.0
 * @Description:
 * @date 2019/5/14 23:51
 */
@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonRepository personRepository;

    @Override
    public Long savePerson() {
        Person person = new Person();
        person.setUsername("binvi");
        person.setPhone("13752330376");
        person.setAddress("shan xi");
        person.setRemark("coder");
        return personRepository.save(person);
    }
}
