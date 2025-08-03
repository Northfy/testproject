package com.example.dao;

import com.example.model.Announcement;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.time.LocalDateTime;
import java.util.List;

public class AnnouncementDao {

    private SessionFactory sessionFactory;

    public AnnouncementDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // 分頁查詢
    public List<Announcement> list(int page, int size) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Announcement ORDER BY publishDate DESC", Announcement.class)
                    .setFirstResult((page - 1) * size)
                    .setMaxResults(size)
                    .list();
        }
    }

    // 總筆數查詢
    public long count() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("SELECT count(a.id) FROM Announcement a", Long.class)
                    .uniqueResult();
        }
    }

    public void save(Announcement ann) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            session.saveOrUpdate(ann);
            tx.commit();
        }
    }

    public Announcement findById(Long id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Announcement.class, id);
        }
    }

    public void delete(Long id) {
        try (Session session = sessionFactory.openSession()) {
            Transaction tx = session.beginTransaction();
            Announcement ann = session.get(Announcement.class, id);
            if (ann != null) {
                session.delete(ann);
            }
            tx.commit();
        }
    }
}