package com.project.main.mj_guestBook;

import java.util.List;

public interface GuestBookMapper {

	List<GuestBook> showAllGuestBook(GuestBook gb);

	int regGuestBook(GuestBook gb);

	int guestBookDelete(GuestBook gb);

}
