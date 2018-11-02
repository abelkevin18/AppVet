package com.appvet.service;

import java.util.List;

import com.appvet.entities.Article;


public interface ArticleService {
	public List<Article> getAllArticles();

	public Article getArticleById(long id);

	public void saveOrUpdate(Article article);

	public void deleteArticle(long id);
}
