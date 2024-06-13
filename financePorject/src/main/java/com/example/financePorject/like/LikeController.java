package com.example.financePorject.like;

import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/likes")
public class LikeController {

    private final LikeRepository likeRepository;


    public LikeController(LikeRepository likeRepository) {
        this.likeRepository = likeRepository;
    }

    @GetMapping("")
    List<Like> findAll() {
        return likeRepository.findAll();
    }

    @GetMapping("/user/{id}")
    List<Like> findById(@PathVariable String id) {
        List<Like> like = likeRepository.findByUserId(id);
        if(like.isEmpty()){
            throw new LikeNotFoundException();
        }
        else{
            return like;
        }
    }
    // post
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("")
    void create(@Valid @RequestBody Like like) {
        likeRepository.create(like);
    }

    // put
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @PutMapping("")
    void update(@Valid @RequestBody Like newLike) {
        likeRepository.update(newLike);
    }

    // delete
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping("/{id}")
    void remove(@PathVariable int id) {
        likeRepository.remove(id);
    }
}
