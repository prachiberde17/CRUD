package com.kgate.dao;

import java.util.List;

import com.kgate.entity.Book;

public interface BookDao {

	long save(Book book);

	Book get(long id);

	List<Book> list();

	void update(long id, Book book);

	void delete(long id);
	
	Book update2(long id);

}
