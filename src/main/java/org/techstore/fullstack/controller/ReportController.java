package org.techstore.fullstack.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;
import org.techstore.fullstack.model.Report;
import org.techstore.fullstack.service.AdminService;

import java.util.List;

@RestController
@RequestMapping("/api/v1/Repost")
@RequiredArgsConstructor
public class ReportController {
    private final AdminService productService;
    @PostMapping
    public List<Report> SAVE(){
        return productService.SaveReport();
    }

    @PostMapping("/FindName")
    public List<Report> FindName(@RequestParam String name){
        return productService.findbyName(name);
    }

    @GetMapping
    public List<Report> FindALL(){
        return productService.FindAll();
    }
    @DeleteMapping({"{id}"})
    public void DeleteReport(@PathVariable Integer id){
        productService.DeleteRepost(id);
    }



}
