package com.appvet.repository;

import org.springframework.data.repository.CrudRepository;

import com.appvet.entities.Article;



public interface ArticleRepository extends CrudRepository<Article, Long>{

}
