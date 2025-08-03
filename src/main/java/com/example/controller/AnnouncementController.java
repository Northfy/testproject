package com.example.controller;

import com.example.dao.AnnouncementDao;
import com.example.model.Announcement;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/announcements")
public class AnnouncementController {

    private final AnnouncementDao announcementDao;

    public AnnouncementController() {
        Configuration cfg = new Configuration().configure();
        SessionFactory sessionFactory = cfg.buildSessionFactory();
        this.announcementDao = new AnnouncementDao(sessionFactory);
    }

    @GetMapping
    public String list(@RequestParam(defaultValue = "1") int page, Model model) {
        int size = 10; // 每頁 10 筆

        if (page < 1) {
            page = 1;
        }
        List<Announcement> announcements = announcementDao.list(page, size);
        long totalItems = announcementDao.count();
        int totalPages = (int) Math.ceil((double) totalItems / size);
        if (totalPages < 1) totalPages = 1;
        model.addAttribute("list", announcements);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "list";
    }

    @GetMapping("/new")
    public String form(Model model) {
        model.addAttribute("announcement", new Announcement());
        return "form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Announcement announcement) {
        announcementDao.save(announcement);
        return "redirect:/announcements";
    }

    @GetMapping("/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        model.addAttribute("announcement", announcementDao.findById(id));
        return "form";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        announcementDao.delete(id);
        return "redirect:/announcements";
    }
}