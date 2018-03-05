package service;

import java.util.List;

import dao.BookDao;
import dto.BookDto;

public class BookService {
   private static BookService bookService;
   public BookDao bookManager;
   
   private BookService() {
      bookManager = new BookDao();
   }
   
   public static BookService getInstance() {
      if(bookService == null) {
         bookService = new BookService();
      }
      return bookService;
   }
   
   public List<BookDto> getBookList() {
      return bookManager.getBookList();
   }
   
   public boolean checkBook(String email) {
      return bookManager.checkBook(email);
   }
   
   public boolean addBook(BookDto bookDto) {
      return bookManager.addBook(bookDto);
   }
   
}