package com.example.financePorject.like;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class LikeNotFoundException extends RuntimeException{
    public LikeNotFoundException() {
        super("Like Not Found");
    }
}
