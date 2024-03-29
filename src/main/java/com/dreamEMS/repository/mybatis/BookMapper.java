package com.dreamEMS.repository.mybatis;

import com.dreamEMS.model.entity.Book;
import com.dreamEMS.repository.BookRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Xiaoyue Xiao
 */
@Mapper
public interface BookMapper extends BookRepository {

    @Override
    List<Book> selectBooksByLowPriceAndHighPrice(@Param("lowPrice") Double lowPrice, @Param("highPrice") Double highPrice);

    @Override
    List<Book> selectBooksByPage(@Param("offset") Integer offset, @Param("perPage") Integer perPage);

}
